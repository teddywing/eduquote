.PHONY: test
test:
	prove -v -I./t

.PHONY: doc
doc: eduquote.1

eduquote.1: eduquote
	pod2man $< > $@
