module regfile (
    input clk, write,
    input [4:0] rdaddr1,
    input [4:0] rdaddr2,
    input [4:0] wraddr,
    input [31:0] wrdata,
    output reg [31:0] rddata1,
    output reg [31:0] rddata2
);

reg [31:0] regfile [31:0]; // 32 32-bit registers

always @(posedge clk) begin
    if (write) // if write == 1
        regfile[wraddr] <= wrdata; // transition wrdata to wraddr
end

always @* begin
    rddata1 = regfile[rdaddr1]; // transition rdaddr1 to rddata1
    rddata2 = regfile[rdaddr2]; // transition rdaddr2 to rddata2
end

endmodule
