public with sharing class OpportunityBO {
    


    public static void criarOportunidadeRenovacao( List<Opportunity> oportunidades_contexto_trigger, Map<Id, Opportunity> oportunidades_contexto_trigger_old){
        List<Opportunity> oportunidades_para_inserir = new List<Opportunity>();
        
            for(Opportunity opp : oportunidades_contexto_trigger){
            
                Opportunity old_opp = oportunidades_contexto_trigger_old.get(opp.Id);
            
                if(opp.IsClosed == true && old_opp.IsClosed == false){
                
                    Opportunity newOportunidade = new Opportunity();
                    newOportunidade.Name = 'Renovação';
                    newOportunidade.StageName = 'Prospecting';
                    newOportunidade.AccountId = opp.AccountId;
                    newOportunidade.CloseDate = System.today().addDays(30);

                    oportunidades_para_inserir.add(newOportunidade);
                
                }
            
            }
        
            if(!oportunidades_para_inserir.isEmpty()){
                insert oportunidades_para_inserir;
            }
    }

    public static void criarTaskLigacao(List<Opportunity> opportunities){

        List<Task> tarefas = new List<Task>();

        for(Opportunity opp : opportunities){
            Task tarefa = new Task();
            tarefa.Subject = 'Call';
            tarefa.TaskSubtype = 'Task';
            tarefa.WhatId = opp.Id;
            tarefa.ActivityDate = System.today();
            tarefa.OwnerId = opp.OwnerId;
            tarefa.Status = 'Not Started';

            tarefas.add(tarefa);
        }

        if(!tarefas.isEmpty()){
            insert tarefas;
        }

    }

}