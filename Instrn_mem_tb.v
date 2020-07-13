module inst_mem_tb();

reg[15:0] raddr=16'h0000;
reg clk=0;
wire[15:0] q;

inst_mem  DUT(raddr,clk,q);

always begin
#10 clk=~clk;
end

initial begin
	raddr=16'h0000;

	repeat(8) begin
	@(negedge clk)
	raddr=raddr+1;
	end
end
endmodule
