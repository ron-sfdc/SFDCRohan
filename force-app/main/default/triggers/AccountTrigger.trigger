trigger AccountTrigger on Account (before insert, after insert, before update, after update, before delete, after delete, after undelete) {
	
    if(Trigger.isBefore && Trigger.isInsert) {
        System.debug('### Before insert');
        System.debug('### Trigger.new '+Trigger.new);
        System.debug('### Trigger.newMap '+Trigger.newMap);
        System.debug('### Trigger.old '+Trigger.old);
        System.debug('### Trigger.oldmap '+Trigger.old);
        
    }
    if(Trigger.isAfter && Trigger.isInsert ) {
        System.debug('### After Insert');
        System.debug('### Trigger.new '+Trigger.new);
        System.debug('### Trigger.newMap '+Trigger.newMap);
        System.debug('### Trigger.old '+Trigger.old);
        System.debug('### Trigger.oldmap '+Trigger.old);
    }
    if(Trigger.isBefore &&  Trigger.isUpdate) {
        System.debug('### Before Update');
        System.debug('### Trigger.new '+Trigger.new);
        System.debug('### Trigger.newMap '+Trigger.newMap);
        System.debug('### Trigger.old '+Trigger.old);
        System.debug('### Trigger.oldmap '+Trigger.old);
    }
    if(Trigger.isAfter && Trigger.isUpdate ) {
        System.debug('### After Update');
        System.debug('### Trigger.new '+Trigger.new);
        System.debug('### Trigger.newMap '+Trigger.newMap);
        System.debug('### Trigger.old '+Trigger.old);
        System.debug('### Trigger.oldmap '+Trigger.old);
    }
    if(Trigger.isBefore && Trigger.isDelete) {
        System.debug('### Before Delete');
        System.debug('### Trigger.new '+Trigger.new);
        System.debug('### Trigger.newMap '+Trigger.newMap);
        System.debug('### Trigger.old '+Trigger.old);
        System.debug('### Trigger.oldmap '+Trigger.old);
    }
    if(Trigger.isAfter && Trigger.isDelete ) {
        System.debug('### After Delete');
        System.debug('### Trigger.new '+Trigger.new);
        System.debug('### Trigger.newMap '+Trigger.newMap);
        System.debug('### Trigger.old '+Trigger.old);
        System.debug('### Trigger.oldmap '+Trigger.old);
    }
    if(Trigger.isAfter && Trigger.isUndelete ) {
        System.debug('### After Undelete');
        System.debug('### Trigger.new '+Trigger.new);
        System.debug('### Trigger.newMap '+Trigger.newMap);
        System.debug('### Trigger.old '+Trigger.old);
        System.debug('### Trigger.oldmap '+Trigger.old);
    }
    
}