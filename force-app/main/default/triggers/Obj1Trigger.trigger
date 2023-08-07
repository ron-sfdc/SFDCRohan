trigger Obj1Trigger on Obj1__c (after delete) {
	Obj1TriggerHandler.afterDelete(Trigger.oldMap);	
}