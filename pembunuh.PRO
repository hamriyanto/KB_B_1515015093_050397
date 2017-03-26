/*****************************************************************************

		Copyright (c) 1984 - 2000 Prolog Development Center A/S

 Project:  
 FileName: CH04E12.PRO
 Purpose: 
 Written by: PDC
 Modifyed by: Eugene Akimov
 Comments: 
******************************************************************************/

trace
domains
  name,sex,occupation,object,vice,substance = symbol
  age=integer

predicates
  person(name,age,sex,occupation) - nondeterm (o,o,o,o), nondeterm (i,o,o,i), nondeterm (i,o,i,o)
  had_affair(name,name) - nondeterm (i,i), nondeterm (i,o)
  killed_with(name,object) - determ (i,o)
  killed(name) - procedure (o)
  killer(name) - nondeterm (o)
  motive(vice) - nondeterm (i)
  smeared_in(name,substance) - nondeterm (i,o), nondeterm (i,i)
  owns(name,object) - nondeterm (i,i)
  operates_identically(object,object) - nondeterm (o,i)
  owns_probably(name,object) - nondeterm (i,i)
  suspect(name) - nondeterm (i)

/* * * Facts about the murder * * */
clauses
%pada facts and rules yang di bahas pertama adalah person
%person terdiri dari (nama orang,berat,jenis kelamin,dan status pekerjaannya)
  person(bert,55,m,carpenter).%person pertama yaitu (bernama bert,berat 55kg , laki - laki , pekerjaan tukang kayu)
  person(allan,25,m,football_player). %person kedua yaitu (bernama bert,berat 55kg , laki - laki , pekerjaan pemain bola)
  person(allan,25,m,butcher). %persone ketiga yaitu (bernama bert,berat 55kg , laki - laki , pekerjaan tukang dagin)
  person(john,25,m,pickpocket). %persone keempat  yaitu (bernama john,25kg , laki - laki , pencopet)

%clauses kedua yaitu had_affair atau memiliki hubungan
  had_affair(barbara,john). %memiliki hubungan antara barbara dan john
  had_affair(barbara,bert). %memiliki hubungan antara barbara dan bert
  had_affair(susan,john).   %%memiliki hubungan antara susan dan john
			    %di sini barbara memiliki dua hubungan yaitu john dan bert dan john pun memiliki dua hubungan bersama susan dan barbara
			     	
  killed_with(susan,club).  %susan di sini di bunuh dengan benda tumpul/pentungan
  killed(susan).	    %yang di bunuh susan

  motive(money).  	    % motive nya atau tujuan membunuhnya terdapat 3 uang ,cemburu,keadilan/kebenaran
  motive(jealousy).
  motive(righteousness).    

  %di sini ada orang yang berlumuran
  smeared_in(bert,blood).   %bert di sini terdapat lumuran darah
  smeared_in(susan,blood).  %susan juga terdapat lumuran daraj
  smeared_in(allan,mud).    %allan terdapat lumuran lumpur
  smeared_in(john,chocolate).%john terdapat lumuran coklat
  smeared_in(barbara,chocolate).%barbar terdapat lumuran coklat

  %disini membahas tentang kepemilikan
  owns(bert,wooden_leg).    %bert memiliki kaki palsu/kaki kayu
  owns(john,pistol).        %john memiliki pistol

/* * * Background knowledge * * */
   
  operates_identically(wooden_leg, club).%kaki palsu termasuk dalam pentungan
  operates_identically(bar, club).%balok termasuk dalam pentungan
  operates_identically(pair_of_scissors, knife).%gunting dalam pisau
  operates_identically(football_boot, club).%sepatu bola termasuk dalam pentungan

  %kemungkinan kepemilikan 
  owns_probably(X,football_boot):-%di sini X memiliki sepatu sepakbola jika
	person(X,_,_,football_player).%kemungkinan orangnya atau x, yaitu seorang pemain bola
  owns_probably(X,pair_of_scissors):-%di sini x memiliki sepasang gunting jika 
	person(X,_,_,hairdresser).%kemungkinan orangnya atau x. seorang penata rambut
  owns_probably(X,Object):-%own_probably hanya tertuju pada nama dan objeknya jika
	owns(X,Object).%di sini x memiliki objek

/* * * * * * * * * * * * * * * * * * * * * * *
 * Suspect all those who own a weapon with   *
 * which Susan could have been killed.       *
 * * * * * * * * * * * * * * * * * * * * * * */

  suspect(X):-%di sini bagaimna suatu tersangka dapat di ketahui jika
	killed_with(susan,Weapon) ,%dia membunuh susan dengan menggunakan senjata,
	operates_identically(Object,Weapon) ,%objek senjatanya apa
	owns_probably(X,Object).%objek senjatanya memiliki suatu hubungan kepemilikan dengan pelaku atau X

/* * * * * * * * * * * * * * * * * * * * * * * * * *
 * Suspect men who have had an affair with Susan.  *
 * * * * * * * * * * * * * * * * * * * * * * * * * */
%di sini jika suatu tersangka yang memili hubungan dengan susan dan seorang laki - laki
  suspect(X):-%tersangka dapat di ketahui jika
	motive(jealousy),%yang pertama motifnya cemburu
	person(X,_,m,_),%orangnya  adalah dalam variable X dan seorang laki-laki
	had_affair(susan,X).%dan X memiliki hubungan dengan susan

/* * * * * * * * * * * * * * * * * * * * *
 * Suspect females who have had an       *
 * affair with someone that Susan knew.  *
 * * * * * * * * * * * * * * * * * * * * */
%jika dia seorang wanita dan dan diketahui susan
  suspect(X):-%maka tersangkanya dapat di ketahui jika 
	motive(jealousy),%motifnya adalah cemburu 
	person(X,_,f,_),%pelakunya adalah X dan seorang perempuan
	had_affair(X,Man),%dan si X memiliki hubungan dengan laki-laki
	had_affair(susan,Man).%dan susan memiliki hubungan dengan laki - laki yang di kenal X

/* * * * * * * * * * * * * * * * * * * * * * * * * * *
 * Suspect pickpockets whose motive could be money.  *
 * * * * * * * * * * * * * * * * * * * * * * * * * * */
%di sini tersangka jika seorang pencopet dan motifnya kemungkinan uang
  suspect(X):-%tersangka dapat di ketahui jika
	motive(money),%matifnya adalah uang
	person(X,_,_,pickpocket).%dan status pekerjaan dari X adalah pencopet

  killer(Killer):-%di sini bagaimana mengetahui si pembunuh jika
	person(Killer,_,_,_),%seorang itu adalah orangnya tersebut masuk variable killer
	killed(Killed),%yang dibunuh masuk dalam variable killed
	Killed <> Killer, /* It is not a suicide */%dan pembunuh dan yang dibunuh bukan orang yang sama
	suspect(Killer),%tersangkanya adalah si pembunuh
	smeared_in(Killer,Goo),%dan pembunuh berlumuran dengan suatu cairan/zat
	smeared_in(Killed,Goo).%dan zat tersebut sama dengan atau ada juga pada orang yang dibunuh

	%di s
goal
  killer(X).%di sini sang pembunuh dapat di ketahui sebagai variable X dan dari hubungan dari beberap clauses yang telah di jabarkan dan diambil pada kesimpulan pada clauses killer
  
   %setelah di jalankan pembunuhnya ternyata adalah bert dari beberapa clausesnya bert merupakan pembunuh dan yang dibunuh adalah susn berati bert dan susan bukan orang yang sama 
   %pada cluases killed_with susan di bunuh menggunakan pentungan dan kaki palsu merupaka pentungan dan hanya bert yang memiliki kaki palsu
   %selain itu pada clauses smeared_in bert berlumuran darah dan susan juga berlumuran darah yang telah memenuhi clauses killer