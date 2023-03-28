module decoder2to4(
    input e,
    input [1:0]a,
    output reg [3:0]y
);
always @(*) begin
    case ({e,a})
    3'b100: y=4'b0001;
    3'b101: y=4'b0010;
    3'b110: y=4'b0100;
    3'b111: y=4'b1000;
        default: y=4'b0000;
    endcase
end
endmodule

`timescale 1ns/1ps

module decoder2to4_tb;
reg [1:0]a;
reg e;
wire [3:0]y;
decoder2to4 uut(
.a(a),
.e(e),
.y(y)
);

initial begin

    e=0; a[1]=0; a[0]=0; #10;
    e=1; a[1]=0; a[0]=0; #10;
    e=1; a[1]=0; a[0]=1; #10;
    e=1; a[1]=1; a[0]=0; #10;
    e=1; a[1]=1; a[0]=1; #10;


end
initial begin
    $monitor (" %b %b%b %b%b%b%b \n",e,a[1],a[0],y[3],y[2],y[1],y[0]);

end
endmodule


