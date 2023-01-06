module getdirc (
    input clk,
    input [9:0] keypad,
    output direction//正转为1，反转为0
);
    reg direction;
    reg [9:0] lastkeypad;
    always @(posedge clk) begin
        case (lastkeypad)
            10'b0000000001: if (keypad[1]==1) direction <= 0;else if (keypad[9]==1) direction <= 1;
            10'b0000000010: if (keypad[2]==1) direction <= 0;else if (keypad[0]==1) direction <= 1;
            10'b0000000100: if (keypad[3]==1) direction <= 0;else if (keypad[1]==1) direction <= 1;
            10'b0000001000: if (keypad[4]==1) direction <= 0;else if (keypad[2]==1) direction <= 1;
            10'b0000010000: if (keypad[5]==1) direction <= 0;else if (keypad[3]==1) direction <= 1;
            10'b0000100000: if (keypad[6]==1) direction <= 0;else if (keypad[4]==1) direction <= 1;
            10'b0001000000: if (keypad[7]==1) direction <= 0;else if (keypad[5]==1) direction <= 1;
            10'b0010000000: if (keypad[8]==1) direction <= 0;else if (keypad[6]==1) direction <= 1;
            10'b0100000000: if (keypad[9]==1) direction <= 0;else if (keypad[7]==1) direction <= 1;
            10'b1000000000: if (keypad[0]==1) direction <= 0;else if (keypad[8]==1) direction <= 1;
        endcase
        lastkeypad <= keypad;
    end
endmodule