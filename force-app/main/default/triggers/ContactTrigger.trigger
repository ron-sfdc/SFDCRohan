trigger ContactTrigger on Contact (after insert) {
	ContactTriggerHandler.calculateTotalConRecords(Trigger.newMap);
}