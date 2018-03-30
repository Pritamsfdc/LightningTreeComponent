({
    getLeadtree : function(component, event, helper) {
        var spinner = component.find("spnr");
        var action = component.get('c.getLeadTree');
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === 'SUCCESS'){
                //get lead and respective task list, and initialize with items
                component.set('v.items', response.getReturnValue());
                //hide spinner after getting data
                $A.util.toggleClass(spinner, "slds-hide");
            }else{
                $A.util.toggleClass(spinner, "slds-hide");
                alert('ERROR');
            }
        });
        $A.enqueueAction(action);
        
    },
    getTaskDetails : function(component, TaskId) {
        var action = component.get('c.getTaskDetails');
        
        action.setParams({
            recordId : TaskId
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            //get task information and initialize with task attribute
            component.set('v.task', response.getReturnValue());
            component.set("v.isOpen", true);
            
        });
        $A.enqueueAction(action);    
    }
})
