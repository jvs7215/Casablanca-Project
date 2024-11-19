<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" 
    xmlns:cbml="http://www.cbml.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs cbml"
    version="3.0">
    
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes" 
        include-content-type="no" indent="yes"/>
    
    <xsl:key name="name" match="speaker" use="normalize-space(.)"/> <!-- creating a key to store name variable and spacing convenience with use -->
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Casablanca Cast Table</title>
            </head>
            <body>
                <h1>Casablanca Cast</h1>
                <table>
                    <tr>
                        <th>Speaker</th>
                        <th>Scene Number</th>
                    </tr>
                    
                    <!-- Loop to find only one instance of speaker and its scene number -->
                    <xsl:for-each select="//speaker[generate-id() = generate-id(key('name', normalize-space(.))[1])]"> <!-- creating a new id for each character -->
                        <tr>
                            
                            <td>
                                <xsl:value-of select="normalize-space(.)"/> <!-- character name for column 1 -->
                            </td>
                            
                            <td>
                                <xsl:value-of select="descendant::scene/@n"/> <!-- Scene number of first appearance by character for column 2-->
                            </td>
                            
                        </tr>
                    </xsl:for-each>
                    
                </table>
            </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>
