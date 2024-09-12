#include <iostream>
#include <cstring>

using namespace std;

extern "C" int menu(int num1, int num2, int opcion);
extern "C" void decimal_to_binary(int num, char* buffer);
extern "C" void decimal_to_hex(int num, char* buffer);
extern "C" void decimal_to_octal(int num, char* buffer);
//extern "C" void coversor();

int main() {

    bool salir = false;
    int num1, num2, resultado, opcion;
    char binary[33], hex[9], octal[12];

    while(salir == false){

        cout << "\t Menú" << endl;
        cout << "Seleccione una opción:" << endl;
        cout << "1- Suma" << endl;
        cout << "2- Resta" << endl;
        cout << "3- Multiplicación" << endl;
        cout << "4- División" << endl;
        cout << "5- Salir" << endl;
        cout << "----------------------------" << endl;

        cin >> opcion;


        if (opcion >= 1 && opcion <= 4) {

            cout << "Ingrese el primer número: ";
            cin >> num1;

            cout << "Ingrese el segundo número: ";
            cin >> num2;
            cout << "----------------------------" << endl;

            resultado = menu(num1, num2, opcion);
            cout << "El resultado en decimal es: " << resultado << "\n";
            
            // Convertir y mostrar en otros formatos
            decimal_to_binary(resultado, binary);
            decimal_to_hex(resultado, hex);
            decimal_to_octal(resultado, octal);

            cout << "El resultado en binario: " << binary << endl;
            cout << "El resultado en hexadecimal: " << hex << endl;
            cout << "El resultado en octal: " << octal << endl;
            
            cout << "----------------------------" << endl;

        } else if (opcion == 5) {

            cout << "Saliendo del programa." << endl;
            salir = true;

        } else {

            cout << "Opción no válida." << endl;

        }
    }

    return 0;

}
