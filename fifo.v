module fifo (
    x,
    clk,
    rst,
    q
);
    input x, clk, rst;
    output [3:0] q;

    wire qb3, qb2, qb1, qb0;

    DFFPOSX1 d1(
        .D(x),
        .CLK(clk),
        .rst(rst),
        .Q(q[3]),
        .qb(qb3)
    );

    DFFPOSX1 d2 (
        .D(q[3]),
        .CLK(clk),
        .rst(rst),
        .Q(q[2]),
        .qb(qb2)
    );

    DFFPOSX1 d3 (
        .D(q[2]),
        .CLK(clk),
        .rst(rst),
        .Q(q[1]),
        .qb(qb1)
    );

    DFFPOSX1 d4 (
        .D(q[1]),
        .CLK(clk),
        .rst(rst),
        .Q(q[0]),
        .qb(qb0)
    );

endmodule
module dff_cell (
    input d,
    input clk,
    input rst,
    output q,
    output qb
);
    wire d_muxed;
    wire q_int;

    // Reset MUX: d_muxed = rst ? 1'b0 : d
    wire rst_n, d_and_rstn;
    INVX1 inv_rst (.A(rst), .Y(rst_n));
    AND2X1 and_d (.A(d), .B(rst_n), .Y(d_and_rstn));
    // D flip-flop input after reset logic
    assign d_muxed = d_and_rstn;

    // Flip-flop: positive edge-triggered
    DFFPOSX1 ff (.D(d_muxed), .CLK(clk), .Q(q_int));

    // Output assignment
    assign q = q_int;
    INVX1 inv_q (.A(q_int), .Y(qb));

endmodule
