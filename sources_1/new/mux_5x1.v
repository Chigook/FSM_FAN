`timescale 1ns / 1ps

module mux_5x1(
    input [3:0] i_x,
    input [2:0] i_sel,

    output o_motor
    );

    reg [3:0] r_motor = 0;
    assign o_motor = r_motor;

    always @(*) begin
        case (i_sel)
        3'h0 : r_motor <= 1'b0;
        3'h1 : r_motor <= i_x[0];
        3'h2 : r_motor <= i_x[1];
        3'h3 : r_motor <= i_x[2];
        3'h4 : r_motor <= i_x[3];
        default : r_motor <= 1'b0;
        endcase
    end
endmodule
