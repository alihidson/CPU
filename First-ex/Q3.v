module mem (
    input clk,
    input write,
    input read,
    input [9:0] addr,
    input [31:0] wrdata,
    output reg [31:0] rddata
);

reg [7:0] mem [0:1023];

always @(posedge clk) begin
    if (write && !read) begin
        mem[addr] <= wrdata[7:0];           
        mem[addr+1] <= wrdata[15:8];
        mem[addr+2] <= wrdata[23:16];
        mem[addr+3] <= wrdata[31:24];
        rddata <= 32'b0;
    end
end

always @(*) begin
    if (read && !write) begin
        rddata[7:0] <= mem[addr];
        rddata[15:8] <= mem[addr+1];
        rddata[23:16] <= mem[addr+2];
        rddata[31:24] <= mem[addr+3];
    end
    else if((read && write) || (!read && !write)) begin
        rddata <= 32'b0;
    end
end

endmodule