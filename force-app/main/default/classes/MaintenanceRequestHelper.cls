public with sharing class MaintenanceRequestHelper {
    
    public static void updateWorkOrders(List<Case> lstofNewcases, Map<Id, Case> mapOfIdAndCaseOld) {
        Set<Id> setOfCaseIds = new Set<Id>();
        for(Case rec : lstofNewcases) {
            if(rec.Status == 'Closed' && mapOfIdAndCaseOld.get(rec.Id).Status != rec.Status && (rec.Type == 'Repair' || rec.Type == 'Routine Maintenance')){
                setOfCaseIds.add(rec.Id);
            }            
        }
        Map<Id, Decimal> mapOfCaseIdAndCycle = new Map<Id, Decimal>();
        Map<Id, List<Equipment_Maintenance_Item__c>> mapOfCaseIdAndEMIToBeCreated = new Map<Id, List<Equipment_Maintenance_Item__c>>();
        for(Equipment_Maintenance_Item__c rec : [SELECT Id, Equipment__c, Quantity__c, Maintenance_Request__c, Equipment__r.Maintenance_Cycle__c FROM Equipment_Maintenance_Item__c WHERE Maintenance_Request__c IN:setOfCaseIds]) {
            if(mapOfCaseIdAndCycle.get(rec.Maintenance_Request__c)!=NULL) {
                if(mapOfCaseIdAndCycle.get(rec.Maintenance_Request__c) > rec.Equipment__r.Maintenance_Cycle__c) {
                	mapOfCaseIdAndCycle.put(rec.Maintenance_Request__c, rec.Equipment__r.Maintenance_Cycle__c);    
                }
            } else {
                mapOfCaseIdAndCycle.put(rec.Maintenance_Request__c, rec.Equipment__r.Maintenance_Cycle__c);
            }
            Equipment_Maintenance_Item__c recToBeCreated = new Equipment_Maintenance_Item__c();
            recToBeCreated.Equipment__c = rec.Equipment__c;
            recToBeCreated.Quantity__c = rec.Quantity__c;
            if(mapOfCaseIdAndEMIToBeCreated.get(rec.Maintenance_Request__c)!= NULL) {
                mapOfCaseIdAndEMIToBeCreated.get(rec.Maintenance_Request__c).add(recToBeCreated);
            } else {
                List<Equipment_Maintenance_Item__c> lstOfNewRec = new List<Equipment_Maintenance_Item__c>{recToBeCreated};
                mapOfCaseIdAndEMIToBeCreated.put(rec.Maintenance_Request__c, lstOfNewRec);
            }
            
        }
        Date todayDate = System.today();
        Map<Id, Id> mapOfOldAndNewCaseId = new Map<Id, Id>();
        List<Case> lstOfCasesToBeCreated = new List<Case>();
        for(Case rec : lstofNewcases) {
            if(rec.Status == 'Closed' && mapOfIdAndCaseOld.get(rec.Id).Status != rec.Status && (rec.Type == 'Repair' || rec.Type == 'Routine Maintenance')) {
                Case newCase = new Case();
                newCase.Subject = rec.Subject;
                newCase.Date_Reported__c = todayDate;
                newCase.Type = 'Routine Maintenance';
                newCase.Date_Due__c = todayDate.addDays(Integer.valueOf(mapOfCaseIdAndCycle.get(rec.Id)));
                newCase.Vehicle__c = rec.Vehicle__c;// != NULL? rec.Vehicle__c:NULL;
                newCase.ParentId = rec.Id;
                newCase.ProductId = rec.ProductId;// != NULL?rec.ProductId:NULL;
                lstOfCasesToBeCreated.add(newCase);
            }
        }
        
        Database.SaveResult[] srList = Database.insert(lstOfCasesToBeCreated, false);

        Set<Id> setOfCasesCreated = new Set<Id>();
        for (Database.SaveResult sr : srList) {
            if (sr.isSuccess()) {
				setOfCasesCreated.add(sr.getId());
            }
        }
        
        List<Case> lstOfCasesJustCreated = new List<Case>();
        lstOfCasesJustCreated = [SELECT id, ParentId FROM Case where Id in:setOfCasesCreated and Vehicle__c = NULL];
        List<Equipment_Maintenance_Item__c> lstOfEMIToBeCreated = new List<Equipment_Maintenance_Item__c>();
        for(Case rec : lstOfCasesJustCreated) {
            for(Equipment_Maintenance_Item__c recEMI : mapOfCaseIdAndEMIToBeCreated.get(rec.ParentId)) {
                recEMI.Maintenance_Request__c = rec.Id;
                lstOfEMIToBeCreated.add(recEMI);
            }
        }
        Insert lstOfEMIToBeCreated;
    }
    
}