flags=-O2 -f elf64
ldflags=
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

