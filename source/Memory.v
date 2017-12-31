`timescale 1ns/1ps

module Memory(
    input clk,
    input outEn,
    input [31:0] dataIn1,// Qj
    input [31:0] dataIn2,// A 
    input op,// for example, 1 is load, 0 is write
    input [31:0] writeData,
    output reg [31:0] loadData,
    output available,
    output requireCDB,
    input requireAC
);
    reg [31:0] addr;
    reg nRD;
    reg nWR;
    integer States;
    initial begin
        States = 0;
        nRD = 1;
        nWR = 1;
    end 
    wire readStatus;
    wire writeStatus;
    always@( posedge clk ) begin
        if (States == 0 && outEn == 1 ) begin
            addr <= dataIn1 + dataIn2;
            States <= 1;
            if (op == 1) begin
                nRD <= 0;
            end
            if (op == 0) begin
                nWR <= 0;
            end
            // States 从0 变成1，进入访存阶段
        end
        if (States == 1 && readStatus == 0) begin
            States <= 1;
            nRD <= 1;
        end
        if (States == 1 && writeStatus == 0) begin
            States <= 1;
            nWR <= 1;
        end
        if (States == 1 && readStatus == 1) begin
            States <= 2;
            requireCDB <= 1;
        end
        if (States ==1 && writeStatus == 1) begin
            States <= 0;
            requireCDB <= 0;
        end
        if (States == 2 && requireAC == 0) begin
            States <=2;
        end
        if (States == 2 && requireAC == 1) begin
            States <= 0;
        end
    end

    always@(*) begin
        if (States == 1 || States == 2) begin
            available = 0;
        end
        else begin
            available = 1;
        end
    end

    RAM my_ram(
        .clk(clk),
        .address(addr),
        .writeData(writeData),
        .Dataout(loadData),
        .readStatus(readStatus),
        .writeStatus(writeStatus)
    );

endmodule