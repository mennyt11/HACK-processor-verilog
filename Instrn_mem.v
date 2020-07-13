/*
 instruction memory reads the hexadecimal machine language code from code.txt 
*/
module inst_mem 
	(input wire[15:0] raddr,
	 input clk,
	 output reg[15:0] q);

reg[15:0] ram[0:2**16-1];


initial begin
	//readmemb for binary file and readmemh for hexadecimal file
	$readmemh("code.txt",ram); 
end
 
always @(posedge clk) begin
	
	q=ram[raddr];
	
end

endmodule
