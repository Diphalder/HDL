module RAMset6of18bit (
input [3:0] RS1 ,
input [3:0] RS2,
input [17:0] WD,
input [3:0] WA,
input clock ,
input wrEN ,
output reg [17:0] RD1, 
output reg [17:0] RD2);

reg [17:0] ram0, ram1, ram2, ram3, ram4, ram5,ram6, ram7, ram8;

always @(posedge clock)
begin
    if(wrEN ==1 && WA ==4'b0000)
        ram0<=WD;
    else if(wrEN ==1 && WA ==4'b0001)
        ram1<=WD;  
    else if(wrEN ==1 && WA ==4'b0010)
        ram2<=WD; 
    else if(wrEN ==1 && WA ==4'b0011)
        ram3<=WD; 
    else if(wrEN ==1 && WA ==4'b0100)
        ram4<=WD;  
    else if(wrEN ==1 && WA ==4'b0101)
        ram5<=WD; 
    else if(wrEN ==1 && WA ==4'b0110)
        ram6<=WD;
    else if(wrEN ==1 && WA ==4'b0111)
        ram7<=WD;  
    else if(wrEN ==1 && WA ==4'b1000)
        ram8<=WD; 
            
end

always @ *
begin
    if(RS1==4'b0000)
        RD1=ram0;
    else if(RS1==4'b0001)
        RD1=ram1;
    else if(RS1==4'b0010)
        RD1=ram2;
    else if(RS1==4'b0011)
        RD1=ram3;
    else if(RS1==4'b0100)
        RD1=ram4;        
    else if(RS1==4'b0101)
        RD1=ram5;
    else if(RS1==4'b0110)
        RD1=ram6;
    else if(RS1==4'b0111)
        RD1=ram7;
    else if(RS1==4'b1000)
        RD1=ram8;

    if(RS2==4'b0000)
        RD2=ram0;
    else if(RS2==4'b0001)
        RD2=ram1;
    else if(RS2==4'b0010)
        RD2=ram2;
    else if(RS2==4'b0011)
        RD2=ram3;
    else if(RS2==4'b0100)
        RD2=ram4;        
    else if(RS2==4'b0101)
        RD2=ram5;
    else if(RS2==4'b0110)
        RD2=ram6;
    else if(RS2==4'b0111)
        RD2=ram7;
    else if(RS2==4'b1000)
        RD2=ram8;

end


endmodule


`timescale  1ns/1ps

module regset6_tb;
reg [3:0] RS1 ;
reg [3:0] RS2;
reg [17:0] WD;
reg [3:0] WA;
reg clk ;
reg wrEN ;
wire [17:0] RD1; 
wire [17:0] RD2;

regset6 dip (RS1 ,RS2,WD,WA,clk ,wrEN ,RD1,RD2);

always begin
    clk=~clk;
    #10;
end

initial begin

    clk<=0;
    wrEN=0;WA=4'b0001;WD=18'b101010101010101010 ; RS1=4'b0010 ; RS2=4'b0001;#20;
    wrEN=1;WA=4'b0001;WD=18'b011000000000101010 ; RS1=4'b0010 ; RS2=4'b0001;#20;
    wrEN=1;WA=4'b0010;WD=18'b000000000000000110 ; RS1=4'b0010 ; RS2=4'b0001;#20;
    $finish;
    
end

initial begin
    $monitor("clk=%b en=%b WA=%b WD=%b | RS1=%b RD1=%b  |RS2=%b RD2=%b \n",clk,wrEN, WA , WD , RS1 , RD1 , RS2 ,RD2);
end

endmodule
