module decoder
(
input [1:0] A,
output reg [3:0] Y,
input E

);

always @(*) begin
    if(E == 1'b0)
    Y = 4'b0000;
    else if (A == 2'b00)
    Y = 4'b0001;
    else if (A == 2'b01)
    Y = 4'b0010;
    else if (A == 2'b10)
    Y = 4'b0100;
    else
    Y = 4'b1000;
end    
endmodule



`timescale 1ns/1ps

module decoder2to4_tb;
reg [1:0] A;
reg E;
wire [3:0] Y;
decoder uut
(
    .A(A),
    .E(E),
    .Y(Y)
);

initial begin
    A[1] = 0;
    A[0] = 0;
    E = 0;
    #20;
    E = 1;
    #20;
    A[0] = 1;
    #20;
    A[1] = 1;
    #20;
    A[0] = 0;
    #20;
end
initial begin
    $monitor("E=%d A=%d%d Y=%d%d%d%d\n",E, A[1], A[0], Y[3], Y[2], Y[1],Y[0]);
end
endmodule