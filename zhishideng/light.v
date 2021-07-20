//light control
module light(brake,turn,clk,led1,led2,led3,temp);

	input brake;//brake signal
	input turn;//turn signal
	input clk;//clock
	
	output led1;
	output led2;
	output led3;
	
	
	wire temp;
	
always@(posedge clk)	
state state_read(
	.brake(brake),
	.turn(turn),
	.clk(clk),
	.out(temp)//read state
	);
	
case(temp)//Different states of lights
2'b00//no signal
	begin
		led1 = 1'b0;
		led2 = 1'b0;
		led3 = 1'b0;
	end
2'b01//only brake
	begin
		led1 = 1'b1;
		led2 = 1'b1;
		led3 = 1'b1;
	end
2'b10//only turn
	begin
		led1 = 1'b1;
		led2 = 1'b0;
		led3 = 1'b1;
	end
2'b11//both brake and turn
	begin
		led1 = 1'b1;
		led2 = 1'b1;
		led3 = 1'b1;
	end
endcase
endmodule
