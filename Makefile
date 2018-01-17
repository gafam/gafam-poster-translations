# Which translation files to convert from
# GNU gettext PO format into i18next JSON format
LANGUAGES = fr en de jp


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
