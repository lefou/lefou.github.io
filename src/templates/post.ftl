<#include "header.ftl">
	
	<#include "menu.ftl">
	
	<div class="page-header">
		<h1><#escape x as x?xml>${content.title}</#escape></h1>
	</div>

	<p><em>${content.date?string("dd MMMM yyyy")} <#if content.author??>by ${content.author}</#if></em></p>

	<p>${content.body}</p>

<#include "footer.ftl">