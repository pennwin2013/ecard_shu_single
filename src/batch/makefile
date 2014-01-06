include $(HOME)/ykt/src/mak/mkstand.mak
TARGET=dbclean posdtlacc waterdtlacc dayendbala coldatasvr colposdtl svrmonitor gatesvr  custsyncsvr statsvr posdatasvr closesvr

SOURCE=

PUBOBJ=ConfigFile.o logger_imp.o

BINDIR=$(HOME)/ykt/bin

#APLIBS=-L $(HOME)/ykt/lib -ldrtplib -lkcrypto -lboost_thread -lbccpub -lpubdb 
APLIBS=-L$(HOME)/ykt/lib -lstdc++  -lpubfunc -llog4cplus  -lpubdb  -lecarddbcfg

# =====================================================
all:$(TARGET)

clean:
	@./.cleanbatch.sh
	@rm -f *.o *.bnd *.lis tp*
dbclean:dbclean.o $(PUBOBJ) $(HOME)/ykt/lib/libpubdb.a
	$(CXX) $(CCFLAGS) $(INCLD) $(LIBS) -o $@  $@.o  $(PUBOBJ) $(APLIBS) $(LIBSUDF)
	strip $@	
	mv $@  $(BINDIR)
dayendbala:dayendbala.o $(PUBOBJ)  $(HOME)/ykt/lib/libpubdb.a
	$(CXX) $(CCFLAGS) $(INCLD) $(LIBS) -o $@  $@.o  $(PUBOBJ) $(APLIBS) $(LIBSUDF)
	strip $@	
	mv $@  $(BINDIR)
posdtlacc:posdtlacc.o $(PUBOBJ) $( $(HOME)/ykt/lib/libpubdb.a
	$(CXX) $(CCFLAGS) $(INCLD) $(LIBS) -o $@ $@.o $(PUBOBJ) $(APLIBS) $(LIBSUDF)
	strip $@	
	mv $@ $(BINDIR)
posdatasvr:posdatasvr.o $(PUBOBJ) $( $(HOME)/ykt/lib/libpubdb.a
	$(CXX) $(CCFLAGS) $(INCLD) $(LIBS) -o $@ $@.o $(PUBOBJ) $(APLIBS) $(LIBSUDF)
	strip $@	
	mv $@ $(BINDIR)
closesvr:closesvr.o $(PUBOBJ) $( $(HOME)/ykt/lib/libpubdb.a
	$(CXX) $(CCFLAGS) $(INCLD) $(LIBS) -o $@ $@.o $(PUBOBJ) $(APLIBS) $(LIBSUDF)
	strip $@	
	mv $@ $(BINDIR)
coldatasvr:coldatasvr.o $(PUBOBJ) $( $(HOME)/ykt/lib/libpubdb.a
	$(CXX) $(CCFLAGS) $(INCLD) $(LIBS) -o $@ $@.o $(PUBOBJ) $(APLIBS) $(LIBSUDF)
	strip $@	
	mv $@ $(BINDIR)	
dpsdtlacc:dpsdtlacc.o $(PUBOBJ) $( $(HOME)/ykt/lib/libpubdb.a
	$(CXX) $(CCFLAGS) $(INCLD) $(LIBS) -o $@ $@.o $(PUBOBJ) $(APLIBS) $(LIBSUDF)
	strip $@	
	mv $@ $(BINDIR)
gatesvr:gatesvr.o $(PUBOBJ) $( $(HOME)/ykt/lib/libpubdb.a
	$(CXX) $(CCFLAGS) $(INCLD) $(LIBS) -o $@ $@.o $(PUBOBJ) $(APLIBS) $(LIBSUDF)
	strip $@
	mv $@ $(BINDIR)
waterdtlacc:waterdtlacc.o  $(PUBOBJ) $(HOME)/ykt/lib/libpubdb.a
	$(CXX) $(CCFLAGS) $(INCLD) $(LIBS) -o $@ $@.o  $(PUBOBJ) $(APLIBS) $(LIBSUDF)
	strip $@	
	mv $@ $(BINDIR)
custsyncsvr:custsyncsvr.o  $(PUBOBJ) $(HOME)/ykt/lib/libpubdb.a
	$(CXX) $(CCFLAGS) $(INCLD) $(LIBS) -o $@ $@.o  $(PUBOBJ) $(APLIBS) $(LIBSUDF)
	strip $@	
	mv $@ $(BINDIR)
getbaladata:getbaladata.o $(HOME)/ykt/lib/libpubdb.a
	$(CXX) $(CCFLAGS) $(INCLD) $(LIBS) -o $@ $@.o $(APLIBS) $(LIBSUDF)
	strip $@	
	mv $@ $(BINDIR)
statsvr:statsvr.o $(PUBOBJ) $(HOME)/ykt/lib/libpubdb.a
	$(CXX) $(CCFLAGS) $(INCLD) $(LIBS) -o $@ $@.o $(PUBOBJ)  $(APLIBS) $(LIBSUDF)
	strip $@
	mv $@ $(BINDIR)
	@echo "SUCCESS"
colposdtl:colposdtl.o $(PUBOBJ) $(HOME)/ykt/lib/libpubdb.a
	$(CXX) $(CCFLAGS) $(INCLD) $(LIBS) -o $@ $@.o $(PUBOBJ) $(APLIBS) $(LIBSUDF)
	strip $@	
	mv $@ $(BINDIR)
svrmonitor:svrmonitor.o
	$(CXX) $(CCFLAGS) $(INCLD) $(LIBS) -o $@ $@.o $(APLIBS) $(LIBSUDF)
	strip $@	
	mv $@ $(BINDIR)

