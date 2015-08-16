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
module MUX_Contador(
    input [10:0] T_alta,
    input [10:0] T_media,
    input [10:0] Humo,
    input [10:0] Elec,
    input Reset_cont,
    input clk,
    output [10:0] Y
    );
wire [1:0] select;
// Instantiate the module
contador cont (.clk(clk), .reset(Reset_cont), .salida(select));



// Instantiate the module
MUX MUXI (.seleccion(select), .Entrada1(T_alta), .Entrada2(T_media), .Entrada3(Humo), .Entrada4(Elec), .Y(Y));



endmodule
