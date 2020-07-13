module PC16(
	input [15:0] in,
	input reset,load,inc,clk,
	output reg[15:0] out=0);

always @(negedge clk) begin
	
	if(reset==1)
		out<=0;
	else if(load==1)
		out<=in;
	else if(inc==1)
		out<=out+1;
end
endmodule
