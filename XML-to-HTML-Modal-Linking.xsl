<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs math" version="3.0">

    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes" include-content-type="no"
        indent="yes"/>


    <xsl:variable name="casaColl" as="document-node()+" select="collection('xml/?select=*.xml')"/>


    <xsl:variable name="speakers" as="xs:string+"
        select="$casaColl//speaker/@who ! normalize-space() ! upper-case(.) => distinct-values() => sort()"/>


    <xsl:template match="/">
        <html>
            <head>
                <title>
                    <xsl:apply-templates select="descendant::title"/>
                </title>
                <link rel="stylesheet" type="text/css" href="style.css"/>
            </head>
            
            
            
            <body>
                <!-- NAV BAR-->
                <div class="navBar">
                    <a href="index.html" class="btnFade">Home</a><a href="script.html" class="btnFade"
                        >Script PDF</a><a href="schema.html" class="btnFade">Schema</a><a
                            href="methods.html" class="btnFade">Methods</a><a
                                href="output.html" class="btnFade">Reading View</a>
                    <a href="versions.html" class="btnFade"
                        >Endings</a>
                    <!-- 2024-12-08 ebb: I'm adding one more button for viewing the three different 
                    script endings! If you want to include this a different way, feel free to change it!
                    -->
                </div>
                
                <h1>
                    <xsl:apply-templates select="descendant::title"/>
                </h1>
                <!-- Here is a Table of Contents Overview -->
                <table>
                    <tr>
                        <th>Character Codes</th>
                        <th>Character Names</th>
                        <th>Count of Appearances</th>
                        <th>First scene in which they speak</th>
                    </tr>

                    <xsl:for-each select="$speakers">
                        <xsl:variable name="currentSpeaker" as="element()+"
                            select="$casaColl//speaker[@who ! normalize-space() ! upper-case(.) = current()]"/>

                        <tr>
                            <td>
                                <xsl:value-of select="current()"/>
                            </td>


                            <td>

                                <xsl:value-of
                                    select="$currentSpeaker ! normalize-space() => distinct-values()"
                                />
                            </td>
                            <td>
                                <xsl:value-of select="$currentSpeaker => count()"/>
                            </td>
                            <td>
                                <!-- The first scene in which that character speaks -->
                                <xsl:variable name="firstSceneNumber" as="xs:double" select="
                                        ($casaColl//scene[descendant::speaker/@who !
                                        normalize-space() ! upper-case(.) = current()]/@n ! number(.)) => min()"/>

                                <a href="#scene-{$firstSceneNumber}">

                                    <xsl:text>Scene </xsl:text>
                                    <xsl:value-of select="$firstSceneNumber"/>
                                </a>


                            </td>
                        </tr>
                    </xsl:for-each>

                </table>

                <!-- BELOW is the Reading View processing -->

                <section class="reading">
                    <xsl:apply-templates select="$casaColl//scene"/>
                </section>

            </body>

        </html>
    </xsl:template>


    <!-- BELOW HERE are the Reading View templates -->
    <xsl:template match="scene">
        <section id="scene-{@n}">
            <xsl:apply-templates/>
        </section>
    </xsl:template>

<!--scene formating testing--> 
    <!-- ebb: this one is conflicting with previous template matching on scenes. -->
 <!--   <xsl:template match="scene">
        <div class="camera">
            <xsl:apply-templates/>
        </div>
    </xsl:template>-->
    
    <xsl:template match="camera">
        <div class="camera">
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="setting">
        <div class="setting">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="sp">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="speaker">
        <span class="speaker {@who}">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="diag">
        <span class="diag">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <!-- ebb: added one more for directions / descriptions -->
    <xsl:template match="sp/descr | dir">
        <span class="dir">
            <xsl:apply-templates/>
        </span>
    </xsl:template>


</xsl:stylesheet>
