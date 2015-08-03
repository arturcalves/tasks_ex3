package tasks

class Task {

	Integer id

	String task

	Date requiredBy

	String completed

	Category category

	static belongsTo = Category

    static constraints = {
    }

    def toArray() {
    	return [id: this.id, task: this.task, requiredBy: this.requiredBy.format('yyyy-MM-dd'), completed: this.completed, 
			category: this.category.id, category_nome: this.category.nome]
    }
}
