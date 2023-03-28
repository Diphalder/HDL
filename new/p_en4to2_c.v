module p_en4to2 (input [3:0] I , output reg [1:0] A );


always @(*)
begin

    case(I)
    4'b0001: A=2'b00;
    4'b001x: A=2'b01;
    4'b01xx: A=2'b10;
    4'b1xxx: A=2'b11;
    default : A=2'b00;



    endcase

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




