/*
16 bit adder
*/
module adder16(a,b,cin,cout,sum);
	input[15:0] a,b;
	input cin;
	output cout;
	output[15:0] sum;

	assign{cout,sum}=a+b+cin;
endmodule	
