<#include "header.ftl">
	
	<#include "menu.ftl">

<!--
	<div class="page-header">
		<h1>Tobias Roeser's Blog</h1>
	</div>
-->
	
	<h2><small>Latest blog posts</small></h2>
	
	<#assign maxpostcount=5>
    <#assign postcount=0>
	<#list posts as post>
  		<#if (post.status == "published" && post.date?? && postcount < maxpostcount)>
  			<#assign postcount = postcount + 1>
  			<h3><a href="${post.uri}"><#escape x as x?xml>${post.title}</#escape></a></h3>
  			<p><em>${post.date?string("dd MMMM yyyy")}</em></p>
			<#if post.summary??>
  				<p>${post.summary}</p>
  			<#else>
  				<p>${post.body}</p>
  			</#if>
  			<p><a href="${post.uri}">Read more...</a></p>
  		</#if>
  	</#list>

    <p><a href="/${config.archive_file}">List all blog posts...</a></p>
	
<#include "footer.ftl">