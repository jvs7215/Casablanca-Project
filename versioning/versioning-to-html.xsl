<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs math xd"
    version="3.0">
    
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes" include-content-type="no"
        indent="yes"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>
                    <xsl:apply-templates select="descendant::fileDesc/title"/>
                </title>
                <link rel="stylesheet" type="text/css" href="style.css"/>
            </head>
            
        
       <body> 
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
           <h1>Three versions of the ending</h1>
           <p><xsl:apply-templates select="descendant::metadata//desc"/>
           <xsl:text> We display these versions side by side in three containers. Mainly the three scripts are distinctly different, but in the rare occasions that the two
           Casablanca movie scripts are the same, they are shown to span together across the right-hand side of the screen. </xsl:text>
           </p> 
           
          <div class="intro">
              
              <div class="everybody-play">
                  <h2>Play: Everybody Comes to Rick's</h2>
                  <xsl:apply-templates select="descendant::listWit/witness[@xml:id='everybody-play']"/>
              </div>
              
             <div class="alt-77">
                 <h2>Casablanca Movie Script in 77 Scenes</h2>
                 This version is the basis for our <a href="output.html">reading view</a>.
                 <xsl:apply-templates select="descendant::listWit/witness[@xml:id='77-scene-alt']"/>
             
             </div>
              
              <div class="screenplay">
                  <h2>Casablanca Movie Script in 285 Scenes, June 6, 1942.</h2>
                  <xsl:apply-templates select="descendant::listWit/witness[@xml:id='1942-06-01-screenplay']"/>
              </div>
              
          </div>
           
           
           <hr/>
           <div class="versions">
           <xsl:apply-templates select="descendant::script"/>
           </div>
           
       </body>
        </html>
    </xsl:template>
    
    <xsl:template match="script/div">
        
        <xsl:apply-templates/>
        
    </xsl:template>
    
    <xsl:template match="app">
        <div class="flex">
            <div class="everybody-play">
                <xsl:apply-templates select="rdg[@wit='#everybody-play']"/>
                
            </div>
            <div class="alt-77">
                <xsl:apply-templates select="rdg[@wit='#77-scene-alt']"/>
            </div>
            
            <div class="screenplay">
                <xsl:apply-templates select="rdg[@wit='#1942-06-01-screenplay']"/>
            </div>
            
        </div>
    </xsl:template>
    
    <xsl:template match="ptr">
        <a href="{@target}">this web resource</a>
    </xsl:template>
    <xsl:template match="p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="dir[not(ancestor::app)] | sp[not(ancestor::app)]">
        <div class="flex">
            <div class="everybody-play"></div>
            <div class="united">
                
              <xsl:choose>
                  <xsl:when test="current() ! name() = 'dir'">
                 <span class="dir"> <xsl:apply-templates/></span>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates/>
                </xsl:otherwise>
              </xsl:choose>
            </div>
        </div>
    </xsl:template>

<!-- ebb: COPIED FROM READING VIEW XSLT: -->
    <!--scene formating testing-->
    <xsl:template match="scene">
        <div class="camera">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
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
    <xsl:template match="sp//descr | dir">
        <span class="dir">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    
</xsl:stylesheet>