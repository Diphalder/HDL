module ControlUnit (
input [3:0] opcode ,
input ZF,
output reg IMM_sel, 
output reg JMP_sel,
output [1:0] op,
output reg Reg_EN
);


reg [1:0] typ;
assign op=opcode[1:0];

always @ *
begin
    typ=opcode[3:2];
    if(typ==2'b00 || typ==2'b01)
        Reg_EN=1;
    
    if(typ==2'b01)
        IMM_sel=1;

    if(typ==2'b10 && op==2'b00)
        JMP_sel=1;
    
    if(typ==2'b10 && op==2'b01 && ZF==1)
        JMP_sel=1;
          
end
endmodule



module alu_4bit(
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
      
    else if(OP==2'b10)
        R=A>>B;

    if(R==4'b0000)
        ZF=1'b1;
    if(R[3]==1'b1)
        SF=1'b1;
end
endmodule




module regset6_4bit (
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







module RAMset9_18bit (
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




module Program_counter (input [3:0] din , input clock , output reg [3:0] dout);
always @(posedge clock)
begin
        dout<=din;
end
endmodule




module oneplus_of_PC (input [3:0] din , output [3:0] dout);
assign dout=din+1;
endmodule

module flag_reg (input CFin ,input ZFin , input SFin , input clock , output reg CF ,output reg ZF , output reg SF);
always @(posedge clock)
begin
    CF<=CFin;
    ZF<=ZFin;
    SF<=SFin;    
end
endmodule





