.PHONY: all publish generate clean

all: generate

generate: publish.el
		@echo "Generating..."
		emacs --batch --load publish.el --funcall org-publish-all

publish: publish.el
		@echo "Publishing... "
		git push origin master

clean:
		@echo "Cleaning.."
		@rm -rvf *.elc
		@rm -rvf docs/*
		@rm -rvf ~/.org-timestamps/*
		echo paul-nameless.com > docs/CNAME
