module counter (
    input clk,
    input reset,
    input enable,
    output reg [3:0] count
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            count <= 4'b0000; // Reset counter to 0
        else if (enable)
            count <= count + 1; // Count up by 1
    end

endmodule
