public class OpportunityTriggerHandler {

    List<Opportunity> oportunidades_contexto_trigger = (List<Opportunity>) Trigger.new;
    
    Map<Id, Opportunity> oportunidades_contexto_trigger_old = (Map<Id, Opportunity>) Trigger.oldMap;

    public OpportunityTriggerHandler() {

    }

    public void run(){
        this.beforeInsert();
        this.afterInsert();
        this.beforeUpdate();
        this.afterUpdate();
    }

    private void beforeInsert(){

    }

    private void beforeUpdate(){

    }

    private void afterInsert(){
        if(Trigger.isAfter && Trigger.isInsert){
            OpportunityBO.criarTaskLigacao(oportunidades_contexto_trigger);
        }
        
    }

    private void afterUpdate(){
        if(Trigger.isAfter && Trigger.isUpdate){
            OpportunityBO.criarOportunidadeRenovacao(this.oportunidades_contexto_trigger, this.oportunidades_contexto_trigger_old);
        }
    

    }




}