include $(HOME)/ykt/src/mak/mkstand.mak
TARGET=libpubfunc.a libecarddbcfg.a
LIBDIR=../../lib

SOURCE= \
acctrans\
mac\
pubfunc\
dbfunc\
dbfunc_foo\
interfacefunc\
transfunc\
clsoper\
clscard\
doorfunc\
d3des\
Base64\
md5\
rsa\
rijndael-alg-fst\
rijndael-api-fst\
gnudes\
cpucard\
ConfigFile


DBCFGSRC=\
ecarddbcfg\
md5\
gnudes\
ConfigFile

# =====================================================
all:$(TARGET)
	mv $(TARGET) $(LIBDIR)
	@echo $(TARGET) is moved to $(LIBDIR)
	@echo "SUCCESS"
	
clean:
	@./.cleanpublic.sh
	rm -f *.o $(TARGET) tp*


libpubfunc.a:$(SOURCE:=.o)  $(LIBDIR)/libpubdb.a
	$(AR) $(ARFLAGS) $@ $(SOURCE:=.o)
  
libecarddbcfg.a:$(DBCFGSRC:=.o)
	$(AR) $(ARFLAGS) $@ $(DBCFGSRC:=.o)

