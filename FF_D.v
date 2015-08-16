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
module FFD
#(parameter N = 1)
(
input [N-1:0] D,
input CLK,
output reg [N-1:0] Q

    );
always @(posedge CLK)
Q<=D;
endmodule
