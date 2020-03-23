
module shiftreg(sout,clk,datain,shift_load,serial);
    output wire sout;

    input serial;
    input clk;
    input [0:7] datain;
    input shift_load; //0: shift, 1 load

    reg [0:7] internal_register;

    assign sout = internal_register[0];

    always @(posedge clk, posedge shift_load) begin
        if(shift_load)
            internal_register <= datain;
        else
            internal_register <= (internal_register << 1) | serial;

    end

endmodule //8-bit shiftreg
