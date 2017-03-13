all: build

build:
	hugo

deploy: build
	cd public
	git add -A
	git commit -m 'deploy'
	git push origin master
	cd ..
	git add public
	git commit -m 'deploy'
	git push origin master
