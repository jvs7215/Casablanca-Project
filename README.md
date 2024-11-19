# Casablanca-Project
<a href="https://jvs7215.github.io/Casablanca-Project/">

Casablanca project for DIGIT 110

(code view is easier to read)

# **General XML/Schema Format:**
<xml>
        <metadata>
            <movie>
                <title/>
                <director/>
                <wrldPrem/>
                <loc/>
                <producer/>
                <writer/>
                <basedOn/>
                <composer/>
                <starring/>
                <cinematography/>
                <editor/>
            </movie>
            <script>
                <numScenes/>
                <url/>
                <generatedBy/>
                <date/>
                <publisher/>
                <website/>
            </script>
        </metadata>
        <body> 
           <scene n="(scene number)">
                <camera>camera instruction("CUT TO:"( </camera>
                <setting>description of setting</setting>
                <sp>
                    <speaker who="char">CHARACTER</speaker> 
                    <diag> 
                          <descr>calmly/descr>
                        narrator's dialogue
                    </diag>  
                </sp>
                <dir> Character actions (Rick walks over. Ilsa smiles.) </dir>
           </scene> 
        
            <scene n="2"> everything inside</scene> 
            <scene n="3"> everything inside</scene> 
        </body>
</xml>  


# **KEY:**
- xml - element: wraps entire text
    - metadata - element: contains metadata
        - movie - wraps metadata about the movie
            - title - movie title
            - director - casablanca directors
            - wrlPrem - date of world premiere
            - loc - shooting locations
            - producer - casablanca producers
            - writer - casablanca writers
            - basedOn - media the film was based on
            - composer - music composer
            - starring - cast
            - cinematopgraphy - cinematopgraphy director
            - editor - casablanca editor
        - script - wraps metadata about the script
            - numScenes - total number of scenes
            - url - link to referenced script
            - generatedBy - script generator
            - date - when the script was generated
            - publisher - script site publisher
            - website - overarching scriptwebsite 
        
- body - element: holds all the scenes according to [pdf](https://app.studiobinder.com/company/580e85847e7982164664e844/collab/5eac35a683f7a90bfc3fc810/projects/5de590454f452c09a98e975b/document/5de5904f1fe52b06c2f4bd79/%5Bobject%20Object%5D?utm_source=blog&utm_medium=sb-app-link&utm_campaign=script&utm_term=casablanca-script-breakdown&utm_content=full-script-pdf-download); contains attribute n, elements camera, setting, sp, dir
  - camera - camera instructions "CUT TO:"
  - setting - the setting being described
  - sp for "speech" - anytime a character is talking. Contains elements speaker and diag
  - speaker - which character is talking, attribute "who" also contains their name shortened
  - diag - wraps around what the character is saying, their "dialogue", may contain element descr
  - dir - what the character is doing
  - descr - how the character is speaking, "fondly"

