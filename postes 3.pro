

domains 
nama,pekerja,golongan,kategori,bentuk = symbol


predicates

nondeterm apa(nama,bentuk,kategori)
nondeterm jenis(kategori,pekerja)
nondeterm hasil(kategori,golongan)
nondeterm boleh_menikah(symbol)
nondeterm tidak_boleh_menikah(symbol)

clauses

apa (bejo,manusia,orang_dewasa).
apa (afdal,hewan,orang_dewasa).
apa (rina,hewan,anak).
apa (kara,manusia,anak).
apa (dewo,hewan,anak).
apa (bowo,manusia,balita).
apa (dewo,hewan,anak).
apa (bowo,manusia,balita).

jenis (orang_dewasa,bekerja).
jenis (anak,belum).
jenis (balita,belum).

hasil (orang_dewasa,mandiri).
hasil (anak,butuh_orang_tua).
hasil (balita,sangat_butuh_orang_tua).


boleh_menikah(A):-
	apa(A,manusia,X),
	jenis(X,bekerja),
	hasil(X,mandiri).
	
tidak_boleh_menikah(B):-
	apa(B,manusia,X),
	jenis(X,belum),
	hasil(X,butuh_orang_tua).
	

goal

boleh_menikah(Siapa),
tidak_boleh_menikah(Siapaas),

%write digunakan untuk menampilkan atau print
write(Siapa," boleh menikah tapi ",Siapaas," tidak boleh menikah.\n").




