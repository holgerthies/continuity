SUBDIRS := mf rlzrs metric incone

all:
		cd mf; make;
		cd rlzrs; make COQEXTRAFLAGS="-R ../mf mf"; 
		cd metric;make COQEXTRAFLAGS="-R ../mf mf -R ../rlzrs rlzrs";
		cd incone;make COQEXTRAFLAGS="-R ../mf mf -R ../rlzrs rlzrs -R ../metric metric"

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
		cd mf; make install;
		cd rlzrs; make install;
		cd metric; make install;
	  cd incone; make install
