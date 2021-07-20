//State Machine
module state(brake,turn,clk,trans);

	input clk;//clock
	input brake;//brake signal
	input turn;//turn signal
	
	output wire trans;
	
	reg [1:0]out;
	
	always@(posedge clk)
	if(!brake && !turn)//no brake and turn signal
		out <= 2'b00;
	else if(brake && !turn)//only have brake signal
		out <= 2'b01;
	else if(!brake && turn)//only have turn signal
		out <= 2'b10;
	else if(brake && turn)//both brake and turn signal
		out <= 2'b11;
	trans = out;

endmodule
