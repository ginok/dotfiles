DOT_FILES = .zshrc .vimrc

all: zsh vimrc

zsh: $(foreach f, $(filter .zsh%, $(DOT_FILES)), link-dot-file-$(f))

vimrc: $(foreach f, $(filter .vimrc%, $(DOT_FILES)), link-dot-file-$(f))

.PHONY: clean

clean: $(foreach f, $(DOT_FILES), unlink-dot-file-$(f))

link-dot-file-%: %
  @echo "Create Symlink $< => $(HOME)/$<"
  @ln -snf $(CURDIR)/$< $(HOME)/$<

unlink-dot-file-%: %
  @echo "Remove Symlink $(HOME)/$<"
  @$(RM) $(HOME)/$<
