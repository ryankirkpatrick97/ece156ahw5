
module sevenSegDispMngr_tb();
	reg clk, reset;
	reg apple, banana, carrot, date, error;
	reg [7:0] credit;
	wire [6:0] digit1, digit0;

	sevenSegDispMngr UUT(clk, reset, apple, banana, carrot, date, error, credit, digit1, digit0);


	always #5 clk = ~ clk;

	initial begin
		clk = 0;
		reset = 1;

		apple = 0;
		banana = 0;
		carrot = 0;
		date = 0;
		error = 0;

		credit = 8'h34;

		#7.5
		reset = 0;
		apple = 1;
		
		#10
		apple = 0;

		#20
		banana = 1;
		
		#10
		banana = 0;
	end

endmodule
