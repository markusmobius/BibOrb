<?xml version="1.0" encoding="iso-8859-1" ?>
<!--
 * This file is part of BibORB
 * 
 * Copyright (C) 2003-2005  Guillaume Gardey (ggardey@club-internet.fr)
 * 
 * BibORB is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 * 
 * BibORB is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 * 
-->
<!--
 * File: xpath_query.xsl
 * Author: Guillaume Gardey (ggardey@club-internet.fr)
 * Licence: GPL
 *
 * Description:
 *
 *  
 *
 *
-->

<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:bibtex="http://bibtexml.sf.net/"
    version="1.0">
  
    <xsl:output method="xml" encoding="iso-8859-1" omit-xml-declaration="no"/>
	
	<!-- include generic parameters -->
	<xsl:include href="xsl/parameters.xsl"/>
	
	<xsl:template match="/">
		<xsl:element name="bibtex:file">
			<xsl:copy>
				<xsl:apply-templates select="//bibtex:entry[XPATH_QUERY]"/>
			</xsl:copy>
		</xsl:element>
	</xsl:template>
	
	<!-- Hand copy to be sure to copy namespaces -->
	<xsl:template match="@*">
        <xsl:attribute name="{name()}"><xsl:value-of select="."/></xsl:attribute>
    </xsl:template>
    
    <xsl:template match="*">
        <xsl:element name="bibtex:{local-name()}">
            <xsl:apply-templates select=" @* | node()"/>
        </xsl:element>
    </xsl:template>
	
</xsl:stylesheet>