`timescale 1ns / 1ps

module tb_fanLed();

    reg i_clk = 0, i_reset;
    reg [4:0] i_button;

    wire [3:0] o_Led;

    top_Fan dut(
        .i_clk(i_clk),
        .i_reset(i_reset),
        .i_button(i_button),
        .o_Led(o_Led)
    );

    always #1 i_clk = ~i_clk;

    initial begin
        #00 i_reset = 1'b1; i_button = 5'b00001;
        #5000 i_reset = 1'b0; i_button = 5'b00000;
        #5000 i_reset = 1'b0; i_button = 5'b00001;
        #5000 i_reset = 1'b0; i_button = 5'b00010;
        #5000 i_reset = 1'b0; i_button = 5'b00100;
        #5000 i_reset = 1'b0; i_button = 5'b01000;
        #5000 i_reset = 1'b0; i_button = 5'b10000;
        #5000 i_reset = 1'b0; i_button = 5'b01000;
        #5000 $finish;
    end 
endmodule
