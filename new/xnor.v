module xnor_ (input x, input y, output z);

wire _x,_y,p,q;
not(_x,x);
not(_y,y);
and(p,x,y);
and(q,_x,_y);
or(z,p,q);

endmodule

`timescale 1ns/1ps


module xnor_tb();
reg x;
reg y;
wire z;
xnor_ uut(x,y,z);

initial begin
    x=0;y=0;#10;
    x=0;y=1;#10;
    x=1;y=0;#10;
    x=1;y=1;#10;
end

initial begin
    $monitor("x=%d y=%d    -> z=%d\n",x,y,z );
    end

endmodule