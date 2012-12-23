Install backends
================

Lofic backend
-------------
To use this backend you need to install it and install the lofic theme. Lofic
theme contains the pygments.css required by the lofic backend.

URL : https://github.com/Pryz/asciidoc/tree/master/themes/lofic

Install the backend

    wget https://github.com/Pryz/asciidoc/raw/master/backend/lofic-1.0.zip
    asciidoc -v --backend install lofic-1.0.zip

Install the theme

    wget https://github.com/Pryz/asciidoc/raw/master/themes/lofic/lofic-1.0.zip
    asciidoc -v --theme install lofic-1.0.zip

To enjoy it

    asciidoc --backend=lofic your_asciidoc.txt
    firefox your_asciidoc.html
