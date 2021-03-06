//////////////////////////////////////////////////////////////////////////////
// Company: 		Oregon State University
// Engineer Group:	Group 7
//
// Create Date: 	20 November 2020
// Design Name:		PS/2 Keyboard Piano
// Description:		Counts clock cycles until reset only when enabled
//////////////////////////////////////////////////////////////////////////////
module enabled_counter #(parameter N = 10) //N is the number of bits of the count
						(input logic clk, en, reset_n, output logic [N-1:0] count);

	always_ff@(posedge clk, negedge reset_n)
			if (reset_n == 0) count <= 0; //if the acctive reset is low, reset the count
			else
				if (en == 1) //if the enable is 1, count. Otherwise, remain in an idle state
					count <= count+1;
endmodule

