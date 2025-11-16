/*
Define the entrypoint of the ELF output file, i.e the first executable instruction.
*/
ENTRY(_ResetHandler)

/*
Memory layout of the hardware processor, defined in section "5. Memory mapping" of the Datasheet
*/
MEMORY {
    FLASH  (rx)  : ORIGIN = 0x08000000, LENGTH = 256K
    CCMRAM (rwx) : ORIGIN = 0x10000000, LENGTH = 8K
    SRAM   (rwx) : ORIGIN = 0x20000000, LENGTH = 40K
}

SECTIONS {
    /*
    The vector table needs to be put first in flash memory because it contains necessary information needed by the
    processor
    */
    .text : {
        *(.vector_table)
        *(.text)
    } >FLASH

    /*
    The NOLOAD directive indicates to the linker that memory should be allocated to the section at runtime but 
    nothing to be done when the program is loaded
    */
    .data (NOLOAD) : {
        /*
        We reserve space for the stack before any other data; that's because, since the stack grows downwards,
        even if we overflow the stack there is no risk of overwriting useful data ; 1K reserved for the stack
        */
        . = . + 0x400;
        _StackEnd = .;
        *(.data)
    } >SRAM
}
