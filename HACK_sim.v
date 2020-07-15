module HACK_sim();

	reg reset=0,clk=1;
	wire[15:0] inst,DataMemOut,outM,addressM,PC,Areg,Dreg;		//these outputs are provided for simulation
	wire writeM;

HACK DUT(reset,clk,inst,DataMemOut,outM,addressM,PC,Areg,Dreg,writeM);

initial begin
	reset=1;
	#20;
	reset=0;
end

always begin
#10 clk=~clk;
end

endmodule

