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
module Modulo_final(
input A,B,C,D,clk,reset_contador,humo,el,reset,
output [10:0] Y
    );
wire T_alta, T_media,T_1,T_2,tricidad,hummo,acti1,acti2,acti3,acti4,clk_s;
Divisor divisor (    
	.clk(clk), 
   .reset(reset), 
  .s_clk(s_clk)
 );

Deco_adc ADC (
    .A(A), 
    .B(B), 
    .C(C), 
    .D(D), 
    .T_alta(T_alta), 
    .T_media(T_media)
    );
	 
MaquinaDeEstados maquina (
    .Clk(s_clk), 
    .Reset(reset), 
    .Humo(humo), 
    .T1(T_alta), 
    .T2(T_media), 
    .CS(el), 
    .TempAlto(T_1), 
    .TempMedio(T_2), 
    .HumoOut(hummo), 
    .Elec(tricidad), 
    .EJECA(acti1), 
    .EJECB(acti2), 
    .EJECC(acti3), 
    .EJECD(acti4)
    );
	 
salida sal (
    .T_alta(T_1), 
    .T_media(T_2), 
    .Humo(hummo), 
    .Elec(tricidad), 
    .acti_t_alta(acti1), 
    .Acti_t_media(acti2), 
    .Acti_humo(acti3), 
    .Acti_elec(acti4), 
    .reset_cont(reset_contador), 
    .clk(s_clk), 
    .Y(Y)
    );







endmodule
