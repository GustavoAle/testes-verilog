module test;

    reg  clk, r;
    wire [3:0] q;

    // Instantiate device under test
    Contador CONTADOR(.clk(clk),
          .reset(r),
          .q(q));

    initial begin
        // Dump waves
        $dumpfile("dump.vcd");
        $dumpvars(1,test);

        clk = 0;
        r = 0;

        #130 r = 1;

    end

    always
    begin
       #5 clk = ~clk;
       #5 clk = ~clk;
    end

    initial
        #200 $finish;

endmodule
