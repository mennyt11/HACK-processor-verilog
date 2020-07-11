/*
16 bit 2 input mux
*/
module mux16_2way(a,b,sel,out);
	input[15:0] a,b;
	input sel;
	output wire[15:0] out;
	
	assign out=sel?b:a;
endmodule
