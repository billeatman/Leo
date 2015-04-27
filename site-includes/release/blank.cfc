<cfcomponent extends="template">


<cffunction name="renderHead" output="true">
<!--- extra stuff here --->
<cfset super.renderHead(argumentCollection=arguments)>
<!--- or here --->
</cffunction>

<cffunction name="RenderPage" access="public" returntype="any" output="true">
<!DOCTYPE html> 
<head>
</head>
<body>
  <cfset RenderContent()>
</body>
</html>
</cffunction>

</cfcomponent>