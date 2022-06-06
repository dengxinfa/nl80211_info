LDFLAGS=$(shell pkg-config --libs libnl-tiny)
FLAGS += -std=gnu99 -D_GNU_SOURCE
FLAGS += $(shell pkg-config --cflags libnl-tiny)

nl80211_info: nl80211_info.o
	${CC} -o $@ nl80211_info.o ${LDFLAGS} ${FLAGS}

nl80211_info.o: nl80211_info.c
	${CC} -o $@ -c $< ${FLAGS}

clean:
	rm -rf *.o
