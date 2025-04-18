CLEAN=rm
CLEANARGS=-f
BUILDPATH=build
BUILD=c64-asm.prg
SOURCEPATH=source
SOURCE=main.asm
COMPILERPATH=compiler/linux
COMPILER=acme
COMPILERREPORT=buildreport
COMPILERSYMBOLS=symbols
COMPILERARGS=-r $(BUILDPATH)/$(COMPILERREPORT) --vicelabels $(BUILDPATH)/$(COMPILERSYMBOLS) --msvc --color --format cbm -v3 --outfile
CRUNCHERPATH=cruncher/linux
CRUNCHER=pucrunch
CRUNCHERARGS=-x0x0801 -c64 -g55 -fshort
EMULATORPATH=emulator/linux
EMULATOR=x64
EMULATORARGS=
GENOSINEPATH=genosine/linux
GENOSINE=genosine
TABLESPATH=tables
TABLE1=sin1.dat
TABLE1ARGS=256 63 81 0 720 80 3 0
TABLE2=sin2.dat
TABLE2ARGS=256 0 255 0 180 20 3 1
TABLE3=sin3.dat
TABLE3ARGS=256 80 255 0 360 60 2 1
TABLE4=sin4.dat
TABLE4ARGS=256 90 255 0 720 80 1 0

all: luts compile crunch

clean:
	$(CLEAN) $(CLEANARGS) $(BUILDPATH)/* $(TABLESPATH)/*

luts:
	$(GENOSINEPATH)/$(GENOSINE) $(TABLE1ARGS) > $(TABLESPATH)/$(TABLE1)
	$(GENOSINEPATH)/$(GENOSINE) $(TABLE2ARGS) > $(TABLESPATH)/$(TABLE2)
	$(GENOSINEPATH)/$(GENOSINE) $(TABLE3ARGS) > $(TABLESPATH)/$(TABLE3)
	$(GENOSINEPATH)/$(GENOSINE) $(TABLE4ARGS) > $(TABLESPATH)/$(TABLE4)

compile:
	$(COMPILERPATH)/$(COMPILER) $(COMPILERARGS) $(BUILDPATH)/$(BUILD) $(SOURCEPATH)/$(SOURCE)

crunch:
	$(CRUNCHERPATH)/$(CRUNCHER) $(CRUNCHERARGS) $(BUILDPATH)/$(BUILD) $(BUILDPATH)/$(BUILD)


