/*
structural implementation if ALU
*/
module ALU(x,y,ctl,out,zr,ng);
	input[15:0] x,y;
	input[5:0] ctl;
	output[15:0] out;
	output zr,ng;

	wire[15:0] n0,n1,n2,n3,n4,n5,n6,n7,n8,n9,n10;
	//wire[15:0] zero=16'b0000;
	wire cin=1'b0;
	wire cout;
	
	assign n0=ctl[5]?0:x;	
	assign n1=~n0;

	assign n2=ctl[3]?0:y;	//mux16_2way mux2(y,zero,ctl[4],n2);
	assign n3=~n2;

	assign n4=ctl[4]?n1:n0;		//mux16_2way mux3(n0,n1,ctl[3],n4);
	assign n5=ctl[2]?n3:n2;		//mux16_2way mux4(n2,n3,ctl[2],n5);
	assign n6= n4 & n5;
	adder16 adder_1(n4,n5,cin,cout,n7);
	assign n8=ctl[1]?n7:n6;		//mux16_2way mux5(n6,n7,ctl[1],n8);
	assign n9=~n8;
	assign n10=ctl[0]?n9:n8;		//mux16_2way mux6(n8,n9,ctl[0],n10);

	assign ng=n10[15];
	assign zr=~(|(n10));
	assign out=n10;
	
endmodule
	