#include "lista.h"
#include <iostream>

using namespace std;


PNod creare_rec() {
    TElem x;
    cout << "x=";
    cin >> x;
    if (x == 0)
        return NULL;
    else {
        PNod p = new Nod();
        p->e = x;
        p->urm = creare_rec();
        return p;
    }
}

Lista creare() {
    Lista l;
    l._prim = creare_rec();
    return l;
}

void tipar_rec(PNod p) {
    if (p != NULL) {
        cout << p->e << " ";
        tipar_rec(p->urm);
    }
}

void tipar(Lista l) {
    tipar_rec(l._prim);
}

void distrug_rec(PNod p) {
    if (p != NULL) {
        distrug_rec(p->urm);
        delete p;
    }
}

void distruge(Lista l) {
    //se elibereaza memoria alocata nodurilor listei
    distrug_rec(l._prim);
}

//Determine if a list has even number of elements, without computing the length of the list
bool evenList(PNod p1) {
    if (p1 == NULL)
        return true;
    else if (p1->urm == NULL)
        return false;
    else
        return evenList(p1->urm->urm);
}

bool checkEvenList(Lista l) {
    return evenList(l._prim);
}

//Delete all occurrences of an element e from a list
PNod delete_all(PNod p1, TElem e) {
    if (!p1) {
        return NULL;
    }
    PNod right = delete_all(p1->urm, e);
    if (p1->e != e) {
        p1->urm = right;
        return p1;
    }
    delete p1;
    return right;
}



