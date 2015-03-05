all: copydocs fixfonts icons index Serverspec.docset/Info.plist

clean:
	rm -rf Serverspec.docset

tarball: all
	tar --exclude='.DS_Store' -cvzf Serverspec.tgz Serverspec.docset

site:
	git clone https://github.com/serverspec/serverspec.github.io.git site

update: site
	cd site && git reset --hard head
	cd site && git clean -fdx
	cd site && git pull origin master

patch: update
	sed -i '' 's|href="/"|href="index.html"|g' site/_layouts/layout.html
	sed -i '' 's|href="/|href="|g' site/_layouts/layout.html
	sed -i '' 's|src="/|src="|g' site/_layouts/layout.html
	sed -i '' 's|<title>Serverspec - |<title>|g' site/_layouts/layout.html

build: patch
	cd site && bundle install --deployment --path ../vendor
	cd site && bundle exec jekyll build

FONT_CSS = $(shell grep fonts.googleapis.com site/stylesheets/stylesheet.css)
FONT_CSS_URL = http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,200italic,300italic,400italic|Karla:400,700,400italic,700italic
FONT_CSS_TARGET = @import url($(FONT_CSS_URL));
fixfonts: build
ifneq ($(FONT_CSS),$(FONT_CSS_TARGET))
	$(error Font CSS has changed)
endif
	cp -r fonts site/_site/stylesheets/
	sed -i '' 's!$(FONT_CSS_URL)!fonts/fonts.css!g' site/_site/stylesheets/stylesheet.css

docset:
	mkdir -p Serverspec.docset/Contents/Resources/Documents/

Serverspec.docset/icon.png: docset
	cp icon.png Serverspec.docset/icon.png

Serverspec.docset/icon@2x.png: docset
	cp icon@2x.png Serverspec.docset/icon@2x.png

icons: Serverspec.docset/icon.png Serverspec.docset/icon@2x.png

copydocs: build docset
	cp -r site/_site/* Serverspec.docset/Contents/Resources/Documents/

index:
	rm -f Serverspec.docset/Contents/Resources/docSet.dsidx
	sqlite3 Serverspec.docset/Contents/Resources/docSet.dsidx '.read index.sql'

Serverspec.docset/Info.plist: docset
	cp Info.plist Serverspec.docset/Contents

.PHONY: update patch fixfonts build docset icons index

.SECONDARY:
