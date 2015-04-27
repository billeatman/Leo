<cfcomponent displayname="Page Service" output="false" hint="binds a page request to the proper rendering template.">

<cffunction name="getPageById" output="false" access="public" returntype="string" hint="Gets the requested page data rendered with the page template.">
   	<cfargument name="page_id" required="false" default="">
    <cfargument name="history_id" required="false" default="">
    <cfargument name="site_config" required="true">

	<cfset var LOCAL = structNew()>
    <cfset var sc = arguments.site_config>
    
    <cfset LOCAL.baseCFCPath = "#sc.cfMappedPath#.#sc.sitepath#">

	<!--- Get the core data object --->
	<cfset LOCAL.page = createObject("component", "#LOCAL.baseCFCPath#.core.page").init(
		page_id: arguments.page_id, 
		history_id: arguments.history_id, 
		site_config: arguments.site_config			
	)>

	<!--- if we don't get an object, throw error --->
    <cfif NOT isObject(LOCAL.page)>
        <cfreturn "">
    <cfelse>   
    	<cfinvoke method="createPageTemplate" returnvariable="LOCAL.pageTemplate">
        	<cfinvokeargument name="template_path" value="#LOCAL.baseCFCPath#.#LOCAL.page.getTemplate()#">
            <cfinvokeargument name="page_object" value="#LOCAL.page#">
            <cfinvokeargument name="site_config" value="#sc#">
        </cfinvoke>

		<!--- get the page --->
		<cfset LOCAL.pageHTML = LOCAL.pageTemplate.getPage()>
	</cfif>
	
	<cfreturn LOCAL.pageHTML>
</cffunction>

<!--- binds a template to a page object --->
<cffunction name="createPageTemplate" access="public">
    <cfargument name="template_path" type="string" required="true">
    <cfargument name="site_config" type="struct" required="true">
    <cfargument name="page_object" type="any" required="false">
    

	<!--- Initialize the proper template --->
    <cfset var pageTemplate = createObject("component", "#arguments.template_path#")>

    <!--- Initialize page helper --->
    <cfinvoke component="#pageTemplate#" method="init">
    	<cfif isDefined("arguments.page_object")>
      		<cfinvokeargument name="page" value="#arguments.page_object#">
        </cfif>
        <cfinvokeargument name="site_config" value="#arguments.site_config#">
    </cfinvoke>

    <cfreturn pageTemplate>
</cffunction> 

<cffunction name="renderStaticTemplate" access="public" returntype="void" output="true" hint="Renders a static template">
<cfargument name="template_name" type="string" required="true" hint="name of a static template">
<cfargument name="site_config" type="struct" required="true" hint="site config structure">

<cfsilent>
        
<cfset var baseCFCPath = "#site_config.cfMappedPath#.#site_config.sitepath#">
<cfset var pageTemplate = "">
<cfset var pageHTML = "">

<cfinvoke component="#baseCFCPath#.core.pageservice" method="createPageTemplate" returnvariable="pageTemplate">
    <cfinvokeargument name="template_path" value="#baseCFCPath#.#arguments.template_name#">
    <cfinvokeargument name="site_config" value="#arguments.site_config#">
</cfinvoke>

<!---    
<cfsavecontent variable="pageHTML"> 
    <cfset pageTemplate.renderContent()>
</cfsavecontent>

<!---
<cfif arguments.site_config.URLrewriter EQ true>
    <cfinvoke component="#baseCFCPath#.core.pageHelper" method="changeURLStoSEO" returnvariable="pageHTML">
        <cfinvokeargument name="pageHTML" value="#pageHTML#">
        <cfinvokeargument name="datasource" value="#arguments.site_config.datasource#">    
    </cfinvoke>
</cfif>
--->
</cfsilent>
<cfoutput>#pageHTML#</cfoutput> --->
</cfsilent>
<cfoutput>#pageTemplate.getPage()#</cfoutput>
</cffunction>

</cfcomponent>