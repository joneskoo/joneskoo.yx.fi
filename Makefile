.PHONY: build
build:
	rm -rf public
	hugo

deploy: build
	rsync -aP --iconv=utf-8-mac,utf-8 --delete --exclude-from=exclude-list.txt public/ lakka:www/
