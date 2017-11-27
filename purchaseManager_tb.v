
module purchaseManager_tb();
	reg clk, reset;
	reg buy;
	reg [1:0] product;
	reg [7:0] credit;
	wire apple, banana, carrot, date, error;

	purchaseManager UUT(clk, reset, buy, product, credit, apple, banana, carrot, date, error);
	
	always #5 clk = ~clk;

	initial begin
		clk = 0;
		reset = 1;
		buy = 0;
		product = 0;
		credit = 165;

		#7.5 //Turn off reset and try to buy an apple
		reset = 0;
		buy = 1;
		
		#10	//Try to buy a banana
		product = 1;
	
		#10 //Try to buy a carrot
		product = 2;

		#10	//Try to buy a date
		product = 3;

		#10 //Try to buy a date when its not possible, so error
		credit = 0;
		




	end

endmodule		
		