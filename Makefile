gettext-to-json:
	./node_modules/.bin/i18next-conv -l fr -s po/fr.po -t json/fr.json
	./node_modules/.bin/i18next-conv -l en -s po/en.po -t json/en.json
	./node_modules/.bin/i18next-conv -l de -s po/de.po -t json/de.json
