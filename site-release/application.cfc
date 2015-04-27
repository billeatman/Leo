<cfcomponent>

<cffunction name="onError">
    <!--- The onError method gets two arguments:
            An exception structure, which is identical to a cfcatch variable.
            The name of the Application.cfc method, if any, in which the error
			  happened. --->
    <cfargument name="Except" required=true/>
    <cfargument type="String" name = "EventName" required=true/>

    <!--- get the config for the site --->
	<cfinvoke component="siteConfig" method="getConfig" returnvariable="site_config" />
    
    <cfif site_config.displayErrors EQ true>
		<cfthrow object="#except#">
	</cfif>
    
    <cfset baseCFCPath = "#site_config.cfMappedPath#.#site_config.sitepath#">

	<!--- Add the error to the log --->
	<cfquery datasource="#site_config.datasource#">
		insert into errorLog (datetime, message, detail, error, cgi, hash)
		values (
			<cfqueryparam cfsqltype="cf_sql_timestamp"value="#now()#">
			,<cfqueryparam cfsqltype="cf_sql_varchar" value="#except.message#">
			,<cfqueryparam cfsqltype="cf_sql_varchar" value="#except.detail#">
			,<cfqueryparam cfsqltype="cf_sql_blob" value="#toBinary(toBase64(SerializeJSON(arguments.except)))#"> 
			,<cfqueryparam cfsqltype="cf_sql_blob" value="#toBinary(toBase64(SerializeJSON(cgi)))#">
			,<cfqueryparam cfsqltype="cf_sql_varchar" value="#hash(SerializeJSON(arguments.except))#">    	     
		)
	</cfquery>

    <!--- Error.  render the error page --->
	<cfinvoke component="#baseCFCPath#.core.pageservice" method="renderStaticTemplate">
	    <cfinvokeargument name="template_name" value="500">
	    <cfinvokeargument name="site_config" value="#site_config#">
	</cfinvoke>
	<cfabort>
</cffunction>

</cfcomponent>