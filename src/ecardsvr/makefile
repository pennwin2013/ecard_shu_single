include ../mak/mkstand.mak
LDFLAGS=-L../../lib  -lnetsvr -lfdxsmsg -lboost_filesystem -lboost_date_time -lboost_system -lboost_thread -lpthread -lrt -llog4cplus -lmessage -ljson_linux-gcc-4.1.2_libmt

APLIBS=-L$(HOME)/ykt/lib -lstdc++ -lpubfunc  -lpubdb -ltransfer -lecarddbcfg
INCLD+=-I../include/fdxsmsglib

all:ecardsvr-fd

FUNC=\
F870023

SOURCE=\
config_imp\
logger_imp\
ecardmain
#系统初始化从右向左开始,SOURCE需要最先初始化,必须放在右边
OBJS=$(FUNC:=.o) $(SOURCE:=.o)
ecardmain.o:$(OBJS)
ecardsvr-fd:$(OBJS)
	$(CXX) $(CCFLAGS) $(INCLD) -o $@ $(OBJS)  $(APLIBS) $(LIBSUDF) $(LDFLAGS)
	strip $@
	mv $@ ../../bin
	@echo "SUCCESS"
clean:
	@rm -f *.o tp* *.lis
