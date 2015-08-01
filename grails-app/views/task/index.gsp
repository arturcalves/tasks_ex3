<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Tarefas</title>
<asset:stylesheet src="styles/02-tasks.css" />
<asset:javascript src="scripts/jquery-2.1.4.min.js"/>
<asset:javascript src="scripts/jquery-tmpl.js"/>
<asset:javascript src="scripts/jquery-serialization.js"/>
<asset:javascript src="scripts/date.js"/>
<asset:javascript src="scripts/tasks-controller.js"/>
<asset:javascript src="scripts/jquery.validate.js"/>
<asset:javascript src="scripts/tasks-webstorage.js"/>
<asset:javascript src="scripts/tasks-indexeddb.js"/>
<asset:javascript src="scripts/tasks-ajax.js"/>

</head>
<body>
	<header>
		<span>Lista de Tarefas</span>
	</header>
	<main id="taskPage">
		<section id="taskCreation" class="not">
			<form id="taskForm">
				<input type="hidden" name="id" />
				<!--*********************************************************-->
				<!-- TAREFA 4 - Marcar tarefa como completada                -->
				<!-- adicionado campo de formulario com o name 'completed'   -->
				<!-- isso fará com que os objetos de tasks tenham mais um    -->
				<!-- atributo de mesmo nome                                  -->
				<!-- o campo é do tipo hidden pois não poderá ser editado e  -->
				<!-- e sempre que uma tarefa for adicionada receberá o valor --> 
				<!-- false                                                   -->
				<!--*********************************************************-->
				<input type="hidden" name="completed" value='false' />
				<div>
					<label>Tarefa</label> 
					<input type="text" required="required" name="task" class="large" placeholder="Estudar e programar" maxlength="200" />
				</div>
				<div>
					<label>Finalizar até</label> <input type="date" required="required" name="requiredBy" />
				</div>
				<div>
					<label>Categoria</label> 
					<select name="category">
						<g:each in="${categories}">
 							<option value="${it.id}">${it.nome}</option>						
 						</g:each>
					</select>
				</div>
				<nav>
					<a href="#" id="saveTask">Salvar tarefa</a> <a href="#" id="clearTask">Limpar tarefa</a>
				</nav>
			</form>
		</section>
		<section>
			<table id="tblTasks">
				<colgroup>
					<col width="40%">
					<col width="15%">
					<col width="15%">
					<col width="30%">
				</colgroup>
				<thead>
					<tr>
						<th>Nome</th>
						<th>Deadline</th>
						<th>Categoria</th>
						<th>Ações</th>
					</tr>
				</thead>
				<tbody>
					
				</tbody>
			</table>
			<nav>
				<a href="#" id="btnAddTask">Adicionar tarefa</a>
			</nav>
		</section>
	</main>
	<!--*********************************************************-->
	<!-- TAREFA 1 - Contagem no rodapé                           -->
	<!-- no rodapé foi adicionado um elemento com id  taskCount  -->
	<!-- que receberá o valor calculado da quantidade de tarefas -->
	<!--*********************************************************-->
	<footer>Você tem <span id="taskCount">0</span> tarefas</footer>
</body>
<script>
//*********************************************************
// TAREFA 6 - Persistencia com IndexedDB
// Da forma que foi proposto, caso o navegador tenha compatibilidade com o indexdb
// tenta-se iniciar o uso da api do indexeddb
// caso não contrário, verifica-se a compatibilidade como localStorage
// e faz-se o uso da api do webstorage
// em ambos os casos, em caso de sucesso executa o metodo initMetodo, 
// que executa a funcao init e na sequencia carrega a tabela com a funcao loadTasks
// ********************************************************

$.getScript( "/tasks_ex3/assets/scripts/tasks-ajax.js" )
.done(function( script, textStatus ) {
	initMetodo();
})
.fail(function( jqxhr, settings, exception ) {
	console.log( 'Failed to load indexed db script' );
});

function initMetodo(){
	$(document).ready(function() {
		tasksController.init($('#taskPage'), function() {
			tasksController.loadTasks();
		});
	});
}
</script>
<script id="taskRow" type="text/x-jQuery-tmpl">
<tr>
	<td>{{= task}}</td>
	<td><time datetime="{{= requiredBy}}"> {{= requiredBy}}</time></td>
	<td>{{= category_nome}}</td>
	<td>
		<nav>
			<a href="#" class="editRow" data-task-id="{{= id}}">Editar</a>
				<!--*********************************************************-->
				<!-- TAREFA 4 - Marcar tarefa como completada                -->
				<!-- adicionado classe completeRow para associar funcao ao   -->
				<!-- clique, e adicionado atributo data-task-id para saber   -->
				<!-- o id da tarefa que deve ser completada                  -->
				<!--*********************************************************-->
			<a href="#" class="completeRow" data-task-id="{{= id}}">Completar</a>
			<a href="#" class="deleteRow" data-task-id="{{= id}}">Deletar</a>
		</nav>
	</td>
</tr>
</script>
</html>
