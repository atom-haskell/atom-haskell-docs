all: build

build:
	node_modules/.bin/lunr-hugo -i "content/**/*.md" -o static/json/search.json -l yaml
	rm -rf public/*
	hugo

deploy: build
	cd public ; git add --all; git commit -m 'deploy' ; git push origin master
	git add public ; git commit -m 'deploy' ; git push origin master
