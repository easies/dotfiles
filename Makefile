.PHONY: sync

sync:
	rsync --exclude ".git/" \
	      --exclude ".DS_Store" \
	      --exclude "Makefile" \
	      --exclude "README.md" \
		  --exclude "encrypted/" \
	      -av . ${HOME}
	./bin/decrypt_all.sh encrypted
