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
                
                <table>
                    <tr>
                        <td><h2>Locations</h2></td>
                        <td><h2>Number of Appearances</h2></td>
                        <td><h2>First Scene Appearance</h2></td>
                    </tr>
                    <tr>
                        <td>Rick's Café</td>
                        <td>39</td>
                        <td>Scene 12</td>
                    </tr>
                    <tr>
                        <td>Police Station</td>
                        <td>1</td>
                        <td>Scene 2</td>
                    </tr>
                    <tr>
                        <td>Old Moorish Section of the City</td>
                        <td>1</td>
                        <td>Scene 1</td>
                    </tr>
                    <tr>
                        <td>A Street in the Old Moorish Section</td>
                        <td>1</td>
                        <td>Scene 3</td>
                    </tr>
                    <tr>
                        <td>Palais De Justice</td>
                        <td>3</td>
                        <td>Scene 4</td>
                    </tr>
                    <tr>
                        <td>Sidewalk Café</td>
                        <td>1</td>
                        <td>Scene 5</td>
                    </tr>
                    <tr>
                        <td>Airfield</td>
                        <td>1</td>
                        <td>Scene 11</td>
                    </tr>
                    <tr>
                        <td>Rick's Paris Apartment</td>
                        <td>1</td>
                        <td>Scene 25</td>
                    </tr>
                    <tr>
                        <td>Paris Café</td>
                        <td>3</td>
                        <td>Scene 26</td>
                    </tr>
                    <tr>
                        <td>Ilsa's Paris Apartment</td>
                        <td>1</td>
                        <td>Scene 27</td>
                    </tr>
                    <tr>
                        <td>La Belle Aurore</td>
                        <td>1</td>
                        <td>Scene 30</td>
                    </tr>
                    <tr>
                        <td>Gare De Lyon</td>
                        <td>1</td>
                        <td>Scene 31</td>
                    </tr>
                    <tr>
                        <td>Renault's Office</td>
                        <td>4</td>
                        <td>Scene 35</td>
                    </tr>
                    <tr>
                        <td>Prefecture Lobby</td>
                        <td>1</td>
                        <td>Scene 36</td>
                    </tr>
                    <tr>
                        <td>The Blue Parrot</td>
                        <td>5</td>
                        <td>Scene 39</td>
                    </tr>
                    <tr>
                        <td>Black Market</td>
                        <td>3</td>
                        <td>Scene 38</td>
                    </tr>
                    <tr>
                        <td>Hotel Hallway</td>
                        <td>1</td>
                        <td>Scene 54</td>
                    </tr>
                    <tr>
                        <td>Hotel Room</td>
                        <td>1</td>
                        <td>Scene 55</td>
                    </tr>
                    <tr>
                        <td>German Consulate</td>
                        <td>1</td>
                        <td>Scene 73</td>
                    </tr>
                    <tr>
                        <td>Airport</td>
                        <td>4</td>
                        <td>Scene 74</td>
                    </tr>
                    <tr>
                        <td>Airport Hangar</td>
                        <td>2</td>
                        <td>Scene 75</td>
                    </tr>
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
