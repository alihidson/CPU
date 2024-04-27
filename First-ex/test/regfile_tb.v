module regfile_tb;

  // Parameters
  parameter CLK_PERIOD = 10; // Clock period in time units

  // Signals
  reg clk;
  reg write;
  reg [4:0] rdaddr1, rdaddr2, wraddr;
  reg [31:0] wrdata;
  wire [31:0] rddata1, rddata2;

  // Instantiate the regfile module
  regfile dut (
    .clk(clk),
    .write(write),
    .rdaddr1(rdaddr1),
    .rdaddr2(rdaddr2),
    .wraddr(wraddr),
    .wrdata(wrdata),
    .rddata1(rddata1),
    .rddata2(rddata2)
  );

  // Clock generation
  always #((CLK_PERIOD)/2) clk = ~clk;

  // Test stimulus
  initial begin
    clk = 0;
    write = 1'b0;
    rdaddr1 = 5'b00000;
    rdaddr2 = 5'b00001;
    wraddr = 5'b00010;
    wrdata = 32'b10101010101010101010101010101010;

    // Test write operation
    #10 write = 1'b1;
    #10 write = 1'b0;

    // Test read operation
    #10 rdaddr1 = 5'b00010; // Set the read address to the address that was written to
    #10 rdaddr2 = 5'b00010; // Set another read address to the same address
    #10;

    // Display results
    $display("wrdata = %h", wrdata);
    $display("rddata1 = %h", rddata1);
    $display("rddata2 = %h", rddata2);
    $finish;
  end

endmodule
