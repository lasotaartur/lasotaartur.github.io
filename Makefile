help:
	@grep -E '(^[a-zA-Z0-9_-]+:.*?##.*$$)|(^##)' Makefile | awk 'BEGIN {FS = ":.*?## "}{printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'

### Environment
s:start
start: ## Create environment (s)
	docker build -t my-jekyll-site .
	docker run --rm -p 4000:4000 -v .:/srv/jekyll --name myblog my-jekyll-site

sh:shell
shell: ## Shell in php container (sh)
	docker exec -it myblog bash

r:remove
remove: ## Remove environment (r)
	docker rm myblog