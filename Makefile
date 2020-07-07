
.PHONY: coverage test

build:
	chmod +x entrypoint.sh
	chmod +x test/entrypoint.test.sh
	docker build -t javanile/lcov-sh-action .
	docker build -t javanile/lcov-sh-action/test ./test

test: build
	docker run --rm -v $(PWD):/lcov-sh-action javanile/lcov-sh-action/test test/entrypoint.test.sh

coverage: build
	docker run --rm -v $(PWD):/lcov-sh-action javanile/lcov-sh-action/test lcov.sh test/entrypoint.test.sh

push:
	git config credential.helper 'cache --timeout=3600'
	git add .
	git commit -am "push"
	git push
