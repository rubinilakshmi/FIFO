//D FLIPFLOP
module dff(input d,clk,rst,
output reg q,qb);
always @(posedge clk)
begin
if (rst)
begin q=0; qb=1;end
else
begin q=d;qb=~q;end
end
endmodule

//FIFO
module example1(x,clk,rst,q);
input x,clk,rst;
output [3:0]q;
dff d1(x,clk,rst,q[3]);
dff d2(q[3],clk,rst,q[2]);
dff d3(q[2],clk,rst,q[1]);
dff d4(q[1],clk,rst,q[0]);
endmodule
