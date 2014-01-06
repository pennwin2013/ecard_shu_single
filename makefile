MAKE=make
all:
	chmod +x src/db/.cleandb.sh src/db/.gendb.sh
	cd src/tool && $(MAKE)
	cd src/db && $(MAKE) install
	cd src/public && $(MAKE)
	cd src/ecardsvr && $(MAKE)

clean:
	chmod +x src/db/.cleandb.sh src/db/.gendb.sh
	chmod +x src/public/.cleanpublic.sh
	cd src/tool && $(MAKE) clean
	cd src/db && $(MAKE) clean
	cd src/public && $(MAKE) clean
	cd src/ecardsvr && $(MAKE) clean
