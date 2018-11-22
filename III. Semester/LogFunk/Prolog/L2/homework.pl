%1
dupla([],[]).
dupla([F|M],[F,F|M1]):-
    dupla(M,M1).

%2
makek(_,0,[]).
makek(E,K,[E|T]):-
    K > 0,
    KK is K-1,
    makek(E,KK,T).

kszor(_,[],[]).
kszor(T,[F|M],L):-
    makek(F,T,LL),
    kszor(T,M,R),
    append(LL,R,L).
%3
sum([],0).
sum([F|M],A):-
    sum(M,AA),
    A is AA + F.

%4
ablist(B,B,[B]).
ablist(A,B,[A|M]):-
    A < B,
    AA is A + 1,
    ablist(AA,B,M).

%5
inverz(T,N):-
    inverz2(T,[],N).
inverz2([],L,L).
inverz2([H|T],N,L):-
    NN = [H|N],
    inverz2(T,NN,L).


%6
torolk(L,K,Kimenet):-
    findall(Elem,(nth1(Ind,L,Elem),Ind mod K =\= 0),Kimenet).
torolk(L,0,L).

%7

is_permutation(Xs, Ys) :-
  msort(Xs, Sorted),
  msort(Ys, Sorted).

perm(L):-
    length(L,N),
    ablist(1,N,T),
    is_permutation(L,T).


%8

egy([],[]).
egy([F|M],[[F,1]|BM]):-
    egy(M,BM).

oss([],[]).
oss([X],[X]).
oss([[X,N1],[X,N2]|T],BM):-
    N is N1+N2,
    oss([[X,N]|T],BM).

oss([[X,N1],[Y,N2]|F],[[X,N1]|BM]):-
    X \= Y,
    oss([[Y,N2]|F],BM).

reduct([[F,1]|T],[F|T1]):-
    reduct(T,T1).

reduct([[F,N]|T],[[F,N]|T1]):-
    N > 1,
    reduct(T,T1).

reduct([],[]):-!.

kompakt(L,R):-
    egy(L,T),
    oss(T,E),
    reduct(E,R).



%9

num(0).
num(1).
num(2).
num(3).
num(4).
num(5).
num(6).
num(7).
num(8).
num(9).

money(L):-
    L = [D,E,M,N,O,R,S,Y],
    num(D),
    num(E),
    M is 1,
    num(N),
    num(O),
    num(R),
    num(S),
    num(Y),
    D\=E,D\=M,D\=N,D\=O,D\=R,D\=S,D\=Y,
    E\=M,E\=N,E\=O,E\=R,E\=S,E\=Y,
    M\=N,M\=O,M\=R,M\=S,M\=Y,
    N\=O,N\=R,N\=S,N\=Y,
    O\=R,O\=S,O\=Y,
    R\=S,R\=Y,
    S\=Y,
    S\=0,
    Elso is D + 10*N + 100*E + 1000*S,
    Masodik is E + 10*R + 100*O + 1000,
    Eredmeny is Y + 10*E + 100*N + 1000*O + 10000,
    Temp is Elso + Masodik,
    Eredmeny = Temp.

%10

isSzinesz(L):-
    actor(_,L,_).
isSzinesz(L):-
    actress(_,L,_).

szamol(L,R):-
    findall(L,(actor(_,L,_) ;actress(_,L,_)),R).

geta(L):-
    isSzinesz(L),
    szamol(L,R),
    length(R,N),
    N = 1.

getb(L):-
    isSzinesz(L),
    szamol(L,R),
    length(R,N),
    N = 2.

getc(L):-
    isSzinesz(L),
    szamol(L,R),
    length(R,N),
    N = 0.






%P2

%1


rand(_,0,[]).
rand(D,N,[A|R]):-
    NN is N-1,
    random(1,D,A),
    rand(D,NN,R).

%2


generate([],[]).
generate(T,[E|L]):-
    random_select(E,T,TT),
    generate(TT,L).

randperm(N,L):-
    ablist(1,N,T),
    generate(T,L).

%3

d(x,1):-!.

d(-X,E):-
    d(X,DX),
    E = -DX,
    !.

d(X+Y,E):-
    d(X,DX),
    d(Y,DY),
    E = DX + DY,
    !.

d(X-Y,E):-
    d(X,DX),
    d(Y,DY),
    E = DX - DY,
    !.

d(X*Y,E):-
    d(X,DX),
    d(Y,DY),
    E = (DX*Y)+(DY*X),
    !.

d(X/Y,E):-
    d(X,DX),
    d(Y,DY),
    E = (DX*Y - X*DY) / (Y^2),
    !.

d(sin(X),E):-
    d(X,DX),
    E = cos(X)*DX,
    !.

d(cos(X),E):-
    d(X,DX),
    E = -sin(X)*DX,
    !.

d(_,0).

%4
%1

film1(A):-
    movie(_,A),
    A < 1980.

film2(D):-
    movie(M,A),
    A < 2005,
    A > 2000,
    director(M,D).

elott(L):-
    findall(A,film1(A),L).

kozott(L):-
    findall(A,film2(A),L).


%2

ugyanabban(M1,M2):-
    movie(M1,A),
    movie(M2,A),
    M1 \== M2.

jopartner(X,Y):-
    ( actor(_,X,_) ; actress(_,X,_) ),
    ( actor(_,Y,_) ; actress(_,Y,_) ),
    X \== Y,
    (actor(F1,X,_) ; actress(F1,X,_) ),
    (actor(F1,Y,_) ; actress(F1,Y,_) ),
    (actor(F2,X,_) ; actress(F2,X,_) ),
    (actor(F2,Y,_) ; actress(F2,Y,_) ),
    F1 \== F2.



regebbi(M,E):-
    movie(M,A),
    A < E.

korabbi(F1,F2):-
    movie(F1,E1),
    movie(F2,E2),
    E1 < E2.

%4


szinesz_szam(N):-
    setof(L,isSzinesz(L),T),
    length(T,N).

%5


partnerszam(A,T):-
    findall(D,jopartner(A,D),R),
    list_to_set(R,RR),
    length(RR,T).

generate2([],[]).
generate2([A|T],[[A,N]|S]):-
    partnerszam(A,N),
    generate2(T,S).


topn(_,0,[]).
topn([],_,[]).
topn([X],_,[X]).
topn([A|E],N,[A|L]):-
    N \= 0,
    NN is N-1,
    topn(E,NN,L).

top25(A):-
    setof(L,isSzinesz(L),T),
    generate2(T,S),
    sort(2, @>=, S, E),
    topn(E,25,A).

