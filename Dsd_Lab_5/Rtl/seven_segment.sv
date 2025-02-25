module seven_segment(
    input logic [3:0] input_bits,
    input logic [2:0] select,
    output logic A, B, C, D, E, F, G, S1,S2,S3,S4,S5,S6,S7,S8, Dp
);
    assign {S8,S7,S6,S5,S4,S3,S2,S1} = ~(8'b1 << select);
    assign Dp = 1;
    assign A = (~input_bits[3] & input_bits[2] & ~input_bits[1] & ~input_bits[0]) | (~input_bits[3] & ~input_bits[2] & ~input_bits[1] & input_bits[0]) | (input_bits[3] & input_bits[2] & ~input_bits[1] & input_bits[0]) | (input_bits[3] & ~input_bits[2] & input_bits[1] & input_bits[0]);
    assign B = (~input_bits[3] & input_bits[2] & ~input_bits[1] & input_bits[0]) | (input_bits[3] & input_bits[2] & ~input_bits[0]) | (input_bits[2] & input_bits[1] & ~input_bits[0]) | (input_bits[3] & input_bits[1] & input_bits[0]);
    assign C = (input_bits[3] & input_bits[2] & input_bits[1]) | (input_bits[3] & input_bits[2] & ~input_bits[0]) | (~input_bits[3] & ~input_bits[2] & input_bits[1] & ~input_bits[0]);
    assign D = (input_bits[2] & input_bits[1] & input_bits[0]) | (~input_bits[3] & input_bits[2] & ~input_bits[1] & ~input_bits[0]) | (~input_bits[3] & ~input_bits[2] & ~input_bits[1] & input_bits[0]) | (input_bits[3] & ~input_bits[2] & input_bits[1] & ~input_bits[0]);
    assign E = (~input_bits[3] & input_bits[0]) | (~input_bits[3] & input_bits[2] & ~input_bits[1]) | (~input_bits[2] & ~input_bits[1] & input_bits[0]);
    assign F = (~input_bits[3] & ~input_bits[2] & input_bits[0]) | (~input_bits[3] & input_bits[1] & input_bits[0]) | (~input_bits[3] & ~input_bits[2] & input_bits[1]) | (input_bits[3] & input_bits[2] & ~input_bits[1] & input_bits[0]);
    assign G = (~input_bits[3] & ~input_bits[2] & ~input_bits[1]) | (input_bits[3] & input_bits[2] & ~input_bits[1] & ~input_bits[0]) | (~input_bits[3] & input_bits[2] & input_bits[1] & input_bits[0]);

endmodule