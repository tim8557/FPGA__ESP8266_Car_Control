module ultra_sonic
(
input clk,
input rst,
output reg trigger,
input dur,
output reg [19:0] cm
);

parameter CNT_MAX = 32'd49_999_999;
reg reg_1;
reg reg_2;
reg [31:0] cnt;
wire falling;
reg [19:0] dur_data;
reg [19:0] dur_cnt;
wire rising;

//cnt
always@(posedge clk or posedge rst)
if (rst)
cnt <= 32'd0;
else if (cnt == CNT_MAX)
cnt <= 32'd0;
else 
cnt <= cnt + 1'b1;


//trigger signal;
always@(posedge clk or posedge rst)
if (rst)
trigger <= 1'b0;
else if (cnt >= 32'd10 && cnt <= 32'd559)
trigger <= 1'b1;
else 
trigger <= 1'b0;

//dur_cnt
always@(posedge clk or posedge rst)
if (rst)
dur_cnt <= 22'd0;
else if (falling == 1'b1)
dur_cnt <= 22'd0;
else if (dur == 1'b1)
dur_cnt <= dur_cnt + 1'b1;


//reg_1
always@(posedge clk or posedge rst)
if (rst)
reg_1 <= 1'b0;
else 
reg_1 <= dur;

//reg_2;
always@(posedge clk or posedge rst)
if (rst)
reg_2 <= 1'b0;
else 
reg_2 <= reg_1;

//falling
assign falling = ((reg_1 == 1'b0) && (reg_2 == 1'b1))?1'b1:1'b0;
assign rising  = ((reg_1 == 1'b1) && (reg_2 == 1'b0))?1'b1:1'b0;

//dur_data
always@(posedge clk or posedge rst)
if (rst)
dur_data <= 20'd0;
else if (falling == 1'b1)
dur_data <= dur_cnt;

//cm
always@(posedge clk or posedge rst)
if (rst)
cm = 20'd0;
else 
cm = dur_data/20'd2610;

endmodule