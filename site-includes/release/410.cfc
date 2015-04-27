<cfcomponent extends="template">

<!--- pseudo-constructor --->
<cffunction name="init" returntype="any" access="public" output="true">
    <!--- create dummy page object --->
	<cfset var page_object = createObject("component", "core.pageStatic")>

	<!--- Overrides for static page head --->
	<cfset page_object.setPageTitle('Page Not Found')>
	<cfset page_object.setTextDescription('The requested page could not be found')>		

	<cfset super.init(argumentCollection=arguments, page: page_object)>

	<!--- meta overrides --->
	<cfset addMeta(robots: 'noindex, nofollow')>

	<!--- set the proper statuscode --->
   	<cfheader statuscode="410" statustext="Page Not Found">

  	<cfreturn this>
</cffunction>

<cffunction name="renderContent" access="public" output="true">
<h2>410 - Page Not Found</h2>
</cffunction>

</cfcomponent>