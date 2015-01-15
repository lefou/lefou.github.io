<#include "header.ftl">
	
	<#include "menu.ftl">

<!--
	<div class="page-header">
		<h1>Tobias Roeser's Blog</h1>
	</div>
-->
	
	<#assign maxpostcount=5>
    <#assign postcount=0>
	<#list posts as post>
  		<#if (post.status == "published" && post.date?? && postcount < maxpostcount)>
  			<#assign postcount = postcount + 1>
  			<h2><a href="${post.uri}"><#escape x as x?xml>${post.title}</#escape></a></h2>
  			<p><em>${post.date?string("dd MMMM yyyy")}</em></p>
  			<#if postcount = 1>
  			  <p>${post.body}</p>
  			<#else>
  			  <#if post.summary??>
  			      <p>${post.summary}</p>
  			  </#if>
  			</#if>
  			<p><a href="${post.uri}">Read more...</a></p>
  		</#if>
  	</#list>

    <p><a href="/${config.archive_file}">Read all News...</a></p>
	
<#include "footer.ftl">