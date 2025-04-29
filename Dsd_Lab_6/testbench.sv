`timescale 1ns/1ps

module testbench;
    
    logic [3:0] input_bits;
    logic [2:0] select;
    logic clk, reset, we;
    logic [6:0] segments;
    logic [7:0] displays;
    
    // Instantiate the DUT (Device Under Test)
    seven_segment uut (
        .input_bits(input_bits),
        .select(select),
        .clk(clk),
        .reset(reset),
        .we(we),
        .segments(segments),
        .displays(displays)
    );
    
    // Clock generation
    always #5 clk = ~clk;
    
    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;
        we = 0;
        select = 3'b000;
        input_bits = 4'b0000;
        
        #10 reset = 0; // Release reset
        
        // Write values to registers
        for (int i = 0; i < 8; i++) begin
            select = i[2:0];
            input_bits = i[3:0];
            we = 1;
            #10;
            we = 0;
            #10;
        end
        
        // Read and verify stored values
        for (int i = 0; i < 8; i++) begin
            select = i[2:0];
            #10;
            $display("Select: %b, Displays: %b, Segments: %b", select, displays, segments);
        end
        
        // Finish simulation
        #20;
        $stop;
    end
    
endmodule