package tasks

class TaskController {

    def index() { }

    def getlist(){
    	render(contentType: "text/json") { 
			Tasks.findAll().each(){
    			[id: it.id, task: it.task, requiredBy: it.requiredBy, completed: it.completed, category: it.category.nome]
    		}
    	}
    }
}
