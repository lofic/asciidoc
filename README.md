Install & usage
===============

Themes
------

    asciidoc -v --theme install pryz-1.0.zip
    asciidoc --theme pryz your_file.txt


Backends
--------

    asciidoc -v --backend install index-list-1.0.zip
    asciidoc --backend index-list your_file.txt

Use rake to generate notes
--------------------------

Install needed theme and backend
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

        
    wget https://github.com/Pryz/asciidoc/raw/master/backend/lofic_backend-1.0.zip
    asciidoc -v --backend install lofic_backend-1.0.zip

    wget https://github.com/Pryz/asciidoc/raw/master/themes/lofic/lofic-1.0.zip
    asciidoc -v --theme install lofic_theme-1.0.zip

Get and use the Rakefile
~~~~~~~~~~~~~~~~~~~~~~~~

    wget https://github.com/Pryz/asciidoc/raw/master/Rakefile

    # Edit the rakefile with your notes location
    # Then build html and index
    rake
    # or html
    rake genhtml
    # or index
    rake genindex
    # or just one html note
    rake genfile["txt/my_file.txt"]
