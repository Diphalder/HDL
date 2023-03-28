module encdr(
    output reg [1:0]s,
    input [3:0]z
);

always @* begin
    if(z==4'b0001)
    s=2'b00;
    else  if(z==4'b0010)
    s=2'b01;
    else  if(z==4'b0100)
    s=2'b10;
    else  if(z==4'b1000)
    s=2'b11;
end

endmodule
`timescale 1ns/1ps

module encdr_tb;
wire [1:0]s;
reg  [3:0]z;

encdr uut (
.s(s),
.z(z)
);

initial begin
    z[3]=0;z[2]=0;z[1]=0;z[0]=1;#10;
    z[3]=0;z[2]=0;z[1]=1;z[0]=0;#10;
    z[3]=0;z[2]=1;z[1]=0;z[0]=0;#10;
    z[3]=1;z[2]=0;z[1]=0;z[0]=0;#10;
  
end
initial begin
    $monitor("%b%b%b%b %b%b\n",z[3],z[2],z[1],z[0],s[1],s[0]);
end
endmodule


