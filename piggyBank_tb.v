
module piggyBank_tb();
	reg clk, reset;
	reg penny, nickel, dime, quarter;
	reg apple, banana, carrot, date;
	wire [7:0] credit; 

	piggyBank UUT(clk, reset, penny, nickel, dime, quarter, apple, banana, carrot, date, credit);

	always #5 clk = ~clk;

	initial begin
		clk = 0;
		reset = 1;

		{penny, nickel, dime, quarter} = 0;
		{apple, banana, carrot, date}  = 0;

		#7.5
		reset = 0;
		penny = 1;

		#10
		penny =0;
		nickel=1;

		#10
		nickel = 0;
		dime = 1;

		#10
		dime = 0;
		quarter = 1;

		#100
		quarter = 0;
		apple =1;
		
		#10
		apple = 0;
		banana =1;

		#10
		banana =0;
		carrot =1;

		#10
		carrot =0;
		date = 1;

		#10
		date = 0;
	end


endmodule
