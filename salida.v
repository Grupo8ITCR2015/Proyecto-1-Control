`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Instituto Tecnologico de Costa Rica
// Laboratorio de diseño de sistemas digital
// Profesor: Alfonso Chacon
//
// Estudiantes:
// Edgar Solera Bolaños
// Diego Salazar Sibaja 
//
// Control de máquina contra incendios
//////////////////////////////////////////////////////////////////////////////////
module salida(
    input T_alta,
    input T_media,
    input Humo,
    input Elec,
    input acti_t_alta,
    input Acti_t_media,
    input Acti_humo,
    input Acti_elec,
	 input reset_cont,
	 input clk,
    output [10:0] Y
    );
wire Q1, Q2, Q3, Q4;
wire [10:0] S1,S2,S3,S4;
FFD Humoo (
    .D(Humo), 
    .CLK(Acti_humo), 
    .Q(Q1)
    );
	 
FFD Elecc (
    .D(Elec), 
    .CLK(Acti_elec), 
    .Q(Q2)
    );

FFD T_altaa (
    .D(T_alta), 
    .CLK(acti_t_alta), 
    .Q(Q3)
    );


FFD T_bajaa (
    .D(T_media), 
    .CLK(Acti_t_media), 
    .Q(Q4)
    );

Memoria H (
    .adress(Q1), 
    .salida(S1)
    );

mem_elec Eleccc (
    .adress(Q2), 
    .salida(S2)
    );

memoriaT_A T_A (
    .adress(Q3), 
    .salida(S3)
    );
mem_T_baja T_M (
    .adress(Q4), 
    .salida(S4)
    );

MUX_Contador mux (
    .T_alta(S3), 
    .T_media(S4), 
    .Humo(S1), 
    .Elec(S2), 
    .Reset_cont(reset_cont), 
    .clk(clk), 
    .Y(Y)
    );

endmodule
