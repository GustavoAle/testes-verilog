module test;

    reg clk;
    reg [7:0] data;
    reg shld = 0;
    wire out;

    shiftreg SH(
        .clk(clk),
        .shift_load(shld),
        .sout(out),
        .datain(data),
        .serial(1'b1)
        );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(1,test);

        clk = 0;
        data <= 8'b11011000;
        #1 shld = 1;
        #1 shld = 0;

        #20 $finish;

    end

    always
    begin
       #1 clk = ~clk;
       #1 clk = ~clk;
    end

endmodule
