all: build

build:
	rm -rf public/*
	hugo

deploy: build
	cd public ; git add --all; git commit -m 'deploy' ; git push origin master
	git add public ; git commit -m 'deploy' ; git push origin master
