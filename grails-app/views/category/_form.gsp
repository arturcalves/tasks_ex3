<%@ page import="tasks.Category" %>



<div class="fieldcontain ${hasErrors(bean: categoryInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="category.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${categoryInstance?.nome}"/>

</div>

