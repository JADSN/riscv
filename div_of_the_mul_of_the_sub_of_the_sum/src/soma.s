
# Descricao: 
# - Soma dois numeros

#soma:
#	mv	t0, a0 # Salva o valor do a0
#	mv	t1, a1 # Salva o valor do a1
#	add 	a0, t0, t1
#	ret # Retorna o valor do a0

soma:
	add a0, a0, a1
	ret
