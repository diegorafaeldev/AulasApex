trigger AccountTrigger on Account (after insert, before update) {
    
    //threads
    //por que staticos?
    //quando é objeto?
    //after? before?
    //insert? delete? update?
    //after insert, after update. por que não before? 
    //before insert, befor update, before delete
    
    List<Opportunity> oportunidades = new List<Opportunity>();
    
    
    
    for(Account conta : (List<Account>)Trigger.new){
        
        
        oportunidades.add(
            new Opportunity(
                Name = 'Primeira negociacao',
            	AccountId = conta.Id,
                StageName = 'Prospecting',
            	CloseDate = System.today() + 30 ));
        
        
    }
    
    insert oportunidades;

}