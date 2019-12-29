# notebook.mk -- a stupid-simple markdown notebook
# https://github.com/mgirouard/notebook

# Define SRC to change the source path for the markdown files.
# If not set it defaults to the current directory.
#
# Define DEST to change the destination path for the generated HTML files.
# If not set it defaults to the current directory.
#
# Define EXT to change the extension to use for markdown files.
# If not set it defaults to 'md'
#
# Define HEADER to specify a HTML header file used to prefix the generated
# markup.
#
# Define FOOTER to specify a HTML footer file used to suffix the generated
# markup.
#
# Define HOOK_TARGET to specify a preferred target to call if using the
# `post-commit` hook. When this file is used as a stand-alone makefile this can
# remain unset and the default target will work as-is.
SRC         ?= ./
DEST        ?= ./
EXT         ?= md
HEADER      ?=
FOOTER      ?=
HOOK_TARGET ?=

mds   = $(shell find $(SRC) -name '*.$(EXT)')
htmls = $(subst $(SRC),$(DEST),$(mds:.$(EXT)=.html))

# Generates markup from markdown
# HTML files are only generated when new source content exists.
$(htmls): SHELL = bash
$(htmls): $(mds)
	$(foreach f,$(mds),markdown '$(f)' > '$(f:.$(EXT)=.html)';)
ifdef HEADER
	$(foreach f,$(htmls), cat <<<"$$(cat '$(HEADER)' '$(f)')" > '$(f)';)
endif
ifdef FOOTER
	$(foreach f,$(htmls), cat <<<"$$(cat '$(FOOTER)' '$(f)')" > '$(f)';)
endif

# Auto-generates markup
ifneq ($(wildcard .git/.),)
.git/hooks/post-commit:
	echo 'export SRC=$(SRC)' > $@
	echo 'export DEST=$(DEST)' >> $@
	echo 'export EXT=$(EXT)' >> $@
ifdef HEADER
	echo 'export HEADER=$(HEADER)' >> $@
endif
ifdef FOOTER
	echo 'export FOOTER=$(HEADER)' >> $@
endif
	echo 'make $(HOOK_TARGET)' >> $@
	chmod +x $@
endif
