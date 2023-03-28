module regset6 (
input [2:0] RA ,
input [2:0] RB,
input [3:0] WRD,
input [2:0] WR,
input clock ,
input Reg_EN ,
output reg [3:0] A, 
output reg [3:0] B);

reg [3:0] reg0, reg1, reg2, reg3, reg4, reg5;

always @(posedge clock)
begin
    if(Reg_EN==1 && WR ==3'b000)
        reg0<=WRD;
    else if(Reg_EN==1 && WR ==3'b001)
        reg1<=WRD;
    else if(Reg_EN==1 && WR ==3'b010)
        reg2<=WRD;
    else if(Reg_EN==1 && WR ==3'b011)
        reg3<=WRD;    
    else if(Reg_EN==1 && WR ==3'b100)
        reg4<=WRD;  
    else if(Reg_EN==1 && WR ==3'b101)
        reg5<=WRD;  

end

always @ *
begin
    if(RA==3'b000)
        A=reg0;
    else if(RA==3'b001)
        A=reg1;
    else if(RA==3'b010)
        A=reg2;        
    else if(RA==3'b011)
        A=reg3;
    else if(RA==3'b100)
        A=reg4; 
    else if(RA==3'b101)
        A=reg5;

    if(RB==3'b000)
        A=reg0;
    else if(RB==3'b001)
        B=reg1;
    else if(RB==3'b010)
        B=reg2;        
    else if(RB==3'b011)
        B=reg3;
    else if(RB==3'b100)
        B=reg4; 
    else if(RB==3'b101)
        B=reg5;
end


endmodule


`timescale  1ns/1ps

module regset6_tb;
reg [2:0] RA ;
reg [2:0] RB;
reg [3:0] WRD;
reg [2:0] WR;
reg clk ;
reg Reg_EN ;
wire [3:0] A;
wire [3:0] B;

regset6 dip (RA ,RB,WRD, WR, clk ,Reg_EN ,A, B);

always begin
    clk=~clk;
    #10;
end

initial begin

    clk<=0;
    Reg_EN=0;WR=3'b001;WRD=4'b0101 ; RA=3'b010 ; RB=3'b001;#20;
    Reg_EN=1;WR=3'b001;WRD=4'b0101 ; RA=3'b010 ; RB=3'b001;#20;
    Reg_EN=1;WR=3'b010;WRD=4'b1101 ; RA=3'b010 ; RB=3'b001;#20;
    $finish;
    
end

initial begin
    $monitor("clk=%b en=%b WR=%b WRD=%b | RA=%b A=%b  |RB=%b B=%b \n",clk,Reg_EN, WR , WRD , RA , A , RB ,B);
end

endmodule
