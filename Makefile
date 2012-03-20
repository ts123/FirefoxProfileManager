
SRC=t.scpt
DST=FirefoxProfileManager.app

all: ${DST}
${DST}:
	osacompile -o ${DST} ${SRC}
	cp /Applications/Firefox.app/Contents/Resources/firefox.icns \
		${DST}/Contents/Resources/applet.icns
run:
	osascript ${SRC}
test: all
	open ${DST}
dist: all
	cp -aR ${DST} /Applications/
clean:
	find . \
		! -path './.git*' \
		! -name Makefile \
		! -name '*.md' \
		! \( -name '*.scpt' -depth 1 \) \
		! \( -name '*.icns' -depth 1 \) \
		-delete
cleanall: clean
	rm -rf /Applications/${DST}

