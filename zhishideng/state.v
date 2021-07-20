//State Machine
module state(brake,turn,clk,led1,led2,led3);

	input clk;//clock
	input brake;//brake signal
	input turn;//turn signal
	
	output led1;
	output led2;
	output led3;
	
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
	
case(out)//Different states of lights
	00: led1 = 1'b0;
		led2 = 1'b0;
		led3 = 1'b0;
	
	01: led1 = 1'b1;
		led2 = 1'b1;
		led3 = 1'b1;
		
	10: led1 = 1'b1;
		led2 = 1'b0;
		led3 = 1'b1;
		
	11: led1 = 1'b1;
		led2 = 1'b1;
		led3 = 1'b1;
	default;
endcase

endmodule
