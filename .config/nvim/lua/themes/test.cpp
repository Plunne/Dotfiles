#include <iostream>

#define CONST 256

using namespace std; // Don't Reproduce

class MyClass () public : Mother
{
	bool attr = false;
private:
	MyClass();
	~MyClass();
	void method(char &array);
}

int main(void) {
	
    char var = CONST;
	char *p_var = &var;
	MyClass MyObj;

    if ( var == CONST)
    {
		MyObj.attr = true;
		MyObj.method(p_var);
    }
    else
    {
		std::cout << "Hello World!\n" << std::endl;
    }
	
    return 0;
}
