//syncornizer
module sync(in, rst, clk, out);
input in, clk, rst;
output out;
reg out;
reg sync_0, sync_1;

always@(posedge clk)
begin
sync_0 <= #1 in;
sync_1 <= #1 sync_0;
out <= #1 sync_1;
end 
endmodule 