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
module Deco_adc(
    input A,
    input B,
    input C,
    input D,
    output T_alta,
    output T_media
    );
	 
assign T_media=(A&(~B))+(A&(~C))+(B&C&(~D))+((~A)&B&D);
assign T_alta=A&B&C&D;



endmodule
