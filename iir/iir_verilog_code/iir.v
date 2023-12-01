
module Chevychev_highpass (
    data_in, data_out, clk, rst
);

  output[17:0] data_out;
    input[7:0] data_in;
    input clk, rst;

    parameter b0 = 8'b10000001;
    parameter b1 = 8'b01110110;
    parameter b2 = 8'b10100100;
    parameter b3 = 8'b00101011;
    parameter b4 = 8'b11111111;
    parameter b5 = 8'b00000000;
    parameter b6 = 8'b11010100;
    parameter b7 = 8'b01011011;
    parameter b8 = 8'b10001001;
    parameter b9 = 8'b01111110;

    parameter a1 = 8'b00000000;
    parameter a2 = 8'b11111111;
    parameter a3 = 8'b00010010;
    parameter a4 = 8'b10111110;
    parameter a5 = 8'b01011101;
    parameter a6 = 8'b01110011;
    parameter a7 = 8'b01100100;
    parameter a8 = 8'b01010101;
    parameter a9 = 8'b01010101;


    wire[17:0] data_feedforward;
    wire[17:0] data_feedback;

    reg[17:0] ff_data[1:9];
    reg[17:0] fb_data[1:9];

    assign data_feedforward = b0*data_in+b1*ff_data[1]+b2*ff_data[2]+b3*ff_data[3]+b4*ff_data[4]+b5*ff_data[5]+b6*ff_data[6]+b7*ff_data[7]+b8*ff_data[8]+b9*ff_data[9];
    assign data_feedback = a1*fb_data[1]+a2*fb_data[2]+a3*fb_data[3]+a4*fb_data[4]+a5*fb_data[5]+a6*fb_data[6]+a7*fb_data[7]+a8*fb_data[8]+a9*fb_data[9];

    assign data_out = (data_feedforward - data_feedback);

    integer k;
    always @ (posedge clk)
        if (rst==1)
        begin
            for (k=1;k<=9;k=k+1)
            begin
                ff_data[k]<=0;
                fb_data[k]<=0;
            end
        end

        else
        begin
            ff_data[1]<=data_in;
            fb_data[1]<=data_out;
            for (k=2;k<=9;k=k+1)
            begin
                ff_data[k]<=ff_data[k-1];
                fb_data[k]<=fb_data[k-1];
            end
        end

endmodule