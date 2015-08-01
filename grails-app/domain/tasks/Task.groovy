package tasks

class Task {

	Integer id

	String task

	Date requiredBy

	Boolean completed

	Category category

	static belongsTo = Category

    static constraints = {
    }
}
