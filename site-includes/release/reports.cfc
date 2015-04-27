<cfcomponent extends="template">

<cffunction name="RenderPage" access="public" returntype="any" output="true">
<html>
<head>

</head>
<body class="main">
<cfset RenderContent()>
</body>
</html>
</cffunction>

<cffunction name="RenderHead" access="public" output="true">
<style>
.main{
  font-family:"Courier New", Courier, monospace;
  font-size:12px;
}
</style>
</cffunction>

</cfcomponent>
