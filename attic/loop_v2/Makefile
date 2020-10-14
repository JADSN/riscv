PROGRAM=main

OBJDIR=./obj
SRCDIR=./src

all: build run

# build: comp link strip
build: comp link

comp:
	mkdir -p obj
	riscv64-linux-gnu-as --gstabs+ -march=rv64gc -o $(OBJDIR)/$(PROGRAM).o $(SRCDIR)/$(PROGRAM).s

link:
	riscv64-linux-gnu-ld -o $(PROGRAM).exe $(OBJDIR)/$(PROGRAM).o

strip:
	strip $(PROGRAM).exe

clean:
	rm -rf $(OBJDIR) $(PROGRAM).exe

run:
	@echo "--------------------------------------------"
	# objdump -D -s $(PROGRAM).exe
	objdump -d $(PROGRAM).exe
	@echo "--------------------------------------------"
	./$(PROGRAM).exe ; echo $$?
	@echo
	@echo
