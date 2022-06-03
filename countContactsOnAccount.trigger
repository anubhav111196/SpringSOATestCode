trigger countContactsOnAccount on Contact (after insert, after update) {

    Integer value;
    Set<Id> accountIdSet = new Set<Id>();
    
    for (Contact c:Trigger.new)
    {
        if(c.AccountId!=null)
        {
            accountIdSet.add(c.AccountId);
        }
    }
    
    List<Account> numberOfContactsOnAccount = [Select Id,Name,anubhav111196__Number_Of_Contacts__c,(Select id from contacts) from Account where Id IN : accountIdSet];
    List<Account> accToBeUpdated = new List<Account>();
        for(Account acc:numberOfContactsOnAccount)
        {
            acc.anubhav111196__Number_Of_Contacts__c = acc.contacts.size();
            accToBeUpdated.add(acc);
        }
      
    if(accToBeUpdated.size() > 0)
    {
        update accToBeUpdated;
    }
    
    
}