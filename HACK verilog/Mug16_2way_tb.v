/*
test bench for 16 bit 2 input mux
it is a custom test bench and doesn't provide full coverage
*/

module mux16_2way_tb();

	reg[15:0] a,b;
	reg sel;
	wire[15:0] out;
	
	mux16_2way DUT(a,b,sel,out);
	
	always begin
		sel=1'b1;
		#(10);
		sel=1'b0;
		#(10);
	end
integer i,j;
	initial begin
		for(i=0;i<16;i=i+1) begin
			for(j=15;j>=0;j=j+1) begin
				a<=i;
				b<=j;
				#5;
			end
		end
	end
endmodule
		
