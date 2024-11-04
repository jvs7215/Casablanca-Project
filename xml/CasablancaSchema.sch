<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://purl.oclc.org/dsdl/schematron http://www.ascc.net/xml/schematron">
    
    <pattern>
        <title>Casablanca XML Schema</title>
        
        <rule context="scene">
            <assert test=" @n &gt; 0"> <!-- Leaving a comment reminder to add max once I know the last scene count -->
                Each scene must have a 'n' attribute marking the non-negative scene number.
            </assert>
        </rule>
        
        <rule context="scene">
            <assert test="camera"> <!-- May potentially add each set of directions if they follow a small pattern i.e. FADE IN: FADE OUT: -->
                Each scene may contain at least one camera element.
            </assert>
            <assert test="sp/speaker">
                Each scene may contain a speaker within the 'sp' element.
            </assert>
        </rule>
        
        <rule context="scene">
            <assert test="stageDescript">
                The scene may contain a stageDescript element.
            </assert>
        </rule>
        
        <rule context="sp">
            <assert test="speaker[@who]"> <!-- We will later expand to hold all of oour characters-->
                Each speaker must have a 'who' attribute.
            </assert>
            <assert test="diag">
                Each 'sp' must contain a 'diag' element for dialogue.
            </assert>
        </rule>
        
    </pattern>
</schema>