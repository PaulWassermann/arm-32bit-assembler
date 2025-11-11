# Enable GDB TUI and show both source code and disassemble
tui layout split

# Set breakpoint to _start entrypoint
break _start

# Run program until first breakpoint
run
