cd ./src
del *.o
del *.vcd
iverilog -o testbench.o maintest.v
vvp testbench.o
gtkwave test.vcd