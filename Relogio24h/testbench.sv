module test;
    reg mainclk, genreset;
    wire [3:0] dech;
    wire [3:0] unih;
    wire [3:0] decm;
    wire [3:0] unim;

    Relogio RELOGIO(
        .clk(mainclk),
        .reset(genreset),
        .dhourq(dech),
        .uhourq(unih),
        .dminq(decm),
        .uminq(unim)
        );

    initial
    begin
        #90000 $finish;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(1,test);

        genreset = 0;
        mainclk = 0;
        reset;

    end

    always
    begin
        #30 mainclk = ~mainclk;
        #30 mainclk = ~mainclk;
    end

    task reset;
        begin
            #1 genreset = ~genreset;
            #1 genreset = ~genreset;
        end
    endtask

endmodule
