SUBDIRS := mf rlzrs metric incone

all:

clean:
		cd mf; make clean;
		cd rlzrs; make clean;
		cd metric; make clean;
		cd incone; make clean

uninstall:
		cd mf; make uninstall;
		cd rlzrs; make uninstall;
		cd metric; make uninstall;
		cd incone; make uninstall

install:
		cd mf;make; make install;
		cd rlzrs;make; make install;
		cd metric;make; make install;
	  cd incone;make; make install

.SILENT:
