<#include "header.ftl">
	
	<#include "menu.ftl">
	
	<div class="page-header">
		<h1><#escape x as x?xml>${content.title}</#escape></h1>
	</div>

	<p><em>${content.date?string("dd MMMM yyyy")} <#if content.author??>by ${content.author}</#if></em></p>

	<p>${content.body}</p>
	
		<#list published_posts as post>
		  <#if !(prevUrl??)>
            <#if curUrlFound??>
		      <#assign prevUrl = post.uri>
		    </#if>
		    <#if post.uri == content.uri>
		      <#if visitedUrl??><#assign nextUrl = visitedUrl></#if>
		      <#assign curUrlFound = "1">
		    </#if>
		    <#assign visitedUrl = post.uri>
		  </#if>
		</#list>
		
	    <ul class="pager">
		  <#if prevUrl??>
		    <li class="previous"><a href="/${prevUrl}">&larr; Older</a></li>
		  <#else>
		    <li class="previous disabled"><a href="#">&larr; Older</a></li>
		  </#if>
		    <li><a href="/${config.archive_file}">List all blog posts</a></li>
		  <#if nextUrl??>
		    <li class="next"><a href="/${nextUrl}">Newer &rarr;</a></li>
		  <#else>
		    <li class="next disabled"><a href="#">Newer &rarr;</a></li>
		  </#if>
		</ul>

<#include "footer.ftl">