public class Obj1TriggerHandler {
    public static void afterDelete(Map<Id, Obj1__c> mapOfIdAndObj1) {
        
        Set<Id> setOfObj2Id = new Set<Id>();
        for(Obj1__c rec : mapOfIdAndObj1.values()) {
            setOfObj2Id.add(rec.Obj2__c);
        }
        List<Obj2__c> lstOfObj2 = [SELECT id from Obj2__c where id in: setOfObj2Id];
        DELETE lstOfObj2;
    }
}