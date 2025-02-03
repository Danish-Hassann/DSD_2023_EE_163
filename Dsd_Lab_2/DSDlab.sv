`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/03/2025 11:30:12 PM
// Design Name: 
// Module Name: DSDlab3
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module DSDlab3( output x,y,
    input a,b,c);
    assign x = !c ^ (a & b);
    assign y = (!(a & b) ^ (a | b)) & (a & b); 
endmodule
