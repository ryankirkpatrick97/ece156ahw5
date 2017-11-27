module coinSensor_tb();
	reg clk, reset, serialIn, write;
	wire penny, nickle, dime, quarter;
	reg [15:0] i;

	coinSensor SENSOR(clk, reset, serialIn, write, penny, nickle, dime, quarter);

	reg [11:0] pennyIn = 12'b10_1111_0000_00;
	reg [11:0] nickleIn = 12'b11_0100_0000_00;
	reg [11:0] dimeIn = 12'b10_1100_0000_00;
	reg [11:0] quarterIn = 12'b11_1011_1100_00;
	//should activate on 4, and 11 [11:0]


	always #5 clk = ~clk;

	initial begin
		clk = 0;
		reset = 1;
		serialIn = 0;
		i = 0;
		write = 1;

		#7.5
		reset = 0;
		
	end

	always @ (posedge clk) begin
		//Handle specific inputs for different coin types
		if      (i >= 0 && i <= 11)
			serialIn = pennyIn[i];
		else if (i >= 12 && i <= 23)
			serialIn = nickleIn[i-12];
		else if (i >= 24 && i <= 35)
			serialIn = dimeIn[i-24];
		else if (i >= 36 && i <= 47)
			serialIn = quarterIn[i-36];
		else
			//Enter random input
			serialIn = {$random} % 2;
			
		//Every twelve, drop write to cause update
		if( ((i + 1) % 12) == 1)
			write = 0;
		if( ((i + 1) % 12) == 2)
			write = 1;
			
		i = i + 1;
	end

endmodule

