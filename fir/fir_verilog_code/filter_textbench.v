`timescale 1ns/10ps
module filter_testbench;

	reg[7:0] data_in;
	reg clk, rst;
  	wire[17:0] data_out;


    fir_filter filter1(
        .data_in(data_in), 
        .data_out(data_out), 
        .clk(clk), 
        .rst(rst)
    );
    

    initial 
        begin
           clk = 1'b0;
	   forever 
            begin
                #10416 clk = ~clk;
                if (clk == 1)
                  begin
                  	$display(data_out);
                  end
            end  
        end

	initial
	begin
        #0      rst=1;
                data_in=8'b00000000;
        #20832  rst=0;
        #20833  data_in=8'b00000000;
        #20834  data_in=8'b11111010;
        #20833  data_in=8'b11111111;
        #20834  data_in=8'b01010100;
        #20833  data_in=8'b00001010;
        #20834  data_in=8'b01111111;
        #20833  data_in=8'b11101000;
        #20834  data_in=8'b01111010;
        #20833  data_in=8'b01101010;
        #20834  data_in=8'b10101100;
        #20833  data_in=8'b00000000;
        #20834  data_in=8'b10101100;
        #20833  data_in=8'b01101010;
        #20834  data_in=8'b01111010;
        #20833  data_in=8'b11101000;
        #20834  data_in=8'b01111111;
        #20833  data_in=8'b00001010;
        #20834  data_in=8'b01010100;
        #20833  data_in=8'b11111111;
        #20834  data_in=8'b11111010;
        #20833  data_in=8'b00000000;
        #20834  data_in=8'b11111010;
        #20833  data_in=8'b11111111;
        #20834  data_in=8'b01010100;
        #20833  data_in=8'b00001010;
        #20834  data_in=8'b01111111;
        #20833  data_in=8'b11101000;
        #20834  data_in=8'b01111010;
        #20833  data_in=8'b01101010;
        #20834  data_in=8'b10101100;
        #20833  data_in=8'b00000000;
        #20834  data_in=8'b10101100;
        #20833  data_in=8'b01101010;
        #20834  data_in=8'b01111010;
        #20833  data_in=8'b11101000;
        #20834  data_in=8'b01111111;
        #20833  data_in=8'b00001010;
        #20834  data_in=8'b01010100;
        #20833  data_in=8'b11111111;
        #20834  data_in=8'b11111010;
        #20833  data_in=8'b00000000;
        #20834  data_in=8'b11111010;
        #20833  data_in=8'b11111111;
        #20834  data_in=8'b01010100;
        #20833  data_in=8'b00001010;
        #20834  data_in=8'b01111111;
        #20833  data_in=8'b11101000;
        #20834  data_in=8'b01111010;
        #20833  data_in=8'b01101010;
        #20834  data_in=8'b10101100;
        #20833  data_in=8'b00000000;
        #20834  data_in=8'b10101100;
        #20833  data_in=8'b01101010;
        #20834  data_in=8'b01111010;
        #20833  data_in=8'b11101000;
        #20834  data_in=8'b01111111;
        #20833  data_in=8'b00001010;
        #20834  data_in=8'b01010100;
        #20833  data_in=8'b11111111;
        #20834  data_in=8'b11111010;
        #20833  data_in=8'b00000000;
        #20834  data_in=8'b11111010;
        #20833  data_in=8'b11111111;
        #20834  data_in=8'b01010100;
        #20833  data_in=8'b00001010;
        #20834  data_in=8'b01111111;
        #20833  data_in=8'b11101000;
        #20834  data_in=8'b01111010;
        #20833  data_in=8'b01101010;
        #20834  data_in=8'b10101100;
        #20833  data_in=8'b00000000;
        #20834  data_in=8'b10101100;
        #20833  data_in=8'b01101010;
        #20834  data_in=8'b01111010;
        #20833  data_in=8'b11101000;
        #20834  data_in=8'b01111111;
        #20833  data_in=8'b00001010;
        #20834  data_in=8'b01010100;
        #20833  data_in=8'b11111111;
        #20834  data_in=8'b11111010;
        #20833  data_in=8'b00000000;
        #20834  data_in=8'b11111010;
        #20833  data_in=8'b11111111;
        #20834  data_in=8'b01010100;
        #20833  data_in=8'b00001010;
        #20834  data_in=8'b01111111;
        #20833  data_in=8'b11101000;
        #20834  data_in=8'b01111010;
        #20833  data_in=8'b01101010;
        #20834  data_in=8'b10101100;
        #20833  data_in=8'b00000000;
        #20834  data_in=8'b10101100;
        #20833  data_in=8'b01101010;
        #20834  data_in=8'b01111010;
        #20833  data_in=8'b11101000;
        #20834  data_in=8'b01111111;
	    #20832  $stop;
	end

	initial 
	begin
		$dumpfile("filter_dump.vcd");
		$dumpvars;
	end
endmodule