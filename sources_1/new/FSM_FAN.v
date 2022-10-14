`timescale 1ns / 1ps

module FSM_FAN(
    input i_clk,
    input i_reset,
    input [4:0] i_button,

    output [2:0] o_fanState
    );

    parameter FAN_OFF = 3'b000,
              FAN_200 = 3'b001,
              FAN_400 = 3'b010,
              FAN_600 = 3'b011,
              FAN_800 = 3'b100;

    reg [2:0] nextState = 0, curState = 0;
    reg [2:0] r_fanState;

    assign o_fanState = r_fanState;

    always @(posedge i_clk or posedge i_reset)begin 
        if(i_reset) curState <= FAN_OFF;
        else        curState <= nextState;
        end

    always @(curState or i_button) begin
        case (curState)
        FAN_OFF : begin
        if(i_button[1])      nextState <= FAN_200;
        else if(i_button[2]) nextState <= FAN_400;
        else if(i_button[3]) nextState <= FAN_600;
        else if(i_button[4]) nextState <= FAN_800;
        else                 nextState <= FAN_OFF;
        end
        FAN_200 : begin
        if(i_button[0])      nextState <= FAN_OFF;
        else if(i_button[2]) nextState <= FAN_400;
        else if(i_button[3]) nextState <= FAN_600;
        else if(i_button[4]) nextState <= FAN_800;
        else                 nextState <= FAN_200;
        end
        FAN_400 : begin
        if(i_button[0])      nextState <= FAN_OFF;
        else if(i_button[1]) nextState <= FAN_200;
        else if(i_button[3]) nextState <= FAN_600;
        else if(i_button[4]) nextState <= FAN_800;
        else                 nextState <= FAN_400;
        end
        FAN_600 : begin
        if(i_button[0])      nextState <= FAN_OFF;
        else if(i_button[1]) nextState <= FAN_200;
        else if(i_button[2]) nextState <= FAN_400;
        else if(i_button[4]) nextState <= FAN_800;
        else                 nextState <= FAN_600;    
        end
        FAN_800 : begin
        if(i_button[0])      nextState <= FAN_OFF;
        else if(i_button[1]) nextState <= FAN_200;
        else if(i_button[2]) nextState <= FAN_400;
        else if(i_button[3]) nextState <= FAN_600;
        else                 nextState <= FAN_800;   
        end
        endcase
    end

    always @(curState) begin
        case (curState)
            FAN_OFF : r_fanState <= 3'b000;
            FAN_200 : r_fanState <= 3'b001;
            FAN_400 : r_fanState <= 3'b010;
            FAN_600 : r_fanState <= 3'b011;
            FAN_800 : r_fanState <= 3'b100;
            default : r_fanState <= 3'b000;
        endcase
    end
endmodule
