`timescale 1ns / 1ps

module decoder_led(
    input [2:0] i_fanState,

    output [3:0] o_Led
    );

    reg [3:0] r_Led;

    assign o_Led = r_Led;

    always @(i_fanState) begin
        case (i_fanState)
            3'h0 : r_Led <= 4'b0000; 
            3'h1 : r_Led <= 4'b0001; 
            3'h2 : r_Led <= 4'b0011; 
            3'h3 : r_Led <= 4'b0111; 
            3'h4 : r_Led <= 4'b1111; 
            default : r_Led <= 4'b0000;
        endcase
    end
endmodule
