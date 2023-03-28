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





module CPU_4bit (input [3:0] RAM_WA , input [17:0] RAM_WD , input RAM_EN ,input PC_EN , input clk );
reg cpu_clk;
wire [3:0] RS1 ,RS2 ;
wire  [17:0] RD1 ,RD2 ;

always @ *
begin
    cpu_clk= PC_EN && clk;
    
end

RAMset9_18bit dip (RS1 ,RS2, RAM_WD,RAM_WA ,clk ,RAM_EN ,RD1, RD2);


wire [3:0] opcode ;
wire [2:0] reg_AAdrress;
wire [2:0] reg_BAdrress;
wire [3:0] reg_Bdata;
wire [3:0] JMP_address;


assign opcode=RD1[17:14];
assign reg_AAdrress=RD1[13:11];
assign reg_BAdrress=RD1[10:8];
assign reg_Bdata=RD1[10:7];
assign JMP_address=RD1[13:10];

wire ZFin,CFin,SFin;
wire [1:0] op ;
wire IMM_sel ;
wire JMP_sel ;
wire Reg_EN ;

ControlUnit dip2 (opcode ,ZFin, IMM_sel , JMP_sel , op , Reg_EN);


wire [3:0] R;
wire [3:0] A;
wire [3:0] B;


regset6 dip3 (reg_AAdrress , reg_BAdrress, R, reg_AAdrress, cpu_clk , Reg_EN , A, B);

reg [3:0] newB;

always @ *
begin
    if(IMM_sel==1)
        newB=reg_Bdata;
    else
        newB=B;
end

alu_4bit dip4(A,newB,op, R , CFin ,ZFin , SFin);

wire ZF,CF,SF;

flag_reg dip5(CFin ,ZFin , SFin ,cpu_clk ,CF ,ZF ,SF);

wire [3:0] oneplus_out;

oneplus_of_PC dip6(RS1 , oneplus_out);

reg [3:0] pc_in;

always @ *
begin
    if(JMP_sel==1)
        pc_in=JMP_address;
    else
        pc_in=oneplus_out;
end

Program_counter dip7(pc_in , clk , RS1);


endmodule



