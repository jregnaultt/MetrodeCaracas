program MetroDeCaracas;
uses crt;
var
    isNumber, isTravel, isRepeat: boolean;
    repeatTravel, iNumber: integer;
    travel, nombre, apellido, cedula: string;

//menu de viaje y solicitud de datos del cliente 
begin
    clrscr;
    writeln(   'Bienvenid@ al Metro de Caracas');
    writeln('  ¿Desea comprar un boleto?');
    WriteLn('');
    WriteLn('Si ---------------------------- No');
    readln(travel);
    isNumber := false;
    travel := lowerCase(travel);
// Utilizamos un repeat para que la confirmacion de los datos del usuario, el usario puede editar los datos cuantas veces sea, por si se llega a equivocar en algo.    
    repeat
    isTravel := true;
// Utilizamos un case para saber si el usuario quiere o no comprar boletos, basicamente creamos un menu para saber si el usuario quiere viajar
// En caso de que si, le pedimos los datos para almacenarlos, y en caso contrario nos despedimos de manera formal.    
    case travel of 
        'si': begin
            clrscr;
            writeln('A continuacion ingrese su nombre');
            readln(nombre);
            writeln('');
            writeln('Ingrese su apellido');
            readln(apellido);
            writeln('');
            //desde el ciclo el repeat hasta el ciclo for es una comprobacion para que la variable cedula solo pueda tener caracteres numerico
            //en dado caso que sea un caracter no numerico, el ciclo se repetira hasta que se ingrese una cedula valida
            repeat
            writeln('Ingrese su numero de cedula de identidad');
            write('C.I: ');
            readln(cedula);
            isNumber := true;
            for iNumber := 1 to length(cedula) do 
            begin
                if not (cedula[iNumber] in ['0'..'9']) then 
                begin
                writeln('No has ingresado un caracter no correspondiente a una cedula de identidad.');
                writeln('Por favor intente nuevamente');
                isNumber := false;
                break;
                end;
            end;
            until isNumber;
            delay(1500);
            clrscr;
            writeln('Por favor comprueba que tus datos sean los correctos...');
            writeln('');
            writeln('C.I: ', cedula);
            writeln('Nombre: ', nombre);
            writeln('Apellido: ', apellido);
            writeln('');
            isRepeat := true;
//este repeat lo que hace es que se tenga que repetir el proceso hasta que se evalue el isTravel correctamente, osea hasta que presionen
// 2 o 1 para poder o modificar los datos o continuar sencillamente. Si colocas cualquier otro numero que no sea ni 1 ni 2, entonces se repetira
// que se ha ingresado un valor invalido y que debe presionar 1 para modificar los datos o 2 para continuar.            
            repeat
            writeln('Presiona 1, si deseas modificar tus datos');
            writeln('Presiona 2, si deseas continuar');
            readln(repeatTravel);
            if repeatTravel = 1 then 
            begin
                isTravel := false;
                isRepeat := true;
            end;
            if  repeatTravel = 2 then
            begin
                isTravel := true;
                isRepeat := true;
            end;
            if  (repeatTravel <> 1) and  (repeatTravel <> 2) then
            begin
                isTravel := false;
                isRepeat := false;
                writeln('Opcion invalida, debes presionar un caracter valido');
            end;
            until isRepeat;
            delay(1500);
            clrscr;
            WriteLn('Estamos procesando la informacion');
        end;
        'no': begin
            writeln('Gracias por preferirnos, ¡hasta luego!');
            Halt(0);
        end;
    else
    begin
        writeln('Debe seleccionar una opcion correcta');
    end; 
    end;
until isTravel;
end.