/*
	testbench for ALU using random number generator.
*/
module ALU_tb();

	reg[15:0] x,y;
	reg[5:0] ctl;
	wire[15:0] out;
	wire zr,ng;

	ALU DUT(x,y,ctl,out,zr,ng);

	initial begin
			x<=$random; y<=$random; ctl<=6'h2a;		//0
			#10;
			x<=$random; y<=$random; ctl<=6'h3f;		//1
			#10;
			x<=$random; y<=$random; ctl<=6'h1f;		//x+1
			#10;
			x<=$random; y<=$random; ctl<=6'h37;		//y+1
			#10;
			x<=$random; y<=$random; ctl<=6'h0c;		//x
			#10;
			x<=$random; y<=$random; ctl<=6'h30;		//y
			#10;
			x<=$random; y<=$random; ctl<=6'h1a;		//~x
			#10;
			x<=$random; y<=$random; ctl<=6'h26;		//~y
			#10;
			x<=$random; y<=$random; ctl<=6'h3a;		//-1
			#10;
			x<=$random; y<=$random; ctl<=6'h02;		//x+y
			#10;
			x<=$random; y<=$random; ctl<=6'h0f;		//-x
			#10;
			x<=$random; y<=$random; ctl<=6'h33;		//-y
			#10;
			x<=$random; y<=$random; ctl<=6'h0e;		//x-1
			#10;
			x<=$random; y<=$random; ctl<=6'h32;		//y-1
			#10;
			x<=$random; y<=$random; ctl<=6'h13;		//x-y
			#10;
			x<=$random; y<=$random; ctl<=6'h07;		//y-x
			#10;
			x<=$random; y<=$random; ctl<=6'h00;		//x&y
			#10;
			x<=$random; y<=$random; ctl<=6'h15;		//x|y
			#10;

			
	end
endmodule
