module Relogio(dhourq, uhourq, dminq, uminq, clk,reset);
    /*reg  mainclk, genreset;*/
    output wire [3:0] dhourq; //dezena de horas
    output wire [3:0] uhourq; //unidade de horas
    output wire [3:0] dminq; //dezena de minutos
    output wire [3:0] uminq; //unidade de minutos

    input clk;
    input reset;

    /** Sinais de reset*/
    wire dhour_rst, uhour_rst, dmin_rst, umin_rst;

    /** Sinais de clock*/
    wire dmin_clk, uhour_clk, dhour_clk; //clock dos contadores em cascata.

    /** Sinal de reset geral*/
    wire sysreset, turnday;

    assign dhour_rst  = (sysreset || (dhourq > 4'b0010));
    assign dmin_rst = (sysreset || (dminq > 4'b0101));
    assign uhour_rst = sysreset /*|| ((dhourq > 4'b0001) && (uhourq > 4'b0100)))*/;
    assign umin_rst = sysreset;

    assign dmin_clk = ~(uminq >= 4'b1001);
    assign dhour_clk = ~(uhourq >= 4'b1001);
    assign uhour_clk = ~(dmin_rst ^ sysreset);
    assign turnday = (dhourq >= 4'b0010) && (uhourq >= 4'b0100);
    assign sysreset = turnday || reset;

    ContadorBCD HOUR_DEC(
        .q(dhourq),
        .clk(dhour_clk),
        .reset(dhour_rst)
    );

    ContadorBCD HOUR_UNIT(
        .q(uhourq),
        .clk(uhour_clk),
        .reset(uhour_rst)
    );

    ContadorBCD MIN_DEC(
        .q(dminq),
        .clk(dmin_clk),
        .reset(dmin_rst)
    );

    ContadorBCD MIN_UNIT(
        .q(uminq),
        .clk(clk),
        .reset(umin_rst)
    );


endmodule
