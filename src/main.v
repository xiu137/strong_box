`include "getdirc.v"
module main (
    input clk,
    input [3:0] password0,
    input [3:0] password1,
    input [3:0] password2,
    input [3:0] password3,
    input [3:0] password4,
    input [3:0] password5,
    input [9:0] keypad,
    input tryopen,
    output lock//
);
    reg [3:0] password[5:0];
    wire direction;
    reg [2:0] pointer;

initial begin
    password[0] = password0==0? 9 : password0-1;
    password[1] = password1==9? 0 : password1+1;
    password[2] = password2==0? 9 : password2-1;
    password[3] = password3==9? 0 : password3+1;
    password[4] = password4==0? 9 : password4-1;
    password[5] = password5==9? 0 : password5+1;
    pointer = 0;
end

assign lock = (keypad[password5]==1 && tryopen == 1 && pointer == 5) ? 1 : 0;

getdirc inputs(clk, keypad, direction);

always @(posedge direction)begin
    case (pointer)
        3'b000: pointer <= keypad[password[0]]==1 ? 1 : 0;
        3'b010: pointer <= keypad[password[2]]==1 ? 3 : 0;
        3'b100: pointer <= keypad[password[4]]==1 ? 5 : 0;
    endcase
end
always @(negedge direction) begin
    case (pointer)
        3'b001: pointer <= keypad[password[1]]==1 ? 2 : 0;
        3'b011: pointer <= keypad[password[3]]==1 ? 4 : 0;
    endcase
end

endmodule