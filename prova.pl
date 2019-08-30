/* Questão 1 Enunciado */
estudante(1234, 'Alan Almeida').
estudante(2345, 'Bruno Barros').
estudante(3456, 'Carla Chaves').
estudante(4567, 'Denise Duran').
estudante(5678, 'Enio Esteves').

curso(666, domino).
curso(069, truco).
curso(171, poker).

matriculado(1234, 666).
matriculado(1234, 069).
matriculado(1234, 171).
matriculado(2345, 069).
matriculado(3456, 171).
matriculado(4567, 069).
matriculado(5678, 171).

/* Letra a */
cursa(Nome, Curso) :- 
    estudante(Matricula, Nome), 
    curso(Codigo, Curso), 
    matriculado(Matricula, Codigo).

/* Letra b 
?- cursa(X, truco). */

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

/* Questão 2 Enunciado */
palavra(artigo, um).
palavra(artigo, o).
palavra(substantivo, bandido).
palavra(substantivo, hamburguer).
palavra(pronome, algum).
palavra(pronome, todo).
palavra(verbo, come).
palavra(verbo, rouba).

/* Letra a */
frase(P1, P2, P3, P4, P5) :- 
  palavra(artigo, P1), 
  palavra(substantivo, P2),
  palavra(verbo, P3),
  palavra(pronome, P4),
  palavra(substantivo, P5).

/* Letra b
Não, mas a frase "o bandido rouba algum hamburguer" é válida. */

/* Letra c: 2^5 = 32 combinações. */

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

/* Questão 3 enunciado */
pai(amanda, bruno).
pai(amanda, carlos).
pai(bruno, daiane).
pai(bruno, evelin).
pai(carlos, felipe).

/* Letra a */
% X e Y são irmãos se tem o mesmo pai
irmao(X, Y) :- pai(Z, X), pai(Z, Y).

/* Letra b */
/* X e Y serão primos se o pai de X 
 é irmão do pai de Y */
primo(X, Y) :- pai(Z, X), pai(U, Y), irmao(Z, U).

/* Letra c */
% X será neto de Y se o pai de X é filho de Y
neto(X, Y) :- pai(Z, X), pai(Y, Z).

/* Letra d */
% X vai ser descendente de Y se Y é pai de X ou pai de algum pai
descendente(X, Y) :- pai(Y, X).
descendente(X, Y) :- pai(Z, X), descendente(Z, Y).

/* Letra e */
% X será avô se X tem um neto.
avo(X) :- neto(_, X).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

/* Questão 4 enunciado  */
c(1, 2).
c(3, 4).
c(5, 6).
c(7, 8).
c(9, 10).
c(12, 13).
c(13, 14).
c(15, 16).
c(17, 18).
c(19, 20).
c(4, 1).
c(4, 7).
c(6, 3).
c(6, 11).
c(11, 15).
c(14, 9).
c(14, 17).
c(16, 12).
c(16, 19).

/* Letra a */
% vai de X a Y se existe um caminho de X a Y
vai(X, Y) :- c(X, Y).
% vai de X a Y se existe Z tal que e possível alcançar Y a partir de Z
vai(X, Y) :- c(X, Z), vai(Z, Y). 

/* Letra b */
% Sim. Apenas a sala 5.

/* Letra c */ 
% Sala 2, 8, 10, 18 e 20.

/* Letra d */ 
% É possível chegar na sala 20 a partir das salas 19, 5, 15, 6, 11 e 16. Logo, a sala com menor número é a 5. 

/* Letra e */
% Não. O predicado supradefinido considera apenas os caminhos de X para Y, não está definido de Y para X.
% Para tal, precisaríamos adicionar:
% 	vai(X, Y) :- c(Y, X).
%	vai(X, Y) :- c(Y, Z), vai(Z, Y).