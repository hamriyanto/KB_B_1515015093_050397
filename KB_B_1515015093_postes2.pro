predicates 

nondeterm hasil(symbol, symbol, symbol, symbol, symbol)
nondeterm taman(symbol, symbol, symbol, symbol, symbol)
nondeterm kos(symbol, symbol, symbol, symbol, symbol)
nondeterm kampus(symbol, symbol, symbol, symbol, symbol)
nondeterm cara(symbol, symbol, symbol)

clauses 
hasil(Waktu, Hubungan, Area, Oranga, Orangb):-
taman(Waktu, Hubungan, Area, Oranga, Orangb); 
kos(Waktu, Hubungan, Area, Oranga, Orangb); 
kampus(Waktu, Hubungan, Area, Oranga, Orangb). 

cara(racun, sianida, cinta_segitiga).
cara(menusuk, pisau, cinta_segitiga).
cara(mutilasi, pisau, selingkuh).%di bagian ini menjelaskan tentang bebrbagai cara membunuh

%di bagian ini menjelaskan jadwal hari kejadian pembunuhan antar korban dan pelaku dan siapa yang di temuinya
taman(pagi, teman, danau, fajar, aldi).
taman(pagi, teman, daerahjoging, aldi, karma).
taman(sore, pacar, danau, ayu, aldi).
kos(malam, teman, kamar, aldi, ram).
kos(sore, teman, kamar, karma, ayu).
kos(siang, teman, kamar, rin, ayu).
kampus(pagi, pacar, kelasa, aldi, rin).
kampus(pagi, teman, kelasb, rin, ram).
kampus(siang, keluarga, kelasc, ram, rin).


goal
%di goal menunjukkan siapa korban dan pelaku hubungan, waktu dan area yang spesifik dan alat membunuh
hasil(Waktu, Hubungan, Area, Tersangka, Korban),
Korban=ayu,
Waktu=siang,
Area=kamar,
cara(Caramembunuh, Alat, Penyebab),
Alat=sianida.




