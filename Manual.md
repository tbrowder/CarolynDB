TITLE
=====

CarolynDB v11 Manual

Unicode & Fonts
===============

CarolynDB is Unicode-first. All interfaces use UTF-8.

Environment
-----------

over
====

4

  * * CAROLYNDB_UNICODE=1 - enforce UTF-8 everywhere

  * * CAROLYNDB_FONT=noto - prefer Noto font stack

  * * CAROLYNDB_FONT_URL - optional webfont CSS URL

  * * CAROLYNDB_CSV_BOM=1 - prepend UTF-8 BOM for CSV export (Excel)

back
====



INSTALLATION
============

    unzip CarolynDB-v11.zip
    cd CarolynDB_v11
    zef install --deps-only .

