.PHONY: sync

sync:
	rsync --exclude ".git/" \
	      --exclude ".DS_Store" \
	      --exclude "Makefile" \
	      --exclude "README.md" \
	      -av . ${HOME}
