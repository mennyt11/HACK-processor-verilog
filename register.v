/*
	16bit register
*/module register16(
		input[15:0] d,
		input clk,reset,load,
		output reg[15:0] q=0);

always @(negedge clk) begin
	if (reset==1)
		q<=0;
	else if(load==1)
		q<=d;
end
endmodule
