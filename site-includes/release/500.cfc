<cfcomponent extends="template">

<!--- pseudo-constructor --->
<cffunction name="init" returntype="any" access="public" output="true">
    <!--- create dummy page object --->
  <cfset var page_object = createObject("component", "core.pageStatic")>

  <!--- Overrides for static page head --->
  <cfset page_object.setPageTitle('Internal Error 500')>
  <cfset page_object.setTextDescription('An internal error prevented the request')>   

  <cfset super.init(argumentCollection=arguments, page: page_object)>

  <!--- meta overrides --->
  <cfset addMeta(robots: 'noindex, nofollow')>

  <!--- set the proper statuscode --->
    <cfheader statuscode="500" statustext="Page Not Found">

    <cfreturn this>
</cffunction>

<cffunction name="renderContent" access="public" output="true">
<h2>510 - An internal error occured</h2>
</cffunction>

</cfcomponent>