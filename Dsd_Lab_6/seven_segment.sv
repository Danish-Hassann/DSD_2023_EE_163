module seven_segment (
    input logic [3:0] input_bits,
    input logic [2:0] select,
    input logic clk,reset,we,
    output logic [6:0] segments,
    output logic [7:0] displays
); 
    
    logic [3:0] nums_stored [7:0];
    logic [3:0] num;

    generate;
        
        genvar i;
        for(i = 0; i < 8; i++) begin
            register reg_unit (
                .clk(clk),
                .reset(reset),
                .we(we & (select == i)),
                .d_in (input_bits),
                .d_out(nums_stored[i])
            );
        end

    endgenerate

    always_comb begin
        if(!we) begin
            displays = ~(8'b00000001 << select);
            num = nums_stored[select];
        end

        else
            displays = 8'b11111111;
    end


seven_segment_decoder decoder (
        .num(num),
        .seg(segments)
    );

endmodule