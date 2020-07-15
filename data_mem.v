/*
	data memory 64K RAM
*/
module data_mem 
  (  //ports
    input wire clk,
    input wire we,
    input wire [15:0] address, 
    input wire [15:0] d,
    output wire [15:0] q
  );

reg[15:0] ram[0:2**16-1];

initial begin
	//readmemb for binary file and readmemh for hexadecimal file
	$readmemb("InitialRam.txt",ram); 
end
 

always @(negedge clk) begin
	
	if(we==1) begin
		ram[address]=d;
		$display("written ram[%h]=%h",address,d);
	end
end

assign q=ram[address];

endmodule

