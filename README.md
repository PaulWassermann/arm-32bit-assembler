# arm-32bit-assembler

This repository contains small programs I wrote to get familiar with ARM 32-bit assembly.

Code was made following the [ARM Assembly By Example](https://armasm.com/)

## Requirements

To be able to assemble, link and run the code, one should have a 32-bit or 64-bit ARM processor and a machine with 
the binutils toolchain for target arm-linux-gnueabihf.

## Compile

A single `build.sh` file is provided to compile every program listed in `src`. Running `./build.sh -h` will yield :

```text
Usage: ./build.sh -p <program-number> [-d] [-h]
   -p <program-number>  Program number to build (mandatory)
   -d                   Enable debug symbols for the assembler
   -h                   Show this help message
```

## License

See `LICENSE`.
