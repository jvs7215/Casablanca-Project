<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="xs math xd"
    version="3.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Nov 18, 2024</xd:p>
            <xd:p><xd:b>Author:</xd:b> Jessica</xd:p>
            <xd:p></xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes" include-content-type="no"
        indent="yes"/>
    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="descendant::title">
        <link href="docs/style.css"></link>
    <html><text xmlns="http://www.w3.org/2000/svg">
    <head>
        <title>Casablanca</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" type="text/css" href="style.css"/>
    </head>
    <xd:doc>
        <xd:desc/>
    </xd:doc>
        <head><title><h1>Characters in Casablanca</h1></title>
        </head>
        <body><table>
            <tr>
                <td><h2>Characters</h2></td>
                <td><h2>Number of Appearances</h2></td>
            </tr>
            <tr>
                <td>Rick Blaine</td>
                <td>341</td>
            </tr>
            <tr>
                <td>Ilsa Lund</td>
                <td>136</td>
            </tr>
            <tr>
                <td>Captain Renault</td>
                <td>174</td>
            </tr>
            <tr>
                <td>Major Strasser</td>
                <td>73</td>
            </tr>
            <tr>
                <td>Victor Laszlo</td>
                <td>132</td>
            </tr>
            <tr>
                <td>Officer</td>
                <td>5</td>
            </tr>
            <tr>
                <td>Native</td>
                <td>2</td>
            </tr>
            <tr>
                <td>Frenchman</td>
                <td>2</td>
            </tr>
            <tr>
                <td>Jan</td>
                <td>7</td>
            </tr>
            <tr>
                <td>Arab</td>
                <td>5</td>
            </tr>
            <tr>
                <td>European</td>
                <td>11</td>
            </tr>
            <tr>
                <td>Tourist</td>
                <td>3</td>
            </tr>
            <tr>
                <td>Yvonne</td>
                <td>14</td>
            </tr>
            <tr>
                <td>German Officer</td>
                <td>4</td>
            </tr>
            <tr>
                <td>French Officer</td>
                <td>7</td>
            </tr>
            <tr>
                <td>Mr. Leuchtag</td>
                <td>6</td>
            </tr>
            <tr>
                <td>Mrs. Leuchtag</td>
                <td>4</td>
            </tr>
            <tr>
                <td>Carl</td>
                <td>34</td>
            </tr>
            <tr>
                <td>Annina</td>
                <td>25</td>
            </tr>
            <tr>
                <td>Headwaiter</td>
                <td>3</td>
            </tr>
            <tr>
                <td>Croupier</td>
                <td>10</td>
            </tr>
            <tr>
                <td>Customer</td>
                <td>3</td>
            </tr>
            <tr>
                <td>Sacha</td>
                <td>11</td>
            </tr>
            <tr>
                <td>Orderly</td>
                <td>2</td>
            </tr>
            <tr>
                <td>Officer</td>
                <td>5</td>
            </tr>
            <tr>
                <td>Ferrari</td>
                <td>35</td>
            </tr>
            <tr>
                <td>Gendarme</td>
                <td>4</td>
            </tr>
        </table>
        
            <table>
                <tr>
                    <td><h2>Locations</h2></td>
                    <td><h2>Number of Appearances</h2></td>
                </tr>
                <tr>
                    <td>Rick's Café</td>
                    <td>39</td>
                </tr>
                <tr>
                    <td>Police Station</td>
                    <td>1</td>
                </tr>
                <tr>
                    <td>Old Moorish Section of the City</td>
                    <td>1</td>
                </tr>
                <tr>
                    <td>A Street in the Old Moorish Section</td>
                    <td>1</td>
                </tr>
                <tr>
                    <td>Palais De Justice</td>
                    <td>3</td>
                </tr>
                <tr>
                    <td>Sidewalk Café</td>
                    <td>1</td>
                </tr>
                <tr>
                    <td>Airfield</td>
                    <td>1</td>
                </tr>
                <tr>
                    <td>Rick's Paris Apartment</td>
                    <td>1</td>
                </tr>
                <tr>
                    <td>Paris Café</td>
                    <td>3</td>
                </tr>
                <tr>
                    <td>Ilsa's Paris Apartment</td>
                    <td>1</td>
                </tr>
                <tr>
                    <td>La Belle Aurore</td>
                    <td>1</td>
                </tr>
                <tr>
                    <td>Gare De Lyon</td>
                    <td>1</td>
                </tr>
                <tr>
                    <td>Renault's Office</td>
                    <td>4</td>
                </tr>
                <tr>
                    <td>Prefecture Lobby</td>
                    <td>1</td>
                </tr>
                <tr>
                    <td>The Blue Parrot</td>
                    <td>5</td>
                </tr>
                <tr>
                    <td>Black Market</td>
                    <td>3</td>
                </tr>
                <tr>
                    <td>Hotel Hallway</td>
                    <td>1</td>
                </tr>
                <tr>
                    <td>Hotel Room</td>
                    <td>1</td>
                </tr>
                <tr>
                    <td>German Consulate</td>
                    <td>1</td>
                </tr>
                <tr>
                    <td>Airport</td>
                    <td>4</td>
                </tr>
                <tr>
                    <td>Airport Hangar</td>
                    <td>2</td>
                </tr>
            </table></body>
    </text></html>
    </xsl:template>

</xsl:stylesheet>

