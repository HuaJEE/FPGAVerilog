//state tb
`timescale 1ns/1ns
`define clk_period 10

module state_tb;

	reg clk_tb;
	reg brake_tb;
	reg turn_tb;
	
	wire [1:0]out_tb;
	
state test(
	.brake(brake_tb),
	.turn(turn_tb),
	.clk(clk_tb),
	.out(out_tb)
	);
	
	initial clk_tb = 1;
	always #(`clk_period/2) clk_tb = ~clk_tb;
	
	initial begin
		brake_tb = 0;
		turn_tb = 0;
		#(`clk_period*50);
		brake_tb = 1;
		turn_tb = 0;
		#(`clk_period*50);
		brake_tb = 0;
		turn_tb = 1;
		#(`clk_period*50);
		brake_tb = 1;
		turn_tb = 1;
		#(`clk_period*50);
		brake_tb = 0;
		turn_tb = 0;
		#(`clk_period*50);
		brake_tb = 1;
		turn_tb = 1;
	end
endmodule
