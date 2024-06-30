`timescale 1ns / 1ps

module LiftC_Tb();
    reg clk, reset;
    reg [6:0] req_floor;
    wire [1:0] stop, door, Up, Down; 
    wire [6:0] y;

    LiftC dut(clk, reset, req_floor, door, Up, Down, stop, y);

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin 
        reset = 1;
        #10;
        reset = 0;
        req_floor = 6'd5;
        #100;
        req_floor = 6'd3;
        #100;
        req_floor = 6'd8;
        #100;
        req_floor = 6'd10;
        #100;
        $finish;  // End the simulation
    end

    initial begin
        // Set up waveform dumping
        $dumpfile("liftc_tb.vcd");
        $dumpvars(0, LiftC_Tb);
    end
endmodule
