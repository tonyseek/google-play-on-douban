SRC = src.coffee
DST = google-play-on-douban.user.js

$(DST): $(SRC) description.js
	cat description.js > $(DST)
	coffee -p -c $(SRC) >> $(DST)

clean:
	rm -f ./*.user.js

.PHONY: clean
