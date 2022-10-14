`timescale 1ns / 1ps

module Comparator(
    input [9:0] i_counter,

    output o_pwm200, o_pwm400, o_pwm600, o_pwm800
    );

    assign o_pwm200 = (i_counter < 200) ? 1'b1 : 1'b0;
    assign o_pwm400 = (i_counter < 400) ? 1'b1 : 1'b0;
    assign o_pwm600 = (i_counter < 600) ? 1'b1 : 1'b0;
    assign o_pwm800 = (i_counter < 800) ? 1'b1 : 1'b0;

endmodule
