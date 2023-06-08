program MetroDeCaracas;
uses crt;
var
    isNumber, isTravel, isRepeat, isTicket: boolean;
    repeatTravel,  repeatTicket, iNumber: integer;
    ticketAmount, price, travelType: integer;
    travel,  nombre, apellido, cedula: string;
    ticketType: char;


    

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
            delay(1500);
            Halt(0);
        end;
    else
    begin
        writeln('Debe seleccionar una opcion correcta');
    end; 
    end;
//Se utiliza ciclos repetitivos para crear una interfaz y mostar boletos
until isTravel;
    clrscr;
    isTicket := false;    
    repeat    
    writeln ('    |    Boletos      |       Cobertura              | Precio           |');
    writeln ('    -----------------------------------------------------------------------');
    Textcolor(yellow);
    writeln ('    | a)  Simple      | 1 viaje en metro             | 10$');
    Textcolor(white);
    writeln ('    -----------------------------------------------------------------------');
    Textcolor(yellow);
    writeln ('    | b) Integrado    | viaje en metrobus y en metro | 15$');
    Textcolor(white);
    writeln ('    -----------------------------------------------------------------------');
    Textcolor(yellow);
    writeln ('    | c)Ida y vuelta  | 2 viajes en metro            | 12$');
    Textcolor(white);
    writeln ('    -----------------------------------------------------------------------');
    Textcolor(yellow);
    writeln ('    | d)Ida y vuelta  | 2 viajes en metro            | 18$');
    writeln ('    |   integrado     | 2 viajes en metrobus         |    ');
    Textcolor(white);
    writeln ('    -----------------------------------------------------------------------');
    textcolor(LightGreen);
    writeln ('    | e) MultiAbono   | 10 viajes en metro           | 25$');
    textcolor(white);
    writeln ('    -----------------------------------------------------------------------');
    textcolor(LightGreen);
    writeln ('    | f) MultiAbono   | 10 viajes en metro           | 30$');
    writeln ('    |    integrado    | 10 viajes en metrobus        |    ');
    textcolor(white);
    writeln ('    -----------------------------------------------------------------------');
    textcolor(LightBlue);
    writeln ('    | g) Estudiantil  | 10 viajes en metro           | 8$ ');
    writeln ('    |      Simple     |                              |    ');
    textcolor(white);
    writeln ('    -----------------------------------------------------------------------');
    textcolor(LightBlue);
    writeln ('    | h) Estudiantil  | 10 viajes en metro           | 13$ ');
    writeln ('    |    Integrado    | 20 viajes en metrobus        |     ');
    textcolor(white);
    writeln ('    -----------------------------------------------------------------------');;
    textcolor(LightRed);
    writeln ('    |                 | 20 viajes                    | 7$ ');
    writeln ('    | i)MetroTarjeta  | 30 viajes                    | 14  ');
    writeln ('    |                 | 40 viajes                    | 28    ');
    textcolor(white);
    writeln ('    -----------------------------------------------------------------------');
    textcolor(LightRed);
    writeln ('    | j)MetroTarjeta | 20 viajes (Metro y Metrobus)  | 11$ ');
    writeln ('    |    Integrada    | 30 viajes (Metro y Metrobus) | 22$ ');
    writeln ('    |                 | 40 viajes (Metro y Metrobus) | 33$ ');
    textcolor(white);
    delay(5000);
    clrscr;
    WriteLn('Presiona 1 si quiere comprar su boleto/s ');
    WriteLn('Presiona 2 si desea volver a ver la lista de boletos');
    readln(repeatTicket);
    if (repeatTicket=1) then
            begin
            isTicket := true;
            WriteLn('¿Que boleto desea comprar?');
            Writeln('Si quieres ver nuevamente las opciones presiona 0');
            readln(ticketType);
            if ticketType = '0' then
                begin
                    isTicket := false;
                    clrscr;
                end
                else if (ticketType='a') or (ticketType='b') or (ticketType='c') or (ticketType='d') or (ticketType='e') or (ticketType='f') or (ticketType='g') or (ticketType='h') or (ticketType='i') or (ticketType='j') then
                begin
                    isTicket:= true;
                end
                else
                begin
                    isTicket := false;
                    WriteLn('Oprimiste una opcion invalida');
                    WriteLn('Te enseñare otra vez las opciones...');
                    delay(2000);
                    clrscr;
                end;  
            end;
    if (repeatTicket=2) then
            begin
            isTicket := false;
            end;
    if (repeatTicket<>1) and (repeatTicket<>2) then
            begin
            WriteLn('Debes seleccionar una opcion valida');
            end;                
    until isTicket;
    
end.
