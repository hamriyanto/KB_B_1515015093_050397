
domains 

nilai = integer %menujukan tipe datanya nilai adalah integer


predicates %predicates untuk penyusunan urutannya atau penyusunanya apakah itu inputan atau output

a(nilai,nilai,nilai,nilai,nilai) - procedure (i,i,i,i,i) %di a penyusunanya adalah semuanya adalah inputan dan tipe datanya integer
b(nilai,nilai,nilai,nilai,nilai) - procedure (i,i,i,i,i) %di b penyusunanya adalah semuanya adalah inputan dan tipe datanya integer
c(nilai,nilai,nilai,nilai,nilai) - procedure (i,i,i,i,i) %di c penyusunanya adalah semuanya adalah inputan dan tipe datanya integer



clauses%calauses adalah suatu pernyataan yang harus di penuhi

a(A,S,D,Q,Hasil):- %untuk pernyataan a menggunakan variable A,S,D,Q,Hasil
	Hasil=A+S/D-Q. %Rumusan di sebelah adalah untuk mencari Hasil
	
b(A,S,D,Q,Hasil):- %untuk pernyataan b menggunakan variable A,S,D,Q,Hasil
	Hasil=A-S/D-Q. %Rumusan di sebelah adalah untuk mencari Hasil
c(A,S,D,Q,Hasil):- %untuk pernyataan c menggunakan variable A,S,D,Q,Hasil
	Hasil=A*S/D-Q. %Rumusan di sebelah adalah untuk mencari Hasil
	
	
goal %Goal adalah hal yang ingin di dapatkan
c(3,2,4,5,4).%yang ingin di cari adalah pernyataan c dengan inputanyanya 3,2,4,5,4 

