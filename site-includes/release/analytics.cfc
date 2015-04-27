<cfcomponent displayname="analytics" output="false">

<cffunction name="getGoogleAnalytics" access="public" output="false" returntype="string">
<cfset var analytics = "">
	
<cfsavecontent variable="analytics">	
<!--- Put analytics / tag manager here --->
</cfsavecontent>

<cfreturn analytics>

</cffunction>

</cfcomponent>