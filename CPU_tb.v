/*
	testbench for CPU just to store a value in memory
*/
module CPU_tb();
	reg [15:0] inst=0,inM=0;
	reg reset=0,clk=0;
	wire[15:0] outM,addressM;
	wire[15:0] pc_out;
	wire wen;

CPU DUT(inst,inM,reset,clk,outM,addressM,pc_out,wen);

always begin
	#10 clk=~clk;
end


initial begin
inM=16'h000a;

reset=1;
#20;
reset=0;

inst=16'h000b;
#20;
inst=16'hec10;
#20;
inst=16'h0010;
#20;
inst=16'he348;
#20;
end

endmodule
