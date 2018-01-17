.. image:: https://img.shields.io/github/tag/gafam/gafam-poster-translations.svg
    :target: https://github.com/gafam/gafam-poster-translations

|

######################################
The GAFAM poster campaign translations
######################################


About
=====
This repository contains translations of the `GAFAM poster campaign`_
by `La Quadrature du Net`_ in `GNU gettext`_ format.

The repository and its accompanying web page `gafam.info`_
are intended to support the lovely people of LQDN in spreading
the word about their campaign.

Contributions are always welcome!

.. _GAFAM poster campaign: https://twitter.com/laquadrature/status/942764007286591490
.. _La Quadrature du Net: https://www.laquadrature.net/
.. _GNU gettext: https://en.wikipedia.org/wiki/Gettext
.. _gafam.info: https://gafam.info/


How to work with it
===================

Add another translation
-----------------------
You can find a nice description about how to get started
with translations at https://gafam.info/#contribute.

Thanks for your efforts!



Technical guideline for operators
=================================
If you are used to work on the command line,
these informations might help you along.


Add a new translation file
--------------------------
::

    cd po
    msginit --locale pt

This should add a new translation file ``pt.po``.

Please edit the header fields ``Last-Translator``
and ``Language-Team`` appropriately. Then, add
the translation texts.

You might want to have a look at the existing
translations as a reference, especially about
how to handle multiline items:
`<po/fr.po>`_, `<po/en.po>`_, `<po/de.po>`_ and
`<po/jp.po>`_.


Convert translation file formats
--------------------------------
Convert GNU gettext PO files to i18next_ JSON format::

    yarn install
    make gettext-to-json

This should convert all ``po/*.po`` files to their
corresponding ``json/*.json`` pendants.

When adding a new translation to the ``po/`` directory,
please also update the ``LANGUAGES`` list in the ``Makefile``.

It uses the `i18next-gettext-converter`_ module under the hood.

.. note::

    As the JSON files will be automatically generated from
    the PO files, there's no need to edit/update them when
    adding/correcting a translation for a specific language.

    Just run the command above to build the JSON files
    from the PO files.

.. _i18next: https://www.i18next.com/
.. _i18next-gettext-converter: https://github.com/i18next/i18next-gettext-converter

