`timescale 1ns / 1ps

module top_Fan(
    input i_clk,
    input i_reset,
    input [4:0] i_button,

    output o_motor,
    output [3:0] o_Led
    );

    wire w_clk;
    ClockDivider_1MHz clkdiv(
        .i_clk(i_clk),
        .i_reset(i_reset),
        .o_clk(w_clk)
    );

    wire [9:0] w_counter;
    Counter upcounter(
        .i_clk(w_clk),
        .i_reset(i_reset),
        .o_counter(w_counter)
    );

    wire [3:0] w_pwm;
    Comparator cmp(
        .i_counter(w_counter),
        .o_pwm200(w_pwm[0]),
        .o_pwm400(w_pwm[1]),
        .o_pwm600(w_pwm[2]),
        .o_pwm800(w_pwm[3])
    );

    wire [4:0] w_button;
    ButtonController btn0(
        .i_clk(i_clk),
        .i_reset(i_reset),
        .i_button(i_button[0]),
        .o_button(w_button[0])
    );
    ButtonController btn1(
        .i_clk(i_clk),
        .i_reset(i_reset),
        .i_button(i_button[1]),
        .o_button(w_button[1])
    );
    ButtonController btn2(
        .i_clk(i_clk),
        .i_reset(i_reset),
        .i_button(i_button[2]),
        .o_button(w_button[2])
    );
    ButtonController btn3(
        .i_clk(i_clk),
        .i_reset(i_reset),
        .i_button(i_button[3]),
        .o_button(w_button[3])
    );
    ButtonController btn4(
        .i_clk(i_clk),
        .i_reset(i_reset),
        .i_button(i_button[4]),
        .o_button(w_button[4])
    );

    wire [2:0] w_fanState;
    FSM_FAN FSM(
        .i_clk(i_clk),
        .i_reset(i_reset),
        .i_button(w_button),
        .o_fanState(w_fanState)
    );

    decoder_led led(
        .i_fanState(w_fanState),
        .o_Led(o_Led)
    );

    mux_5x1 led_mux(
        .i_x(w_pwm),
        .i_sel(w_fanState),
        .o_motor(o_motor)
    );
endmodule
