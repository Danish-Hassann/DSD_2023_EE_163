`timescale 1ns / 1ps

module DSD_lab3( output x,y,
    input a,b,c);
    assign x = ~c ^ (a | b);
    assign y = (~(a & b) ^ (a | b)) & (a | b); 
endmodule
