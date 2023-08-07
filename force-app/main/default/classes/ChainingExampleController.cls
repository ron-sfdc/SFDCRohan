public with sharing class ChainingExampleController {
    @AuraEnabled
    public static string methodName1(){
        return '1';
    }


    @AuraEnabled
    public static string methodName2(){
        return '2';
    }


    @AuraEnabled
    public static string methodName3(){
        return '3';
    }


    @AuraEnabled
    public static string methodName4(){
        return '4';
    }
}