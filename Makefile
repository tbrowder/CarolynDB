
.PHONY: docs docs-html docs-pdf docs-all

DOCS_DIR=build/docs
HTML=$(DOCS_DIR)/index.html
PDF=$(DOCS_DIR)/CarolynDB.pdf

docs: docs-html

docs-html:
	@mkdir -p $(DOCS_DIR)
	@raku -e "use Pod::To::HTML; say to-html slurp 'docs/Guide.rakudoc'" > $(HTML)
	@if [ -n "$$CAROLYNDB_FONT_URL" ]; then \
	  awk 'NR==1{print} NR==1{print "<link rel=\"preconnect\" href=\"https://fonts.gstatic.com\" crossorigin>\n<link rel=\"stylesheet\" href=\"'"$$CAROLYNDB_FONT_URL"'\">"} NR!=1{print}' $(HTML) > $(HTML).tmp && mv $(HTML).tmp $(HTML); \
	fi
	@echo "HTML docs at $(HTML)"

docs-pdf: docs-html
	@which wkhtmltopdf >/dev/null 2>&1 && wkhtmltopdf $(HTML) $(PDF) || \
	(which pandoc >/dev/null 2>&1 && pandoc $(HTML) -o $(PDF)) || \
	(echo 'Install wkhtmltopdf or pandoc to build PDF' && exit 1)
	@echo "PDF at $(PDF)"

docs-all: docs-html docs-pdf
	@echo "Built HTML and PDF docs"
