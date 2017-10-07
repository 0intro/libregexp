CC=gcc
CFLAGS+=-Wall -Wextra -O3 -c -g
O=o
LIB=libregexp9.a

RANLIB=true

LIB=libregexp9.a

OFILES=\
	regcomp.$O\
	regerror.$O\
	regexec.$O\
	regsub.$O\
	regaux.$O\
	rregexec.$O\
	rregsub.$O\
	utf.$O\

HFILES=\
	regexp9.h\
	regcomp.h\
	utf.h\

all: $(LIB)

install: $(LIB)
	mkdir -p $(PREFIX)/share/man/man3 $(PREFIX)/share/man/man7
	install -m 0644 regexp9.3 $(PREFIX)/share/man/man3/regexp9.3
	install -m 0644 regexp9.7 $(PREFIX)/share/man/man7/regexp9.7
	mkdir -p $(PREFIX)/lib
	install -m 0644 $(LIB) $(PREFIX)/lib/$(LIB)
	mkdir -p $(PREFIX)/include
	install -m 0644 regexp9.h $(PREFIX)/include/regexp9.h

test: test.$O $(LIB)
	$(CC) -o test test.$O $(LIB)

test2: test2.$O $(LIB)
	$(CC) -o test2 test2.$O $(LIB)

$(LIB): $(OFILES)
	$(AR) $(ARFLAGS) $(LIB) $(OFILES)
	$(RANLIB) $(LIB)

%.$O: %.c
	$(CC) $(CFLAGS) $*.c

$(OFILES): $(HFILES)

clean:
	rm -f $(OFILES) $(LIB)
