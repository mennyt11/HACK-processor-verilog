/*
	Central Processing unit of the processor
	it decodes the onstruction and also executes them
*/

module CPU(
	input [15:0] inst,inM,
	input reset,clk,
	output[15:0] outM,addressM,
	output [15:0] pc_out,Areg,Dreg,
	output wen);

wire [15:0] w_out;	//alu output
wire [15:0] Dout;	//D register output
wire [15:0] Ain,Aout;	//A register input and output
wire w_zr,w_ng;		//ALU zr and ng wires
wire DLoad,ALoad;	//load input for A and D register
wire[15:0] Yin;		//ALU Y input
wire PCload,PCinc;	//load and increment for PC

assign Ain=inst[15]?w_out:inst;		//Muxed input for A register 
assign DLoad=inst[15] & inst[4];	//load input for D =T & d2
assign ALoad=(~inst[15]) | inst[5];	//load input for A =~T | d1
assign Yin=inst[12]?inM:Aout;		//Muxed input for ALU Y
assign PCload=(inst[15] & ((inst[2]&w_ng)|(inst[1]&w_zr)|(inst[0]&(~w_ng))|(inst[2]&inst[1]&inst[0])));
assign PCinc=~PCload;

assign outM=w_out;			//ALU output
assign wen=inst[15] & inst[3];		//wen output
assign addressM=Aout;			//addressM output
assign Areg=Aout;
assign Dreg=Dout;

register16 A(.d(Ain),.clk(clk),.reset(reset),.load(ALoad),.q(Aout));

register16 D(.d(w_out),.clk(clk),.reset(reset),.load(DLoad),.q(Dout));

ALU alu1(.x(Dout),.y(Yin),.ctl(inst[11:6]),.out(w_out),.zr(w_zr),.ng(w_ng));	

PC16 pc1(.in(Aout),.reset(reset),.load(PCload),.inc(PCinc),.clk(clk),.out(pc_out));

endmodule
