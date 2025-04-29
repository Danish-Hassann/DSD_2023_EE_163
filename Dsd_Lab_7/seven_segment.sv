module seven_segment (
    input logic [3:0] input_bits,
    input logic [2:0] select,
    input logic clk,reset,we,
    output logic [6:0] segments,
    output logic [7:0] displays
); 
    
    logic [3:0] nums_array [7:0];
    logic [3:0] num;
    logic [2:0] index;
    logic clk_divisions [16:0];

    assign clk_divisions[0] = clk;

    generate
        genvar i;
        for(i = 0; i < 8; i++) begin
            register reg_unit (
                .clk(clk),
                .reset(reset),
                .we(we & (select == i)),
                .d_in (input_bits),
                .d_out(nums_array[i])
            );
        end
    endgenerate

    genvar j;
    generate
        for (j = 0; j < 16; j++) begin
            freq_divider divider (
                .clk(clk_divisions[j]),
                .clk_out(clk_divisions[j + 1])
            );
        end
    endgenerate

    always_ff @(posedge clk or posedge reset) begin
        if(reset) begin
            index <= 0;
        end
        else if (~we) begin
            index <= index + 1;
        end
    end

    always_comb begin 
        if (we) begin
            num = nums_array[select];
            displays = ~(1 << select); 
        end
        else if (~we) begin
            num = nums_array[index];
            displays = ~(1 << index); 
        end
    end


seven_segment_decoder decoder (
        .num(num),
        .seg(segments)
    );

endmodule