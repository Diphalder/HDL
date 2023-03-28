module en (input [7:0] e , input [1:0] s , output reg [1:0] a);

always @(*) begin
    case(s)
    2'b00: a=e [1:0];
    2'b01: a=e [3:2];
    2'b10: a=e [5:4];
    2'b11: a=e [7:6];
    endcase

end


    
endmodule


`timescale 1ps/1ps

module tb();
reg [7:0] e ;
reg [1:0] s ;
wire [1:0] a;

en dip(e,s,a);

initial
begin
    e=8'b01100111;
    s=2'b00; #20;
    s=2'b01; #20;
    s=2'b10; #20;
    s=2'b11; #20;

end
initial


begin
    $monitor("s=%b  output = %b \n ",s,a);
end




endmodule