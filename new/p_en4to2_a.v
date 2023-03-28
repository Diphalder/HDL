module p_en4to2 (input [3:0] I , output  [1:0] A );

assign A[1]=~I[3]&I[2] | I[3];
assign A[0]=~I[3]&~I[2]&I[1] | I[3];


endmodule

`timescale 1ps/1ps

module p_en4to2_tb;
reg [3:0] I ;
wire [1:0] A;

p_en4to2 hi(I,A);

initial  begin
    I=4'b0000;#10;
    I=4'b0001;#10;
    I=4'b0010;#10;
    I=4'b0011;#10;
    I=4'b0100;#10;
    I=4'b0101;#10;
    I=4'b0110;#10;
    I=4'b0111;#10;
    I=4'b1000;#10;
    I=4'b1001;#10;
    I=4'b1010;#10;
    I=4'b1011;#10;
    I=4'b1100;#10;
    I=4'b1101;#10;
    I=4'b1110;#10;
    I=4'b1111;#10;
end



initial  begin

    $monitor("%b -> %b\n",I,A);
end




endmodule




