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

always @(negedge clk) begin
	
	if(we==1)
		ram[address]=d;
end

assign q=ram[address];

endmodule

