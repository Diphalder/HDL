module decoder2to4
(
input [1:0] A,
input E,
output [3:0] Y
);


assign Y[3] = E & A[1] & A[0];
assign Y[2] = E & A[1] & ~A[0];
assign Y[1] = E & ~A[1] & A[0];
assign Y[0] = E & ~A[1] & ~A[0];
endmodule


`timescale 1ns/1ps
module decoder2to4_tb;
reg [1:0] A;
reg E;
wire [3:0] Y;
decoder2to4 uut
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


