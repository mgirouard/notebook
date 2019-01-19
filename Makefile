mds   = $(shell find 'notes/' -name '*.md')
htmls = $(subst notes/,html/,$(mds:.md=.html))

all: $(htmls)

clean:
	$(RM) $(htmls)

$(htmls): $(mds)
	cat <<<"$$(cat header.html)" > $@
	markdown "$(subst html/,notes/,$(@:.html=.md))" >> $@
	cat <<<"$$(cat footer.html)" >> $@

.PHONY: all clean
