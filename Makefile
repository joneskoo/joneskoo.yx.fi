.PHONY: build
build:
	rm -rf public
	hugo

deploy: build
	rsync -rPc --iconv=utf-8-mac,utf-8 --delete --exclude-from=exclude-list.txt public/ lakka:www/

run:
	hugo serve -w
