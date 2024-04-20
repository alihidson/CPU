module alu (
    input control,
    input [31:0] a, b,
    output reg [31:0] c,
    output reg zero
);

always @(*) begin
    case(control)
        4'b0000: begin
            c = a & b;
            if (c == 32'b0)
            zero = 1'b1;
            else
            zero = 1'b0;
        end     

        4'b0001: begin 
             c = a | b;
            if (c == 32'b0)
            zero = 1'b1;
            else
            zero = 1'b0;   
        end    

        4'b0010: begin 
            c = a + b;  
            if (c == 32'b0)
            zero = 1'b1;
            
             else
             zero = 1'b0;
             end 

        4'b0011: begin
             c = a ^ b;
             if (c == 32'b0)
             zero = 1'b1;
             else
             zero = 1'b0;
        end  

        4'b0100: begin
             c = a << b[4:0];
             if (c == 32'b0)
             zero = 1'b1;
             else
             zero = 1'b0;
             
        end

        4'b0101: begin
             c = a >> b[4:0];
             if (c == 32'b0)
             zero = 1'b1;
             else
             zero = 1'b0;
             
        end

        4'b0110: begin
             c = a - b;
             if (c == 32'b0)
             zero = 1'b1;
             else
             zero = 1'b0; 
             
        end   

        4'b0111: begin
             c = $signed(a) >>> b[4:0];
             if (c == 32'b0)
             zero = 1'b1;
             else
             zero = 1'b0;
             
        end
        default: begin 
            c = 32'b0;
            zero = 1'b1;
        end
    endcase
    
end

endmodule