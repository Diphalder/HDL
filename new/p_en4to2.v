module p_en4to2 (input [3:0] I , output reg [1:0] A );


always @(*)
begin

    if(I==4'b0001)
        A=2'b00;
    else if(I[3:1]==3'b001)
        A=2'b01;
    else if(I[3:2]==2'b01)
        A=2'b10;
    else if(I[3]==1'b1)
        A=2'b11;
    else 
        A=2'b00;

end


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




