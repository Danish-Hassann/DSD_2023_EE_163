`timescale 1ns / 1ps
`timescale 1ns / 1ps

module Lab_4(
input [1:0] a,
input [1:0] b,
output logic red,
output logic green,
output logic blue
    );
always @(*) begin
    red = (~b[0] & ~b[1]) | (a[0] & a[1]) | (a[1] & ~b[0]) | (a[0] & ~b[0]) | (a[0] & ~b[1]); // Red
    green = (b[1] & b[0]) | (~a[0] & ~a[1]) | (~a[0] & b[0]) | (~a[1] & b[0]) | (~a[0] & b[1]); // Green
    blue = (~a[1] & b[1]) | (a[1] & ~b[1]) | (a[0] & ~b[0]) | (~a[0] & b[0]); // Blue
end
endmodule
