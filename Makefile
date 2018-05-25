.PHONY: encrypt decrypt

encrypt:
	gpg --output group_vars/sovereign.gpg --encrypt --recipient cayek@caye.eu group_vars/sovereign
	tar czvf secret.tar.gz secret
	gpg --output secret.tar.gz.gpg --encrypt --recipient cayek@caye.eu secret.tar.gz
	rm -f secret.tar.gz

decrypt:
	gpg --output group_vars/sovereign --decrypt group_vars/sovereign.gpg
	gpg --output secret.tar.gz --decrypt secret.tar.gz.gpg
	tar xvf secret.tar.gz

