module freq_divider(
    input logic clk,
    output logic clk_out = 0
);
    
    always_ff @(posedge clk) begin
        clk_out <= ~clk_out;
    end


endmodule