# ===================
# i18next translation
# ===================

# Which translation files to convert from
# GNU gettext PO format into i18next JSON format
LANGUAGES = fr en de jp eo ru cmn it pl nb_NO ca es pt se


# Convert single translation file
po-to-json:
	@echo
	@echo ------------------------
	@echo Converting language \"$(lang)\"
	@echo ------------------------
	I18NEXT_LANG=$(lang) yarn run i18next-po-to-json

# Convert all translation files
gettext-to-json:
	$(foreach language,$(LANGUAGES),make po-to-json lang=$(language);)


# ===========
# bumpversion
# ===========

$(eval venvpath     := .venv27)
$(eval bumpversion  := $(venvpath)/bin/bumpversion)

virtualenv:
	@test -e $(venvpath)/bin/python || `command -v virtualenv` --python=`command -v python` --no-site-packages $(venvpath)

bumpversion: virtualenv
	@$(venvpath)/bin/pip install bumpversion
	$(bumpversion) $(bump)


# =======
# release
# =======

push:
	git push && git push --tags
	git push lqdn && git push lqdn --tags

release: bumpversion push
