<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" 
    xmlns:cbml="http://www.cbml.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs cbml"
    version="3.0"
    >
    
    <!--Goes in stylesheet above    
        xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"-->
    
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes" include-content-type="no"
        indent="yes"/>
    
<!--    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Nov 18, 2024</xd:p>
            <xd:p><xd:b>Author:</xd:b>Jessica Salemme</xd:p>
            <xd:p><xd:b>Author:</xd:b>Sean Martin</xd:p>
            <xd:p><xd:b>Author:</xd:b>Caleb King</xd:p>
            <xd:p>XSLT transformation to HTML our casablanca.xml</xd:p>
            <xd:p>Original Script Source: Brent Dunham  </xd:p>
        </xd:desc>
    </xd:doc> -->
    
     <!--    JS: Does this reach into our casablanca collection correctly?
     The folder xml has:
     casablanca-1-ck.xml
     casablanca-2-js.xml
     casablanca-3-sm.xml
     
     but also 
     screenplay.xml
     
     and I don't think we want the screenplay

     -->
    <xsl:variable name="casablancaColl" as="document-node()+"
        select="collection('xml/?select=*.xml')"/>
    
    <xsl:variable name="characters" as="xs:string+" select="$casablancaColl//speaker/@who ! normalize-space() => distinct-values()"/>
    
    <xsl:template match="/">
        
        <html>
            <head>
                <title>Casablanca</title>
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <!--Links to CSS file
                -->
                <link rel="stylesheet" type="text/css" href="style.css"/>
            </head>
            
            <body>
                <h1><xsl:apply-templates select="collection($casablancaColl//movie/title)[1]"/></h1>
                <section id="toc">
                    <h2>Contents</h2>
                    <!-- ebb: We're going to output a cast of characters and the scenes numbers in which they appear.
                    -->
                    <table>
                        <tr>
                            <th>Scene Number</th><!--first column table heading-->
                            <th>Characters</th><!--second column table heading-->
                        </tr>
                        
                        <xsl:apply-templates select="$casablancaColl//scene[@n]" mode="toc">
                            
                        </xsl:apply-templates>
                        <!-- ebb: Notice how we open up xsl:apply-templates to apply xsl:sort. 
                            We can't be sure of the order of processing in a collection, so sorting is 
                            a good idea to make sure the pages show up in the correct numerical order. 
                            This sorts the files in the collection based on the @n on the div.
                      -->
                        
                        
                    </table>
                </section>
                
                <section id="readingView">
                    
                    <xsl:apply-templates select="$casablancaColl//scene[@n]"/>
                    
                </section>
            </body>
        </html>
    </xsl:template>
        
    
</xsl:stylesheet>