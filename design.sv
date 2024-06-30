`timescale 1ns / 1ps

module LiftC(
    input clk,
    input reset,
    input [6:0] req_floor,
    output reg [1:0] door,
    output reg [1:0] Up,
    output reg [1:0] Down,
    output reg [1:0] stop,
    output reg [6:0] y
);

reg [6:0] cf;

always @ (posedge clk or posedge reset) begin
    if (reset) begin
        cf <= 6'd0;
        stop <= 2'd1;
        door <= 2'd1;
        Up <= 2'd0;
        Down <= 2'd0;
    end else begin
        if (req_floor < 6'd61) begin
            if (req_floor < cf) begin
                cf <= cf - 1;
                door <= 2'd0;
                stop <= 2'd0;
                Up <= 2'd0;
                Down <= 2'd1;
            end else if (req_floor > cf) begin
                cf <= cf + 1;
                door <= 2'd0;
                stop <= 2'd0;
                Up <= 2'd1;
                Down <= 2'd0;
            end else if (req_floor == cf) begin
                cf <= req_floor;
                door <= 2'd1;
                stop <= 2'd1;
                Up <= 2'd0;
                Down <= 2'd0;
            end
        end
    end
end

assign y = cf;

endmodule