SHELL := bash

.PHONY: filtrar

filtrar:
	uv run filtrado/filtro_DOCX_RI.py

proba:
	@jq -r '.[890].[].[0].lingua.gl."definición"' RI.json \
	| typst c --format html --features html - - \
	| xq --html -n -q "body > p" > proba.html
