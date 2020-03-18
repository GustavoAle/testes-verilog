module ContadorBCD(q,clk,reset);
    output reg [3:0] q;
    input clk;
    input reset;

    initial
        q <= 4'b0000;

    always @(posedge clk, posedge reset) begin
        if(!reset)
            if (q >= 4'b1001)
            begin
                q <= 4'b0000;
            end
            else
                q <= q + 1;
        else
            q <= 4'b0000;
    end

endmodule
