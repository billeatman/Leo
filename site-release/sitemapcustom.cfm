<!--- put custom cfm/html files in here always use paths relative to the site root --->

<cfif NOT isDefined('site_config')>
	<cfabort>
</cfif>

<!--- 
change freq: never, yearly, monthly, weekly, daily
--->

<cfoutput>
<!--- search results --->
<!---
<url>
	<loc>#siteroot##basepath#search.cfm</loc>
	<lastmod>2012-10-17</lastmod>
	<changefreq>never</changefreq>
	<priority>0.5</priority>
</url>
--->
</cfoutput>
