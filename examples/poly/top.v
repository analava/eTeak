/*
	Teak synthesiser for the Balsa language
	Copyright (C) 2007-2010 The University of Manchester

	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with this program.  If not, see <http://www.gnu.org/licenses/>.

	Andrew Bardsley <bardsley@cs.man.ac.uk> (and others, see AUTHORS)
	School of Computer Science, The University of Manchester
	Oxford Road, MANCHESTER, M13 9PL, UK
*/


`timescale 1ns/1ps

`define HAS_GO 0
`define HAS_DONE 0
`define HAS_INOUT 1
`define DUT teak_Poly_eval

`ifdef RESET_PERIOD
`else
`define RESET_PERIOD 20
`endif

`ifdef HS_PERIOD
`else
`define HS_PERIOD 0.05
`endif

module top;
	reg reset;
	integer               data_file    ; // file handler
	integer               out_file    ; // file handler

	initial begin
		out_file = $fopen("out.dat", "w");
		if (out_file == 0) begin
			$display("out_file handle was NULL");
			$finish;
		end
	end


`ifdef HAS_GO
	reg go_r;
	wire go_a;

	initial begin
		go_r = 0;
		@(negedge reset);
		#`HS_PERIOD;
		$display ("go");
		go_r = 1;
		@(posedge go_a);
		#`HS_PERIOD;
		go_r = 0;
		@(negedge go_a);
		#`HS_PERIOD;
	end
`endif
`ifdef HAS_DONE
     
     wire done_r;
     reg done_a;
	always begin

		done_a = 0;
		@(posedge done_r);
		#`HS_PERIOD;
		$display ("done");
		done_a = 1;
		@(negedge done_r);
		#`HS_PERIOD;
		done_a = 0;
	end
`endif
//-----------------------------------------------





//-----------------------------------------------
`ifdef HAS_INOUT


  reg [31:0] x_r0;
  reg [31:0] x_r1;
  wire x_a;
  reg [31:0] coefs_0_r0;
  reg [31:0] coefs_0_r1;
  wire coefs_0_a;
  reg [31:0] coefs_1_r0;
  reg [31:0] coefs_1_r1;
  wire coefs_1_a;
  reg [31:0] coefs_2_r0;
  reg [31:0] coefs_2_r1;
  wire coefs_2_0a;
  wire [31:0] a_r0;
  wire [31:0] a_r1;
  reg a_a;
  wire a_r;

  assign a_r= &(a_r0 | a_r1);

	always begin
	
		x_r0 = 32'b0;
		x_r1 = 32'b0;
 	
		@(negedge reset);
		#`HS_PERIOD;
		$display ("IN_x");

		x_r0 = 32'b11111111_11111111_11111111_11111101;
		x_r1 = 32'b00000000_00000000_00000000_00000010;


		@(posedge x_a);
		#`HS_PERIOD;

		x_r0 = 32'b0;
		x_r1 = 32'b0;

		while (1) begin

			@(negedge x_a);
			#`HS_PERIOD;
 	
			$display ("IN_x");

			x_r0 = 32'b11111111_11111111_11111111_11111101;			
			x_r1 = 32'b00000000_00000000_00000000_00000010;
			

			@(posedge x_a);
			#`HS_PERIOD;

			x_r0 = 32'b0;
			x_r1 = 32'b0;
		end		
	end

      always begin
	
		coefs_0_r0 = 32'b0;
		coefs_0_r1 = 32'b0;
 	
		@(negedge reset);
		#`HS_PERIOD;
		$display ("IN_coefs_0");

		coefs_0_r0 = 32'b11111111_11111111_11111111_11111101;
		coefs_0_r1 = 32'b00000000_00000000_00000000_00000010;


		@(posedge coefs_0_a);
		#`HS_PERIOD;

		coefs_0_r0 = 32'b0;
		coefs_0_r1 = 32'b0;

		while (1) begin

			@(negedge coefs_0_a);
			#`HS_PERIOD;
 	
			$display ("IN_coefs_0");

			coefs_0_r0 = 32'b11111111_11111111_11111111_11111101;			
			coefs_0_r1 = 32'b00000000_00000000_00000000_00000010;
			

			@(posedge coefs_0_a);
			#`HS_PERIOD;

			coefs_0_r0 = 32'b0;
			coefs_0_r1 = 32'b0;
		end		
	end


      always begin
	
		coefs_1_r0 = 32'b0;
		coefs_1_r1 = 32'b0;
 	
		@(negedge reset);
		#`HS_PERIOD;
		$display ("IN_coefs_1");

		coefs_1_r0 = 32'b11111111_11111111_11111111_11111100;
		coefs_1_r1 = 32'b00000000_00000000_00000000_00000011;


		@(posedge coefs_1_a);
		#`HS_PERIOD;

		coefs_1_r0 = 32'b0;
		coefs_1_r1 = 32'b0;

		while (1) begin

			@(negedge coefs_1_a);
			#`HS_PERIOD;
 	
			$display ("IN_coefs_1");

			coefs_1_r0 = 32'b11111111_11111111_11111111_11111100;			
			coefs_1_r1 = 32'b00000000_00000000_00000000_00000011;
			

			@(posedge coefs_1_a);
			#`HS_PERIOD;

			coefs_1_r0 = 32'b0;
			coefs_1_r1 = 32'b0;
		end		
	end


      always begin
	
		coefs_2_r0 = 32'b0;
		coefs_2_r1 = 32'b0;
 	
		@(negedge reset);
		#`HS_PERIOD;
		$display ("IN_coefs_2");

		coefs_2_r0 = 32'b11111111_11111111_11111111_11111101;
		coefs_2_r1 = 32'b00000000_00000000_00000000_00000010;


		@(posedge coefs_2_a);
		#`HS_PERIOD;

		coefs_2_r0 = 32'b0;
		coefs_2_r1 = 32'b0;

		while (1) begin

			@(negedge coefs_2_a);
			#`HS_PERIOD;
 	
			$display ("IN_coefs_2");

			coefs_2_r0 = 32'b11111111_11111111_11111111_11111101;			
			coefs_2_r1 = 32'b00000000_00000000_00000000_00000010;
			

			@(posedge coefs_2_a);
			#`HS_PERIOD;

			coefs_2_r0 = 32'b0;
			coefs_2_r1 = 32'b0;
		end		
	end
	


	always begin
		a_a = 0;
		@(posedge a_r);
		#`HS_PERIOD;
		$display ("OUT_res");
		$fwrite(out_file,"out: %h\n",a_r1, );
		a_a = 1;
		@(negedge a_r);
		#`HS_PERIOD;
		a_a = 0;
	end
`endif

//----------------------------------------------------------------------------------------------------
	initial begin
		reset = 1;
`ifdef DUMPFILE
		$dumpfile (`DUMPFILE);
		$dumpvars (0, top);
`endif
		$display ("reset");
		#`RESET_PERIOD;
		reset = 0;
	end

//----

	`DUT DUT (

          	`ifdef HAS_INOUT
 		//.go_0r(go_r), .go_0a(go_a),
		//.done_0r(done_r), .done_0a(done_a),
 	  	.x_0r0(x_r0), .x_0r1(x_r1), .x_0a(x_a),
	  	.coefs_0_0r0(coefs_0_r0), .coefs_0_0r1(coefs_0_r1), .coefs_0_0a(coefs_0_a),
		.coefs_1_0r0(coefs_1_r0), .coefs_1_0r1(coefs_1_r1), .coefs_1_0a(coefs_1_a),
		.coefs_2_0r0(coefs_2_r0), .coefs_2_0r1(coefs_2_r1), .coefs_2_0a(coefs_2_a),
         	.a_0r0(a_r0), .a_0r1(a_r1), .a_0a(a_a),
          	`endif
          	.reset(reset)
         );

//----

	/* `DUT DUT (
		`ifdef HAS_GO
		.go_0r(go_r), .go_0a(go_a),
		`endif
		`ifdef HAS_DONE
		.done_0r(done_r), .done_0a(done_a),
		`endif 
		.reset(reset)
	); */

endmodule
