public class LightningTreeAuraController{
    
    @AuraEnabled
    public static List<item> getLeadTree(){
        
        List<item> items = new List<item>();
        List<Lead> leadList = new List<Lead>();
        //get list of leads and respective tasks
        leadList = [SELECT Id, Name, (SELECT Id, Subject From Tasks) From Lead LIMIT 10];
        for(Lead lead: leadList){
            
            //get task of current lead record
            List<item> taskItems = new List<item>();
            for(Task task: lead.Tasks){
                //add task items
                item taskItem = new item('Task :'+ task.Subject, String.valueOf(task.Id), false, null);
                taskItems.add(taskItem);
            }
            
            //add lead items
            item leadItem = new item('Lead :' +lead.Name, String.valueOf(lead.Id), false, taskItems);
            items.add(leadItem);
        }
        return items;
    }
    
    //Item Wrapper Class
    public class item{
        @AuraEnabled
        public String label {get; set;}
        @AuraEnabled
        public String name {get; set;}
        @AuraEnabled
        public Boolean expanded {get; set;}
        @AuraEnabled
        public List<item> items {get; set;}
        
        public item(String label, String name, Boolean expanded, List<item> items){
            this.label = label;
            this.name = name;
            this.expanded = expanded;
            this.items = items;
        }
    }
     //get task information based on Subject click
    @AuraEnabled
    public static Task getTaskDetails(Id recordId){
        Task task = [Select id,Subject,Owner.Name,Description,ActivityDate,Status from Task where Id=:recordId];
        return task;
        
    }
}
