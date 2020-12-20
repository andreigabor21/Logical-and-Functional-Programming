#include "lista.h"
#include <iostream>

using namespace std;

int main()
{
	Lista l;
	l = creare();
	tipar(l);

	string res = checkEvenList(l) ? "Even" : "Odd";
	cout <<'\n'<< res << '\n';


	delete_all(l._prim, 2);
	cout << "Modified list:\n";
	tipar(l);
}
