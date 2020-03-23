module test;

    reg  clk, r;
    wire [3:0] q;

    Contador CONTADOR(.clk(clk),
          .reset(r),
          .q(q));

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(1,test);

        clk = 0;
        r = 0;

        #130 reset;

    end

    always
    begin
       #5 clk = ~clk;
       #5 clk = ~clk;
    end

    task reset;
        begin
            #1 r = ~r;
            #1 r = ~r;
        end
    endtask

    initial
        #200 $finish;

endmodule
