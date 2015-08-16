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
module MUX
#(parameter N=10)
(
input [1:0]seleccion,
input [N:0] Entrada1,
input [N:0] Entrada2,
input [N:0] Entrada3,
input [N:0] Entrada4,
output reg [N:0] Y
    );
localparam A= 2'b00, B= 2'b01, C= 2'b10, D= 2'b11;
	 always@ *
	 case(seleccion)
	 A:
	 Y=Entrada1;
	 B:
	 Y=Entrada2;
	 C:
	 Y=Entrada3;
	 D:
	 Y=Entrada4;
	 endcase


endmodule
