
module segment_decoder_7bit_tb();
	reg [3:0] count;
	reg [3:0] i;
	wire a, b, c, d, e, f, g;

	segment_decoder_7bit S7(count, a, b, c, d, e, f, g);

	initial begin
		count = 0;

		for(i = 0; i <15; i = i + 1) begin
			#5
			count = count + 1;
		end//for loop

	end//initial
endmodule
