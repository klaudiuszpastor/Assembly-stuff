flags=-O2 -f elf32
ldflags=-m elf_i386 
asm=nasm
sources := $(wildcard *.asm)
objects := $(sources:.asm=.o)
binaries := $(objects:.o=)

.PHONY: all clean

all: $(binaries)

$(binaries): $(objects)
	ld $(ldflags) $< -o $@

%.o: %.asm
	$(asm) $(flags) $^

clean:
	rm -f $(binaries) $(objects)

