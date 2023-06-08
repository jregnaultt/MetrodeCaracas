program MetroDeCaracas;
uses crt;
var
    simpleTicket: integer;
    isNumber, isTravel, isRepeat, isTicket, isLetter, isLobby: boolean;
    repeatTravel,  repeatTicket, iNumber, iCedula, iLetter: integer;
    ticketAmount, ticketPrice, travelType, ticketMetro, ticketMBus, ticketMTarjeta: integer;
    travel,  nombre, apellido, cedula, cedulaSinPuntos: string;
    ticketType: char;   
Const 
    a = 'Ticket/s: Simple ';{Amarillo }
    b = 'Ticket/s: Integrado';{Amarillo}
    c = 'Ticket/s: Ida y vuelta';{Amarillo}
    d = 'Ticket/s: Ida y vuelta integrado';{Amarillo}
    e = 'Ticket/s: Multiabono';{Verde}
    f = 'Ticket/s: Multiabono integrado';{Verde}
    g = 'Ticket/s: Estudiantil simple';{Azul}
    h = 'Ticket/s: Estudiantil integrado';{Azul}
    i = 'Ticket/s: MetroTarjeta';{Rojo}
    j = 'Ticket/s: MetroTarjeta Integrada';{Rojo}    


    

//menu de viaje y solicitud de datos del cliente 
begin
    repeat
    isLobby := false;
    clrscr;
    writeln(   'Bienvenid@ al Metro de Caracas');
    writeln('  ¿Desea comprar un boleto?');
    WriteLn('');
    WriteLn('Si ---------------------------- No');
    readln(travel);
    isNumber := false;
    travel := lowerCase(travel);
    // Se utiliza un repeat y un if para comprobar que se seleccione una opcion valida entre si y no para poder avanzar o simplemente despedirnos del cliente.
    if (travel <> 'si') and (travel <> 'no') then
    begin
        WriteLn('Debes selecionar una opcion valida');
        isLobby := true;
    end;
    until (isLobby=false);
// Utilizamos un repeat para que la confirmacion de los datos del usuario, el usario puede editar los datos cuantas veces sea, por si se llega a equivocar en algo.    
    repeat
    isTravel := true;
// Utilizamos un case para saber si el usuario quiere o no comprar boletos, basicamente creamos un menu para saber si el usuario quiere viajar
// En caso de que si, le pedimos los datos para almacenarlos, y en caso contrario nos despedimos de manera formal.    
    case travel of 
        'si': begin
            repeat
            isLetter := false;          
            clrscr;
            writeln('A continuacion ingrese su nombre');
            readln(nombre);
            writeln('');
            writeln('Ingrese su apellido');
            readln(apellido);
            writeln('');
            //Los siguientes 2 for son utilizados para que el nombre y el apellido solo puedan contener letras, es decir, nada de caracteres especiales, numeros, etc.
            for iLetter := 1 to Length(nombre) do
            begin
                if not (nombre[iLetter] in ['A'..'Z', 'a'..'z']) then
                begin
                    Writeln('Tu nombre tiene un caracter invalido.');
                    isLetter := true;
                    delay(1250);
                    Break;
                end;
            end;
            for iLetter := 1 to Length(apellido) do
            begin
                if not (apellido[iLetter] in ['A'..'Z', 'a'..'z']) then
                begin
                    Writeln('Tu apellido tiene un caracter invalido.');
                    isLetter := true;
                    delay(1250);
                    Break;
                end;
            end;           
            until (isLetter=false);            
            //desde el ciclo el repeat hasta el ciclo for es una comprobacion para que la variable cedula solo pueda tener caracteres numerico
            //en dado caso que sea un caracter no numerico, el ciclo se repetira hasta que se ingrese una cedula valida
            repeat
            writeln('Ingrese su numero de cedula de identidad (sin utilizar puntos)');
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
            writeln('Tu cedula sera muy importante el proceso...');
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
    writeln ('    |    Boletos       |       Cobertura              | Precio           |');
    writeln ('    -----------------------------------------------------------------------');
    Textcolor(yellow);
    writeln ('    | a)  Simple       | 1 viaje en metro             | 10$');
    Textcolor(white);
    writeln ('    -----------------------------------------------------------------------');
    Textcolor(yellow);
    writeln ('    | b) Integrado     | viaje en metrobus y en metro | 15$');
    Textcolor(white);
    writeln ('    -----------------------------------------------------------------------');
    Textcolor(yellow);
    writeln ('    | c)Ida y vuelta   | 2 viajes en metro            | 12$');
    Textcolor(white);
    writeln ('    -----------------------------------------------------------------------');
    Textcolor(yellow);
    writeln ('    | d) Ida y vuelta  | 2 viajes en metro            | 18$');
    writeln ('    |   integrado      | 2 viajes en metrobus         |    ');
    Textcolor(white);
    writeln ('    -----------------------------------------------------------------------');
    textcolor(LightGreen);
    writeln ('    | e) MultiAbono    | 10 viajes en metro           | 25$');
    textcolor(white);
    writeln ('    -----------------------------------------------------------------------');
    textcolor(LightGreen);
    writeln ('    | f) MultiAbono    | 10 viajes en metro           | 30$');
    writeln ('    |    integrado     | 10 viajes en metrobus        |    ');
    textcolor(white);
    writeln ('    -----------------------------------------------------------------------');
    textcolor(LightBlue);
    writeln ('    | g) Estudiantil   | 10 viajes en metro           | 8$ ');
    writeln ('    |      Simple      |                              |    ');
    textcolor(white);
    writeln ('    -----------------------------------------------------------------------');
    textcolor(LightBlue);
    writeln ('    | h) Estudiantil   | 10 viajes en metro           | 13$ ');
    writeln ('    |    Integrado     | 20 viajes en metrobus        |     ');
    textcolor(white);
    writeln ('    -----------------------------------------------------------------------');;
    textcolor(LightRed);
    writeln ('    |                  | 20 viajes                    | 7$ ');
    writeln ('    | i) MetroTarjeta  | 30 viajes                    | 14  ');
    writeln ('    |                  | 40 viajes                    | 28$    ');
    textcolor(white);
    writeln ('    -----------------------------------------------------------------------');
    textcolor(LightRed);
    writeln ('    | j) MetroTarjeta  | 20 viajes (Metro y Metrobus)  | 11$ ');
    writeln ('    |    Integrada     | 30 viajes (Metro y Metrobus)  | 22$ ');
    writeln ('    |                  | 40 viajes (Metro y Metrobus)  | 33$ ');
    textcolor(white);
    delay(5000);
    clrscr;
    textcolor(LightGray);
    WriteLn('Presiona 1 si quiere comprar su boleto/s ');
    WriteLn('Presiona 2 si desea volver a ver la lista de boletos');
    WriteLn('');
    readln(repeatTicket);
    if (repeatTicket=1) then
            begin
            isTicket := true;
            WriteLn('¿Que boleto desea comprar?');
            Writeln('Si quieres ver nuevamente las opciones presiona 0');
            WriteLn('');
            readln(ticketType);
            ticketType := lowercase(ticketType);
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
                    delay(3500);
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

    clrscr;
    case ticketType of
        'a':begin
                    repeat
                    ticketPrice := 10;
                    clrscr;
                    textcolor(white);
                    writeln('-----------------------------------------------------------------------');
                    textcolor(LightGray);
                    writeln('Has selecionado ', a);
                    WriteLn('¿Cuantos tickets desea llevar?');
                    write('Llevare: ');read(ticketAmount); Write(' ticket/s');
                    if (ticketAmount < 0) then
                        begin
                            writeln('Debes colocar una cantidad mayor a 0');
                        end;
                    delay(200);
                    clrscr;
                    WriteLn('¿Estas seguro de llevar?:');
                    WriteLn(ticketAmount, '  ', a );
                    WriteLn('En total seria: ',ticketAmount*ticketPrice, '$');
                    WriteLn('');
                    WriteLn('Presiona cualquier tecla para continuar');
                    readkey;
                    clrscr;
                    WriteLn('Debido a su ticket, solo puede utilizar el metro.');
                    ticketMetro := ticketAmount;
                    WriteLn('Trendras disponible ', ticketMetro, ' viaje/s');
                    until (ticketAmount>0);
        end;
        'b':begin
                    repeat
                    ticketPrice := 15;
                    clrscr;
                    textcolor(white);
                    writeln('-----------------------------------------------------------------------');
                    textcolor(LightGray);
                    writeln('Has selecionado ', b);
                    WriteLn('¿Cuantos tickets desea llevar?');
                    write('Llevare: ');read(ticketAmount);
                    if (ticketAmount < 0) then
                        begin
                            writeln('Debes colocar una cantidad mayor a 0');
                        end;
                    delay(200);
                    clrscr;
                    WriteLn('¿Estas seguro de llevar?:');
                    WriteLn(ticketAmount, '  ', b );
                    WriteLn('En total seria: ',ticketAmount*ticketPrice, '$');
                    WriteLn('');
                    WriteLn('Presiona cualquier tecla para continuar');
                    readkey;
                    clrscr;
                    WriteLn('Debido a su ticket, podria utilizar viaje en metro o metrobus.');
                    ticketMetro := ticketAmount;
                    ticketMBus := ticketAmount;
                    WriteLn('Trendras disponible: ');
                    WriteLn(ticketMetro, ' viaje/s en metro');
                    WriteLn(ticketMBus, ' viaje/s en metrobus');
                    until (ticketAmount>0);
        end;
        'c':begin
                    repeat
                    ticketPrice := 12;
                    clrscr;
                    textcolor(white);
                    writeln('-----------------------------------------------------------------------');
                    textcolor(LightGray);
                    writeln('Has selecionado ', c);
                    WriteLn('¿Cuantos tickets desea llevar?');
                    write('Llevare: ');read(ticketAmount); Write(' ticket/s');
                    if (ticketAmount < 0) then
                        begin
                            writeln('Debes colocar una cantidad mayor a 0');
                        end;
                    delay(200);
                    clrscr;
                    WriteLn('¿Estas seguro de llevar?:');
                    WriteLn(ticketAmount, '  ', c );
                    WriteLn('En total seria: ',ticketAmount*ticketPrice, '$');
                    WriteLn('');
                    WriteLn('Presiona cualquier tecla para continuar');
                    readkey;
                    clrscr;
                    WriteLn('Debido a su ticket, solo puede utilizar el metro.');
                    ticketMetro := 2*ticketAmount;
                    WriteLn('Trendras disponible ', ticketMetro, ' viaje/s');
                    until (ticketAmount>0);
        end;
        'd':begin
                    repeat
                    ticketPrice := 18;
                    clrscr;
                    textcolor(white);
                    writeln('-----------------------------------------------------------------------');
                    textcolor(LightGray);
                    writeln('Has selecionado ', d);
                    WriteLn('¿Cuantos tickets desea llevar?');
                    write('Llevare: ');read(ticketAmount); Write(' ticket/s');
                    if (ticketAmount < 0) then
                        begin
                            writeln('Debes colocar una cantidad mayor a 0');
                        end;
                    delay(200);
                    clrscr;
                    WriteLn('¿Estas seguro de llevar?:');
                    WriteLn(ticketAmount, '  ', d );
                    WriteLn('En total seria: ',ticketAmount*ticketPrice, '$');
                    WriteLn('');
                    WriteLn('Presiona cualquier tecla para continuar');
                    readkey;
                    clrscr;
                    WriteLn('Debido a su ticket, podria utilizar viaje en metro o metrobus.');
                    ticketMetro := 2*ticketAmount;
                    ticketMBus := 2*ticketAmount;
                    WriteLn('Trendras disponible: ');
                    WriteLn(ticketMetro, ' viaje/s en metro');
                    WriteLn(ticketMBus, ' viaje/s en metrobus');
                    until (ticketAmount>0);
        end;
        'e':begin
                    repeat
                    ticketPrice := 25;
                    clrscr;
                    textcolor(white);
                    writeln('-----------------------------------------------------------------------');
                    textcolor(LightGray);
                    writeln('Has selecionado ', e);
                    WriteLn('¿Cuantos tickets desea llevar?');
                    write('Llevare: ');read(ticketAmount); Write(' ticket/s');
                    if (ticketAmount < 0) then
                        begin
                            writeln('Debes colocar una cantidad mayor a 0');
                        end;
                    delay(200);
                    clrscr;
                    WriteLn('¿Estas seguro de llevar?:');
                    WriteLn(ticketAmount, '  ', e );
                    WriteLn('En total seria: ',ticketAmount*ticketPrice, '$');
                    WriteLn('');
                    WriteLn('Presiona cualquier tecla para continuar');
                    readkey;
                    clrscr;
                    WriteLn('Debido a su ticket, solo puede utilizar el metro.');
                    ticketMetro := 10*ticketAmount;
                    WriteLn('Trendras disponible ', ticketMetro, ' viaje/s');
                    until (ticketAmount>0);
        end;
        'f':begin
                    repeat
                    ticketPrice := 30;
                    clrscr;
                    textcolor(white);
                    writeln('-----------------------------------------------------------------------');
                    textcolor(LightGray);
                    writeln('Has selecionado ', f);
                    WriteLn('¿Cuantos tickets desea llevar?');
                    write('Llevare: ');read(ticketAmount); Write(' ticket/s');
                    if (ticketAmount < 0) then
                        begin
                            writeln('Debes colocar una cantidad mayor a 0');
                        end;
                    delay(200);
                    clrscr;
                    WriteLn('¿Estas seguro de llevar?:');
                    WriteLn(ticketAmount, '  ', f );
                    WriteLn('En total seria: ',ticketAmount*ticketPrice, '$');
                    WriteLn('');
                    WriteLn('Presiona cualquier tecla para continuar');
                    readkey;
                    clrscr;
                    WriteLn('Debido a su ticket, podria utilizar viaje en metro o metrobus.');
                    ticketMetro := 10*ticketAmount;
                    ticketMBus := 10*ticketAmount;
                    WriteLn('Trendras disponible: ');
                    WriteLn(ticketMetro, ' viaje/s en metro');
                    WriteLn(ticketMBus, ' viaje/s en metrobus');
                    until (ticketAmount>0);
        end;
        'g':begin
                    repeat
                    ticketPrice := 8;
                    clrscr;
                    textcolor(white);
                    writeln('-----------------------------------------------------------------------');
                    textcolor(LightGray);
                    writeln('Has selecionado ', g);
                    WriteLn('¿Cuantos tickets desea llevar?');
                    write('Llevare: ');read(ticketAmount); Write(' ticket/s');
                    if (ticketAmount < 0) then
                        begin
                            writeln('Debes colocar una cantidad mayor a 0');
                        end;
                    delay(200);
                    clrscr;
                    WriteLn('¿Estas seguro de llevar?:');
                    WriteLn(ticketAmount, '  ', g );
                    WriteLn('En total seria: ',ticketAmount*ticketPrice, '$');
                    WriteLn('');
                    WriteLn('Presiona cualquier tecla para continuar');
                    readkey;
                    clrscr;
                    WriteLn('Debido a su ticket, solo puede utilizar el metro.');
                    ticketMetro := 10*ticketAmount;
                    WriteLn('Trendras disponible ', ticketMetro, ' viaje/s');
                    until (ticketAmount>0);
        end;
        'h':begin
                    repeat
                    ticketPrice := 13;
                    clrscr;
                    textcolor(white);
                    writeln('-----------------------------------------------------------------------');
                    textcolor(LightGray);
                    writeln('Has selecionado ', h);
                    WriteLn('¿Cuantos tickets desea llevar?');
                    write('Llevare: ');read(ticketAmount); Write(' ticket/s');
                    if (ticketAmount < 0) then
                        begin
                            writeln('Debes colocar una cantidad mayor a 0');
                        end;
                    delay(200);
                    clrscr;
                    WriteLn('¿Estas seguro de llevar?:');
                    WriteLn(ticketAmount, '  ', h );
                    WriteLn('En total seria: ',ticketAmount*ticketPrice, '$');
                    WriteLn('');
                    WriteLn('Presiona cualquier tecla para continuar');
                    readkey;
                    clrscr;
                    WriteLn('Debido a su ticket, podria utilizar viaje en metro o metrobus.');
                    ticketMetro := 10*ticketAmount;
                    ticketMBus := 20*ticketAmount;
                    WriteLn('Trendras disponible: ');
                    WriteLn(ticketMetro, ' viaje/s en metro');
                    WriteLn(ticketMBus, ' viaje/s en metrobus');
                    until (ticketAmount>0);
        end;
        'i':begin
                    repeat
                    clrscr;
                    textcolor(white);
                    writeln('-----------------------------------------------------------------------');
                    textcolor(LightGray);
                    writeln('Has selecionado ', i);
                    WriteLn('Puede seleccionar 3 opciones diferentes');
                    writeln('Opcion 1: 20 viajes -> 7$');
                    writeln('Opcion 2: 30 viajes -> 28$');
                    writeln('Opcion 3: 40 viajes -> 28$');
                    WriteLn('');
                    repeat
                    WriteLn('¿Que opcion desea elegir?');
                    write('Opcion: '); readln(ticketMTarjeta);
                    if (ticketMTarjeta<>1) or  (ticketMTarjeta<>2) or (ticketMTarjeta<>3) then
                        begin
                            Writeln('Debes seleccionar una opcion valida.');
                        end;                    
                    WriteLn('');
                    if (ticketMTarjeta=1) or  (ticketMTarjeta=2) or (ticketMTarjeta=3) then
                        begin
                            write('Llevare '); read(ticketAmount); Write(' ticket/s');
                        end;
                    if (ticketAmount < 0) then
                        begin
                            writeln('Debes colocar una cantidad mayor a 0');
                        end;
                    if (ticketMTarjeta = 1) then
                        begin
                            ticketPrice := 7;
                            delay(200);
                            clrscr;
                            writeln('Elegiste la opcion 1');
                            WriteLn('¿Estas seguro de llevar?:');
                            WriteLn(ticketAmount, '  ', i );
                            WriteLn('En total seria: ',ticketAmount*ticketPrice, '$');
                            WriteLn('');
                            WriteLn('Presiona cualquier tecla para continuar');
                            readkey;
                            clrscr;
                            WriteLn('Debido a su ticket, solo puede utilizar el metro.');
                            ticketMetro := 20*ticketAmount;
                            WriteLn('Trendras disponible ', ticketMetro, ' viaje/s');
                        end;
                    if (ticketMTarjeta = 2) then
                        begin
                            ticketPrice := 14;
                            delay(200);
                            clrscr;
                            writeln('Elegiste la opcion 2');
                            WriteLn('¿Estas seguro de llevar?:');
                            WriteLn(ticketAmount, '  ', i );
                            WriteLn('En total seria: ',ticketAmount*ticketPrice, '$');
                            WriteLn('');
                            WriteLn('Presiona cualquier tecla para continuar');
                            readkey;
                            clrscr;
                            WriteLn('Debido a su ticket, solo puede utilizar el metro.');
                            ticketMetro := 30*ticketAmount;
                            WriteLn('Trendras disponible ', ticketMetro, ' viaje/s');
                        end;  
                    if (ticketMTarjeta = 3) then
                        begin
                            ticketPrice := 28;
                            delay(200);
                            clrscr;
                            writeln('Elegiste la opcion 3');
                            WriteLn('¿Estas seguro de llevar?:');
                            WriteLn(ticketAmount, '  ', i );
                            WriteLn('En total seria: ',ticketAmount*ticketPrice, '$');
                            WriteLn('');
                            WriteLn('Presiona cualquier tecla para continuar');
                            readkey;
                            clrscr;
                            WriteLn('Debido a su ticket, solo puede utilizar el metro.');
                            ticketMetro := 40*ticketAmount;
                            WriteLn('Trendras disponible ', ticketMetro, ' viaje/s');
                        end;
                    if (ticketMTarjeta<>1) or  (ticketMTarjeta<>2) or (ticketMTarjeta<>3) then
                        begin
                            Writeln('Debes seleccionar una opcion valida.');
                        end;                                                                 
                    until (ticketAmount>0);
                    until (ticketMTarjeta >= 1) and (ticketMTarjeta <= 3);
        end;
        'j':begin
                    repeat
                    clrscr;
                    textcolor(white);
                    writeln('-----------------------------------------------------------------------');
                    textcolor(LightGray);
                    writeln('Has selecionado ', j);
                    WriteLn('Puede seleccionar 3 opciones diferentes');
                    writeln('Opcion 1: 20 viajes (metro y metrobus) -> 11$');
                    writeln('Opcion 2: 30 viajes (metro y metrobus) -> 22$');
                    writeln('Opcion 3: 40 viajes (metro y metrobus) -> 33$');
                    WriteLn('');
                    repeat
                    WriteLn('¿Que opcion desea elegir?');
                    write('Opcion: '); readln(ticketMTarjeta);
                    if (ticketMTarjeta<>1) or  (ticketMTarjeta<>2) or (ticketMTarjeta<>3) then
                        begin
                            Writeln('Debes seleccionar una opcion valida.');
                        end;                    
                    WriteLn('');
                    if (ticketMTarjeta=1) or  (ticketMTarjeta=2) or (ticketMTarjeta=3) then
                        begin
                            write('Llevare '); read(ticketAmount); Write(' ticket/s');
                        end;
                    if (ticketAmount < 0) then
                        begin
                            writeln('Debes colocar una cantidad mayor a 0');
                        end;
                    if (ticketMTarjeta = 1) then
                        begin
                            ticketPrice := 11;
                            delay(200);
                            clrscr;
                            writeln('Elegiste la opcion 1');
                            WriteLn('¿Estas seguro de llevar?:');
                            WriteLn(ticketAmount, '  ', j );
                            WriteLn('En total seria: ',ticketAmount*ticketPrice, '$');
                            WriteLn('');
                            WriteLn('Presiona cualquier tecla para continuar');
                            readkey;
                            clrscr;
                            WriteLn('Debido a su ticket, solo puede utilizar el metro.');
                            ticketMetro := 20*ticketAmount;
                            ticketMBus := 20*ticketAmount;
                            WriteLn('Trendras disponible ', ticketMetro, ' viaje/s');
                        end;
                    if (ticketMTarjeta = 2) then
                        begin
                            ticketPrice := 22;
                            delay(200);
                            clrscr;
                            writeln('Elegiste la opcion 2');
                            WriteLn('¿Estas seguro de llevar?:');
                            WriteLn(ticketMTarjeta, '  ', j );
                            WriteLn('En total seria: ',ticketAmount*ticketPrice, '$');
                            WriteLn('');
                            WriteLn('Presiona cualquier tecla para continuar');
                            readkey;
                            clrscr;
                            WriteLn('Debido a su ticket, solo puede utilizar el metro.');
                            ticketMetro := 30*ticketAmount;
                            ticketMBus := 30*ticketAmount;
                            WriteLn('Trendras disponible ', ticketMetro, ' viaje/s');
                        end;  
                    if (ticketMTarjeta = 3) then
                        begin
                            ticketPrice := 33;
                            delay(200);
                            clrscr;
                            writeln('Elegiste la opcion 3');
                            WriteLn('¿Estas seguro de llevar?:');
                            WriteLn(ticketAmount, '  ', j );
                            WriteLn('En total seria: ',ticketAmount*ticketPrice, '$');
                            WriteLn('');
                            WriteLn('Presiona cualquier tecla para continuar');
                            readkey;
                            clrscr;
                            WriteLn('Debido a su ticket, solo puede utilizar el metro.');
                            ticketMetro := 40*ticketAmount;
                            ticketMBus := 40*ticketAmount;
                            WriteLn('Trendras disponible: ');
                            WriteLn(ticketMetro, ' viaje/s en metro');
                            WriteLn(ticketMBus, ' viaje/s en metrobus');
                        end;                                 
                    until (ticketAmount>0);
                    until (ticketMTarjeta >= 1) and (ticketMTarjeta <= 3);
        end;                                                                         
    end;
// el case que se encuentra arriba, basicamente es selector de tickets, utilizado para saber que tickets se eligio, cuantos viajes/viajes tiene disponible
// cuanto es el monto a pagar, y en caso de MetroTarjeta/MetroTarjetaIntegrada tiene un if dentro de su seleccion para poder elegir una opcion correspondiente.
    textcolor(lightblue);
    Writeln('| Linea 1:');
    textcolor(white);
    WriteLn('______________________________________________________________________________________________________________     |');
    textcolor(LightBlue);
    Writeln('|- Propatria   |- Capitolio       |- Plaza Venezuela |- Miranda    |- Perez Bonalde |- La Hoyada  |- Sabana Grande |');
    WriteLn('|- Plaza sucre |- Parque Carabobo |- Chacaito        |- Gato negro |- Bellas artes  |- Chacao     |- La california |');
    Writeln('|- Agua salud  |- Colegio de Ing. |- Los Dos Caminos |- Petare     |- Cabo Amarillo |- Palo Verde |- Altamira      |');
    WriteLn('|- Los Cortijos                                                                                                    |');
    textcolor(lightred);
    Writeln('| Linea 2:');
    textcolor(white);
    WriteLn('______________________________________________________________________________________________________________     |');
    textcolor(lightred);
    writeln('|- El silencio |- La Paz          |- Capuchinos      |- Mamera     |- Caricuao      |- Antimano   |- La Yaguara    |');
    writeln('|- Maternidad  |- Carapita        |- Zoologico       |- Artiguas   |- Ruiz Pineda/Las Adjuntas                     |');
    textcolor(lightgreen);
    Writeln('| Linea 3:');
    textcolor(white);
    writeLn('______________________________________________________________________________________________________________     |');
    textcolor(lightgreen);
    WriteLn('|- Mercado     |- Los Jardines    |- Los Simbolos    |- El Valle   |- La Rinconada  |- Coche      |- La Bandera    |');
    WriteLn('|- Plaza Venezuela                |- Ciudad Universitaria                                                          |');
    Textcolor(lightcyan);
    Writeln('| Linea 4:');
    textcolor(white);
    WriteLn('______________________________________________________________________________________________________________     |');
    textcolor(lightcyan);
    WriteLn('|- Zona Rental |- Maternidad      |- Parque Central  |- Antimano   |- Capuchinos    |- La Yaragua |-Nuevo Circo    |');
    writeln('|- Artigas     |- Mamera          |- La Paz          |- Teatros    |- Carapita      |- Ruiz Pineda/Las Adjuntas    |');
    Textcolor(lightmagenta);
    Writeln('| Linea 5:');
    Textcolor(white);
    WriteLn('______________________________________________________________________________________________________________     |');
    Textcolor(lightmagenta);
    writeln('|- Bello Monte |- Warairarepano   |- Las Mercedes    |- El Marquez |- Bello Campo   |- Boleitas   |- Hugo Chavez   |');
    WriteLn('|- MonteCristo |- Parque Simon Bolivar                                                                             |');
    Textcolor(lightcyan);
    Writeln('| Linea 6:');
    Textcolor(white);
    WriteLn('______________________________________________________________________________________________________________     |');
    Textcolor(cyan);
    writeln('|- Zoologico   |- La Rinconada                                                                                     |');
    Textcolor(lightgray);
    Writeln('| Linea 7:');
    Textcolor(white);
    WriteLn('______________________________________________________________________________________________________________     |');
    Textcolor(lightgray);
    WriteLn('|- Las Flores  |- El Cristo       |- Roosevelt       |- Panteon     |- Roca Tarpeya  |- Socorro   |- La Bandera    |');
    writeln('|- INCES       |- La Hoyada       |- Los Ilustres    |- Presidente Medina                                          |');
    Textcolor(yellow);
    Writeln('| Linea 8:');
    Textcolor(white);
    WriteLn(' _____________________________________________________________________________________________________________     |');
    Textcolor(yellow);
    writeln('|- Petare 2    |- Warairarepano   |- 5 de Julio      |- 19 de Abril |- 24 de Julio                                 |');
    Textcolor(white);
    WriteLn('|_____________________________________________________________________________________________________________     |');

end.
