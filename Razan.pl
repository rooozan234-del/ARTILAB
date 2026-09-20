% ARTI 303 - Lab 3 Assignment 01
% Student: Razan Mohammed Alzahrani
% Family knowledge base in Prolog

% --------------------
% Facts: gender
% --------------------

male(ali).
male(ahmad).
male(muhammad).
male(faisal).
male(hassan).
male(khan).

female(fatimah).
female(layla).
female(amal).
female(reem).
female(sara).
female(nora).

% --------------------
% Facts: parent(Parent, Child)
% --------------------

parent(ali, ahmad).
parent(fatimah, ahmad).
parent(ali, muhammad).
parent(fatimah, muhammad).

parent(ahmad, sara).
parent(layla, sara).
parent(ahmad, nora).
parent(layla, nora).
parent(ahmad, khan).
parent(layla, khan).

parent(muhammad, faisal).
parent(amal, faisal).

parent(faisal, hassan).
parent(reem, hassan).

% --------------------
% Rules
% --------------------

% X is the father of Y when X is male and X is a parent of Y.
father(X, Y) :-
    male(X),
    parent(X, Y).

% X is the mother of Y when X is female and X is a parent of Y.
mother(X, Y) :-
    female(X),
    parent(X, Y).

% X is a sister of Y when X is female, they share a parent,
% and X and Y are not the same person.
sister(X, Y) :-
    female(X),
    parent(P, X),
    parent(P, Y),
    X \= Y.

% X is a brother of Y when X is male, they share a parent,
% and X and Y are not the same person.
brother(X, Y) :-
    male(X),
    parent(P, X),
    parent(P, Y),
    X \= Y.

% --------------------
% Test queries (run these in the SWI-Prolog console)
% --------------------

% father(ali, ahmad).          Expected: true
% father(ahmad, sara).         Expected: true

% mother(fatimah, muhammad).   Expected: true
% mother(layla, nora).         Expected: true

% sister(sara, khan).          Expected: true
% sister(nora, sara).          Expected: true

% brother(khan, sara).         Expected: true
% brother(ahmad, muhammad).    Expected: true

