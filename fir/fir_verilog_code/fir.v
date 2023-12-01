
module fir_filter (
    data_in, data_out, clk, rst
);
    output[17:0] data_out;
    input[7:0] data_in;
    input clk, rst;

    parameter b0 = 8'b01010101;
    parameter b1 = 8'b01001111;
    parameter b2 = 8'b00000000;
    parameter b3 = 8'b01001111;
    parameter b4 = 8'b11111111;
    parameter b5 = 8'b01001111;
    parameter b6 = 8'b00000000;
    parameter b7 = 8'b01001111;
    parameter b8 = 8'b01010101;


    reg[17:0] ff_data[1:8];

    assign data_out = b0*data_in+b1*ff_data[1]+b2*ff_data[2]+b3*ff_data[3]+b4*ff_data[4]+b5*ff_data[5]+b6*ff_data[6]+b7*ff_data[7]+b8*ff_data[8];

    integer k;
    always @ (posedge clk)
        if (rst==1)
        begin
            for (k=1;k<=8;k=k+1)
            begin
                ff_data[k]<=0;
            end
        end

        else
        begin
          	ff_data[1]<=data_in;
            for (k=2;k<=8;k=k+1)
            begin
                ff_data[k]<=ff_data[k-1];
            end
        end
    
endmodule
