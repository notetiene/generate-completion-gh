# -*- mode: makefile -*-
# vim:ft=make:

OUTPUT_DIR = .
BASH_DEBUG_PREFACE ?= "In GitHub cli bash completion setup"
BASH_OUTPUT_FILENAME ?= bash-completion-setup.bash
ZSH_DEBUG_PREFACE ?= "In GitHub cli zsh completion setup"
ZSH_OUTPUT_FILENAME ?= zsh-completion-setup.zsh

.PHONY : all
all : bash-completion zsh-completion

.PHONY : bash-completion
bash-completion :
	@echo Generating GitHub cli bash completion setup script
	@/bin/echo -e "# -*- mode: sh; sh-shell: bash -*-\\n\
# vim:ft=sh:\\n\
\\n\
# /bin/echo -e '$(BASH_DEBUG_PREFACE)'\\n\
\\n\
eval \"\$$(gh completion -s bash)\"" > $(OUTPUT_DIR)/$(BASH_OUTPUT_FILENAME)

.PHONY : zsh-completion
zsh-completion :
	@echo Generating GitHub cli ZSH completion setup script
	@/bin/echo -e "# -*- mode: sh; sh-shell: zsh -*-\\n\
# vim:ft=sh:\\n\
\\n\
# /bin/echo -e '$(ZSH_DEBUG_PREFACE)'\\n" > $(OUTPUT_DIR)/$(ZSH_OUTPUT_FILENAME) &&\
	gh completion -s zsh >> $(OUTPUT_DIR)/$(ZSH_OUTPUT_FILENAME)

.PHONY : clean
clean :
	rm -f $(OUTPUT_DIR)/$(BASH_OUTPUT_FILENAME)
	rm -f $(OUTPUT_DIR)/$(ZSH_OUTPUT_FILENAME)
