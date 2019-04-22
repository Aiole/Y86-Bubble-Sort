YCC=/home/users/mharmon/cs277/bin/yas
YIS=/home/users/mharmon/cs277/bin/yis
CC=gcc
COPTS=-save-temps -Og -std=c99 -Wall 
SOURCES=bsort.ys
OBJ=bsort.yo
BEXEC=bsort
CEXEC=csort
COBJS=sort.c
CMOVEXEC=cmovsort
CMOVOBJ=cmov.yo
CMOVSRC=cmov.ys


all: $(CEXEC) cleantemps $(BEXEC) $(CMOVEXEC) 

$(BEXEC): $(OBJ)
	@echo $(YIS) $(OBJ) >$(BEXEC)
	@chmod 755 $(BEXEC)

$(CMOVEXEC): $(CMOVOBJ)
	@echo $(YIS) $(CMOVOBJ) >$(CMOVEXEC)
	@chmod 755 $(CMOVEXEC)

$(CEXEC): $(COBJS)
	$(CC) $(COPTS) $(COBJS) -o $(CEXEC)


$(OBJ): $(SOURCES)
	$(YCC) $(SOURCES)

$(CMOVOBJ): $(CMOVSRC)
	$(YCC) $(CMOVSRC)

clean: 
	rm -f $(CMOVEXEC) $(BEXEC) $(CEXEC) *.s *.o *.yo *.bc *.i

cleantemps:
	@rm -f *.i *.bc *.o
