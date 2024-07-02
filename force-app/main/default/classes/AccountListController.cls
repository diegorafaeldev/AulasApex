public with sharing class AccountListController {

    @AuraEnabled
    public static List<Account> getAccounts(){

        return [ SELECT Id, Name, Phone FROM Account ];

    }
}