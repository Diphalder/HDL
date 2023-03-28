module fn(input X, input A, input D,output L);

assign L= ~D&~X&A|D&~X&~A|D&~X&A;

endmodule

`timescale 1ps/1ps

module ft_tb ();
reg x;
reg a;
reg d;
wire z;

fn uut(x,a,d,z);

initial begin
    d=0;x=0;a=0;#10;
            a=1;#10;
        x=1;a=0;#10;
            a=1;#10;
    d=1;x=0;a=0;#10;
            a=1;#10;
        x=1;a=0;#10;
            a=1;#10;            
end

initial begin

$monitor("%d%d%d -> %d\n",d,x,a,z);
    
end

endmodule
