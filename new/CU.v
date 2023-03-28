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

