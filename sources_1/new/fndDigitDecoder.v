`timescale 1ns / 1ps

module fndDigitDecoder(
    input [1:0] i_sel,
    output [3:0] o_digitPosition
    );

    reg [3:0] r_digitPosition;

    assign o_digitPosition = r_digitPosition;

    always @(i_sel) begin
        case (i_sel)
            2'h0 : r_digitPosition <= 4'b1110;
            2'h1 : r_digitPosition <= 4'b1101;
            2'h2 : r_digitPosition <= 4'b1011;
            2'h3 : r_digitPosition <= 4'b0111;
        endcase
    end
endmodule
