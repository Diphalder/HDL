module alu4bit(
input [3:0] A,
input [3:0] B,
input [1:0] OP,
output reg [3:0] R ,
output reg CF ,
output reg ZF ,
output reg SF);

always @ *
begin
    if(OP==2'b00)
        {CF,R}=A+B;
    else if(OP==2'b01)
        R=A&B;
        CF=0;
    else if(OP==2'b10)
        R=A>>B;
        CF=0;
    if(R==4'b0000)
        ZF=1'b1;
    if(R[3]==1'b1)
        SF=1'b1;
end



endmodule


`timescale 1ns/1ns

module alu_tb;
reg [3:0] A;
reg [3:0] B;
reg [1:0] OP;
wire [3:0] R ;
wire CF ;
wire ZF ;
wire SF;

alu4bit dip(A,B,OP,R,CF,ZF,SF);

initial begin
    A=4'b1111; B=4'b0001; OP=2'b00;#20;
    A=4'b1001; B=4'b0011; OP=2'b00;#20;
    A=4'b1011; B=4'b0111; OP=2'b00;#20;

    A=4'b1111; B=4'b0001; OP=2'b01;#20;
    A=4'b1001; B=4'b0011; OP=2'b01;#20;
    A=4'b1011; B=4'b0111; OP=2'b01;#20;

    A=4'b1111; B=4'b0001; OP=2'b10;#20;
    A=4'b1001; B=4'b0011; OP=2'b10;#20;
    A=4'b1011; B=4'b0111; OP=2'b10;#20;

    end

initial begin
    $monitor("A=%b B=%b op=%b    R=%b SF=%b ZF=%b CF=%d \n",A,B,OP,R,SF,ZF,CF);
    end


endmodule