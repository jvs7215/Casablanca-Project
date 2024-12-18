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



            <body class="xslBod">
                <!-- NAV BAR-->
                <div class="navBar">
                    <a href="index.html" class="btnFade">Home</a>
                    <a href="script.html" class="btnFade">Script PDF</a>
                    <a href="schema.html" class="btnFade">Schema</a>
                    <a href="methods.html" class="btnFade">Methods</a>
                    <a href="output.html" class="btnFade">Reading View</a>
                    <a href="versions.html" class="btnFade">Endings</a>
                    <a href="https://github.com/jvs7215/Casablanca-Project" class="btnFade"
                        target="_blank" rel="noopener noreferrer">Github</a>
                    <!-- 2024-12-08 ebb: I'm adding one more button for viewing the three different 
                    script endings! If you want to include this a different way, feel free to change it!
                    -->
                </div>

                <h1>
                    <xsl:apply-templates select="descendant::title"/>
                </h1>


                <!--JAS TEST TOC-->
                <div class="toc">
                    <h3>Scenes</h3>
                    <div>
                        <xsl:for-each select="$casaColl//scene">
                            <xsl:variable name="sceneNumber" select="position()"/><a
                                href="#scene-{$sceneNumber}">[<xsl:value-of select="$sceneNumber"
                                />]</a>
                        </xsl:for-each>
                    </div>
                </div>
                <!--JAS TEST TOC END-->

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
                        <th>Locations</th>
                        <th>Number of Appearances</th>
                        <th>First Scene Appearance</th>
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




                <!--JAS TESTING START-->

                <table class="metadata">
                    <tr>
                        <th>Movie Data</th>
                        <th>Script Data</th>
                    </tr>
                    <tr>
                        <td>
                            <xsl:text>Director: </xsl:text>
                            <xsl:value-of
                                select="$casaColl//metadata//director ! normalize-space() => distinct-values()"
                            />
                        </td>
                        <td>
                            <xsl:text>Number of Scenes: </xsl:text>
                            <xsl:value-of
                                select="$casaColl//metadata//numScenes ! normalize-space() => distinct-values()"
                            />
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <xsl:text>World Premier: </xsl:text>
                            <xsl:value-of
                                select="$casaColl//metadata//wrldPrem ! normalize-space() => distinct-values()"
                            />
                        </td>
                        <td>
                            <xsl:text>Publisher: </xsl:text>
                            <xsl:value-of
                                select="$casaColl//metadata//publisher ! normalize-space() => distinct-values()"
                            />
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <xsl:text>Locations: </xsl:text>
                            <xsl:value-of
                                select="$casaColl//metadata//loc ! normalize-space() => distinct-values() => string-join('; ')"
                            />
                        </td>
                        <td>
                            <xsl:text>Generated By: </xsl:text>
                            <xsl:value-of
                                select="$casaColl//metadata//generatedBy ! normalize-space() => distinct-values()"
                            />
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <xsl:text>Producer: </xsl:text>
                            <xsl:value-of
                                select="$casaColl//metadata//producer ! normalize-space() => distinct-values() => string-join(', ')"
                            />
                        </td>
                        <td>
                            <xsl:text>Generated On: </xsl:text>
                            <xsl:value-of
                                select="$casaColl//metadata//date ! normalize-space() => distinct-values()"
                            />
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <xsl:text>Writers: </xsl:text>
                            <xsl:value-of
                                select="$casaColl//metadata//writer ! normalize-space() => distinct-values() => string-join(', ')"
                            />
                        </td>
                        <td>
                            <xsl:text>Website: </xsl:text>
                            <xsl:value-of
                                select="$casaColl//metadata//website ! normalize-space() => distinct-values()"
                            />
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <xsl:text>Based On: </xsl:text>
                            <xsl:value-of
                                select="$casaColl//metadata//basedOn ! normalize-space() => distinct-values()"
                            />
                        </td>

                    </tr>


                    <tr>
                        <td>
                            <xsl:text>Composer: </xsl:text>
                            <xsl:value-of
                                select="$casaColl//metadata//composer ! normalize-space() => distinct-values()"
                            />
                        </td>
                    </tr>


                    <tr>
                        <td>
                            <xsl:text>Starring: </xsl:text>
                            <xsl:value-of
                                select="$casaColl//metadata//starring ! normalize-space() => distinct-values() => string-join(', ')"
                            />
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <xsl:text>Editor: </xsl:text>
                            <xsl:value-of
                                select="$casaColl//metadata//editor ! normalize-space() => distinct-values()"
                            />
                        </td>
                    </tr>
                </table>

                <!--JAS TESTING END-->



                <!-- BELOW is the Reading View processing -->


                <section class="reading">
                    <xsl:apply-templates select="$casaColl//scene"/>
                </section>

            </body>
            <div class="footer">
                <!--creative commons license-->
                <p xmlns:cc="http://creativecommons.org/ns#" xmlns:dct="http://purl.org/dc/terms/"
                        ><a property="dct:title" rel="cc:attributionURL"
                        href="https://jvs7215.github.io/Casablanca-Project/">Casablanca Project</a>
                    by <span property="cc:attributionName"><a href="https://github.com/jvs7215"
                            target="_blank" rel="noopener noreferrer">Jessica Salemme</a>, <a
                            href="https://github.com/sjm7342" target="_blank"
                            rel="noopener noreferrer">Sean Martin</a>, <a
                            href="https://github.com/Cal16king" target="_blank"
                            rel="noopener noreferrer">Caleb King</a></span> is licensed under <a
                        href="https://creativecommons.org/licenses/by-nc/4.0/?ref=chooser-v1"
                        target="_blank" rel="license noopener noreferrer"
                        style="display:inline-block;">CC BY-NC 4.0<img
                            style="height:22px!important;margin-left:3px;vertical-align:text-bottom;"
                            src="https://mirrors.creativecommons.org/presskit/icons/cc.svg?ref=chooser-v1"
                            alt=""/><img
                            style="height:22px!important;margin-left:3px;vertical-align:text-bottom;"
                            src="https://mirrors.creativecommons.org/presskit/icons/by.svg?ref=chooser-v1"
                            alt=""/><img
                            style="height:22px!important;margin-left:3px;vertical-align:text-bottom;"
                            src="https://mirrors.creativecommons.org/presskit/icons/nc.svg?ref=chooser-v1"
                            alt=""/></a></p>
            </div>
        </html>
    </xsl:template>


    <!-- BELOW HERE are the Reading View templates -->
    <xsl:template match="scene">
        <section id="scene-{@n}" class="scene sceneMargin">
            <xsl:apply-templates/>
        </section>
    </xsl:template>






    <!--scene formating testing-->
    <!-- ebb: this one is conflicting with previous template matching on scenes. -->
    <!--   <xsl:template match="sceSne">
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

    <xsl:template match="descr | sp/diag/descr">
        <span class="descr">
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
