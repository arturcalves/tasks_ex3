package tasks

class TaskController {

    def index() { 
    	[categories : Category.findAll()]
    }

    def getall(){
    	def mapa = [:]

		Task.findAll().collect(){
			mapa.put(it.id, it.toArray())
		}

    	render(contentType: "text/json") { 
			mapa
    	}
    }

	def get() {  
    	render(contentType: "text/json") {
    		Task.get(params.id).toArray()
    	}    	
    }

    def delete(){    	
    	Task.get(params.id).delete(flush:true)
    	render(contentType: "text/json") {
    		json
    	}
    }


	def save(){
		def task
		if (params.id == '') {
			task = new Task()
		}else{
			task = Task.get(params.id)
		}
		task.completed = params.completed
		task.task = params.task
		task.category = Category.get(params.category)
		task.requiredBy = new Date().parse('yyyy-MM-dd',params.requiredBy)
		task.save(flush: true)
		render(contentType: "text/json") {
			json
		}
	}
}
