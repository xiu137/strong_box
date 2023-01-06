`timescale 1ms/100ns
`include "main.v"
module maintest ();
    reg clk;
    reg [9:0] keypad;
    reg tryopen;
    reg  [16:0] counter;

initial begin
    clk = 0;
    for (counter = 0; counter < 1000; counter = counter + 1) begin
        #1;
        clk = ~clk;
        end
end

initial begin
        #10;tryopen = 1;
        #10;tryopen = 0;
        #10;keypad = 10'b0010000000;
        #10;keypad = 10'b0100000000;
        #10;keypad = 10'b1000000000;
        #10;keypad = 10'b0000000001;
        #10;keypad = 10'b0000000010;//1
        #10;keypad = 10'b0000000001;
        #10;keypad = 10'b1000000000;
        #10;keypad = 10'b0100000000;
        #10;keypad = 10'b0010000000;//7
        #10;keypad = 10'b0100000000;
        #10;keypad = 10'b1000000000;
        #10;keypad = 10'b0000000001;
        #10;keypad = 10'b0000000010;
        #10;keypad = 10'b0000000100;//2
        #10;keypad = 10'b0000000010;
        #10;keypad = 10'b0000000001;
        #10;keypad = 10'b1000000000;
        #10;keypad = 10'b0100000000;//8
        #10;keypad = 10'b1000000000;
        #10;keypad = 10'b0000000001;
        #10;keypad = 10'b0000000010;
        #10;keypad = 10'b0000000100;
        #10;keypad = 10'b0000001000;//3
        #10;keypad = 10'b0000000100;
        #10;keypad = 10'b0000000010;
        #10;keypad = 10'b0000000001;
        #10;keypad = 10'b1000000000;//9
        #10;tryopen = 1;
end

//keyword = 172839
main inputers(clk, 4'b0001,4'b0111,4'b0010,4'b1000,4'b0011,4'b1001, keypad, tryopen,lockoutput);

initial begin
    $dumpfile("test.vcd");//生成vcd文件
    $dumpvars(0,maintest);//将所有变量写入vcd文件
end

endmodule