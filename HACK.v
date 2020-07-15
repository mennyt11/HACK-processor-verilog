module HACK(
	input reset,clk,
	output[15:0] inst,DataMemOut,outM,addressM,PC,Areg,Dreg,		//these outputs are provided for simulation
	output writeM
);

wire[15:0] IMout,DMout;
wire[15:0] CPUout;
wire[15:0] address_out;
wire[15:0] PCwire;
wire wen_wire;

assign inst=IMout;
assign DataMemOut=DMout;
assign outM=CPUout;
assign addressM=address_out;
assign PC=PCwire;
assign writeM=wen_wire;
CPU hack_cpu(
		.inst(IMout),.inM(DMout),.reset(reset),.clk(clk),.outM(CPUout),
		.addressM(address_out),.pc_out(PCwire),.wen(wen_wire),.Areg(Areg),.Dreg(Dreg)
		);

data_mem hack_DM(
		.clk(clk),.we(wen_wire),.address(address_out),.d(CPUout),.q(DMout)
  		);

inst_mem hack_IM(
		.raddr(PCwire),.clk(clk),.q(IMout)
		);

endmodule

