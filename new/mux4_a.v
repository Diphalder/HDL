module mux4(input [3:0] D, input [1:0] S , output  A ) ;

assign A = D[0]&~S[1]&~S[0] | D[1]&~S[1]&S[0] | D[2]&S[1]&~S[0] | D[3]&S[1]&S[0] ;


endmodule 


`timescale 1ps/1ps




module mux4_tb;
reg [3:0] d;
reg [1:0] s;
wire a;

mux4 uut(d,s,a);

initial begin

    d=4'b0111;
    s=2'b00;  #10;
    s=2'b01;  #10;
    s=2'b10;  #10;
    s=2'b11;  #10;
end

initial begin

    $monitor("data=%b  s=%b  output=%b\n",d,s,a);

end

    
endmodule


