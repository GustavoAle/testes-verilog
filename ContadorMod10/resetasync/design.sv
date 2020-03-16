module Contador(clk,reset,q);
    input clk;
    input reset;
    output reg [3:0] q;

    initial
        q <= 4'b0000;

    always @(posedge clk, posedge reset) begin
        if(!reset)
            if (q >= 4'b1001)
                q <= 4'b0000;
            else
                q <= q + 1;
        else
            q <= 4'b0000;
    end

endmodule
