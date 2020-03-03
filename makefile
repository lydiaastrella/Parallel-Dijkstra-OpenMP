paralel:
	gcc -g -Wall -o paralel_dijkstra src/paralel_dijkstra.c -fopenmp
	./paralel_dijkstra 6

serial:
	gcc src/serial_dijkstra.c -o serial_dijkstra
	./serial_dijkstra

