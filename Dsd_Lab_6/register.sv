module register(
    input logic clk,reset,we,
    input logic [3:0] d_in,
    output logic [3:0] d_out
);

always_ff @(posedge clk or posedge reset) begin
    if (reset) begin
        d_out <= 4'b0;
    end
    else if (we) begin
        d_out <= d_in;
    end
end

endmodule