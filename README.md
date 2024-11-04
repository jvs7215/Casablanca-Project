# Casablanca-Project
<a href="https://jvs7215.github.io/Casablanca-Project/">

Casablanca project for DIGIT 110

XML/Schema Format:

    <pg n="some number"> = pdf page for reference, numbered using attribute n. Contains the scenes (each scene will probably span a number of pages)

    <scene> = each movie scenes, numbered using attribute n. Contains <camera>, <stageDescript>, and <sp> (no particular order).
    
        <camera> = camera instructions
        <stageDescript> = the setting being described
        <sp> = "speech" - anytime a character/the narrator is talking, wrap in speech tag. Contains <speaker> and <diag>
            <speaker who="character"> CHARACTER </speaker> = which character is talking, attribute "who" also contains their name (?)
            <diag> = wraps around what the character is saying, their "dialogue"