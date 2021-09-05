# ===================
# i18next translation
# ===================

# Which translation files to convert from
# GNU gettext PO format into i18next JSON format
LANGUAGES = $(basename $(notdir $(wildcard po/*.po) ))

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

$(eval venvpath     := .venv)
$(eval pip          := $(venvpath)/bin/pip)
$(eval python       := $(venvpath)/bin/python)
$(eval bump2version := $(venvpath)/bin/bump2version)

virtualenv:
	@test -e $(python) || python3 -m venv --system-site-packages $(venvpath)

bumpversion: virtualenv
	@$(venvpath)/bin/pip install bump2version
	$(bump2version) $(bump)


# =======
# release
# =======

push:
	git push && git push --tags
	git push lqdn && git push lqdn --tags

release: bumpversion push
