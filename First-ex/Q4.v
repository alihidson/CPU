module signextend #(
    parameter n = 31
)(
    input [n - 1:0] in, // input Max_n-bits
    output reg [31:0] out // output 32-bits
);

always @(*) begin
    if (in[n - 1] == 1) // If MSB of input is 1
        out = {{32 - n{1'b1}}, in}; // Sign extend by 1
    else
        out = {{32 - n{1'b0}}, in}; // Sign extend by 0
end

endmodule
