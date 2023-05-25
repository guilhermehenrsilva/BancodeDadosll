
#mostrar configutração atual de um campo date
SELECT @@lc_time_names;

#configura na sessão para o formato brasileiro
SET lc_time_names = pt_br;

#configura de forma geral para o formato brasileiro 
SET GLOBAL lc_time_names = pt_br;

#en_su