program MetroDeCaracas;
uses crt;
var
    simpleTicket: integer;
    isNumber, isTravel, isRepeat, isTicket, isLetter, isLobby, isSubestacion, isSameEstacion, isPassword: boolean;
    repeatTravel,  repeatTicket, iNumber, iCedula, iLetter: integer;
    ticketAmount, ticketPrice, travelType, ticketMetro, ticketMBus, ticketMTarjeta, masEstacion, metroLinea, totalAmount, dineroCliente, devolucionCliente, opcionViaje, travelMetro: integer;
    password, readPassword, verificarCedula: string;
    travel,  nombre, apellido, cedula, cedulaSinPuntos, metroEstacion, estacionPartida, estacionLlegada, procesarPago, useTicket: string;
    ticketType: char;   
Const
    passAdmin = 1234;
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
    writeln (' Escriba abajo la opcion que desee');
    WriteLn('');
    WriteLn('Si ---------------------------- No');
    readln(travel);
    isNumber := false;
    travel := lowerCase(travel);
    // Se utiliza un repeat y un if para comprobar que se seleccione una opcion valida entre si y no para poder avanzar o simplemente despedirnos del cliente.
    if (travel <> 'si') and (travel <> 'no') then
    begin
        WriteLn('Debes selecionar una opcion valida');
        Writeln('Presiona cualquier tecla para volver a ingresar tus datos');
        readkey;
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
            Writeln ('Por favor rellene los datos solicitados');
            writeln('A continuacion ingrese su nombre');
            write('Nombre: ');
            readln(nombre);
            writeln('');
            writeln('Ingrese su apellido');
            write('Apellido: ');
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
            writeln('Para continuar con la operacion deberas recordar tu contrasena especial');
            writeln('Esta contrasena seran los primeros 4 digitos de tu cedula, por favor recuerdela.');
            password := Copy(cedula, 1, 4);
            WriteLn('Tu contrasena especial es: ', password);
            writeln('');
            isRepeat := true;
//este repeat lo que hace es que se tenga que repetir el proceso hasta que se evalue el isTravel correctamente, osea hasta que presionen
// 2 o 1 para poder o modificar los datos o continuar sencillamente. Si colocas cualquier otro numero que no sea ni 1 ni 2, entonces se repetira
// que se ha ingresado un valor invalido y que debe presionar 1 para modificar los datos o 2 para continuar.            
            repeat
            writeln('Presiona 1, si deseas modificar tus datos');
            writeln('Presiona 2, para continuar a la lista de tickets');
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
    writeln ('    | c) Ida y vuelta  | 2 viajes en metro           | 12$');
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
    WriteLn('Nota: el tipo de ticket, aparece al lado del nombre, ejemplo a) Simple');
    WriteLn('');
    WriteLn('Presiona 1 si quiere comprar su boleto/s ');
    WriteLn('Presiona 2 si desea volver a ver la lista de boletos');
    WriteLn('');
    readln(repeatTicket);
    if (repeatTicket=1) then
            begin
            isTicket := true;
            WriteLn('¿Que ticket desea comprar?');
            Writeln('Para visualizar nuevamente las opciones presione 0');
            Write('Tipo: ');
            read(ticketType);
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
                    totalAmount := ticketAmount*ticketPrice;
                    WriteLn('En total seria: ',totalAmount, '$');
                    WriteLn('');
                    writeln('Por favor presiona cualquier tecla para continuar');
                    readkey;
                    clrscr;
                    WriteLn('Debido a su ticket, solo puede utilizar el metro.');
                    ticketMetro := ticketAmount;
                    WriteLn('Trendras disponible ', ticketMetro, ' viaje/s');
                    WriteLn('');
                    writeln('Por favor presiona cualquier tecla para continuar');
                    readkey;                      
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
                    totalAmount := ticketAmount*ticketPrice;
                    WriteLn('En total seria: ',totalAmount, '$');
                    WriteLn('');
                    writeln('Por favor presiona cualquier tecla para continuar');
                    readkey;
                    clrscr;
                    WriteLn('Debido a su ticket, podria utilizar viaje en metro o metrobus.');
                    ticketMetro := ticketAmount;
                    ticketMBus := ticketAmount;
                    WriteLn('Trendras disponible: ');
                    WriteLn(ticketMetro, ' viaje/s en metro');
                    WriteLn(ticketMBus, ' viaje/s en metrobus');
                    WriteLn('');
                    writeln('Por favor presiona cualquier tecla para continuar');
                    readkey;                      
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
                    totalAmount := ticketAmount*ticketPrice;
                    WriteLn('En total seria: ',totalAmount, '$');
                    WriteLn('');
                    writeln('Por favor presiona cualquier tecla para continuar');
                    readkey;
                    clrscr;
                    WriteLn('Debido a su ticket, solo puede utilizar el metro.');
                    ticketMetro := 2*ticketAmount;
                    WriteLn('Trendras disponible ', ticketMetro, ' viaje/s');
                    writeln('');
                    writeln('Por favor presiona cualquier tecla para continuar');
                    readkey;                      
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
                    totalAmount := ticketAmount*ticketPrice;
                    WriteLn('En total seria: ',totalAmount, '$');
                    WriteLn('');
                    writeln('Por favor presiona cualquier tecla para continuar');
                    readkey;
                    clrscr;
                    WriteLn('Debido a su ticket, podria utilizar viaje en metro o metrobus.');
                    ticketMetro := 2*ticketAmount;
                    ticketMBus := 2*ticketAmount;
                    WriteLn('Trendras disponible: ');
                    WriteLn(ticketMetro, ' viaje/s en metro');
                    WriteLn(ticketMBus, ' viaje/s en metrobus');
                    writeln('');
                    writeln('Por favor presiona cualquier tecla para continuar');
                    readkey;                      
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
                    totalAmount := ticketAmount*ticketPrice;
                    WriteLn('En total seria: ',totalAmount, '$');
                    WriteLn('');
                    writeln('Por favor presiona cualquier tecla para continuar');
                    readkey;
                    clrscr;
                    WriteLn('Debido a su ticket, solo puede utilizar el metro.');
                    ticketMetro := 10*ticketAmount;
                    WriteLn('Trendras disponible ', ticketMetro, ' viaje/s');
                    writeln('');
                    writeln('Por favor presiona cualquier tecla para continuar');
                    readkey;                      
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
                    totalAmount := ticketAmount*ticketPrice;
                    WriteLn('En total seria: ',totalAmount, '$');
                    WriteLn('');
                    writeln('Por favor presiona cualquier tecla para continuar');
                    readkey;
                    clrscr;
                    WriteLn('Debido a su ticket, podria utilizar viaje en metro o metrobus.');
                    ticketMetro := 10*ticketAmount;
                    ticketMBus := 10*ticketAmount;
                    WriteLn('Trendras disponible: ');
                    WriteLn(ticketMetro, ' viaje/s en metro');
                    WriteLn(ticketMBus, ' viaje/s en metrobus');
                    writeln('');
                    writeln('Por favor presiona cualquier tecla para continuar');
                    readkey;                      
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
                    totalAmount := ticketAmount*ticketPrice;
                    WriteLn('En total seria: ',totalAmount, '$');
                    WriteLn('');
                    writeln('Por favor presiona cualquier tecla para continuar');
                    readkey;
                    clrscr;
                    WriteLn('Debido a su ticket, solo puede utilizar el metro.');
                    ticketMetro := 10*ticketAmount;
                    WriteLn('Trendras disponible ', ticketMetro, ' viaje/s');
                    writeln('');
                    WriteLn('Por favor presiona cualquier tecla para continuar');
                    readkey;                      
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
                    totalAmount := ticketAmount*ticketPrice;
                    WriteLn('En total seria: ',totalAmount, '$');
                    WriteLn('');
                    writeln('Por favor presiona cualquier tecla para continuar');
                    readkey;
                    clrscr;
                    WriteLn('Debido a su ticket, podria utilizar viaje en metro o metrobus.');
                    ticketMetro := 10*ticketAmount;
                    ticketMBus := 20*ticketAmount;
                    WriteLn('Trendras disponible: ');
                    WriteLn(ticketMetro, ' viaje/s en metro');
                    WriteLn(ticketMBus, ' viaje/s en metrobus');
                    writeln('');
                    WriteLn('Por favor presiona cualquier tecla para continuar');
                    readkey;                      
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
                            totalAmount := ticketAmount*ticketPrice;
                            WriteLn('En total seria: ',totalAmount, '$');
                            WriteLn('');
                            writeln('Por favor presiona cualquier tecla para continuar');
                            readkey;
                            clrscr;
                            WriteLn('Debido a su ticket, solo puede utilizar el metro.');
                            ticketMetro := 20*ticketAmount;
                            WriteLn('Trendras disponible ', ticketMetro, ' viaje/s');
                            WriteLn('');
                            WriteLn('Por favor presiona cualquier tecla para continuar');
                            readkey;                              
                        end;
                    if (ticketMTarjeta = 2) then
                        begin
                            ticketPrice := 14;
                            delay(200);
                            clrscr;
                            writeln('Elegiste la opcion 2');
                            WriteLn('¿Estas seguro de llevar?:');
                            WriteLn(ticketAmount, '  ', i );
                            totalAmount := ticketAmount*ticketPrice;
                            WriteLn('En total seria: ',totalAmount, '$');
                            WriteLn('');
                            WriteLn('Presiona cualquier tecla para continuar');
                            readkey;
                            clrscr;
                            WriteLn('Debido a su ticket, solo puede utilizar el metro.');
                            ticketMetro := 30*ticketAmount;
                            WriteLn('Trendras disponible ', ticketMetro, ' viaje/s');
                            writeln('');
                            WriteLn('Por favor presiona cualquier tecla para continuar');
                            readkey;                              
                        end;  
                    if (ticketMTarjeta = 3) then
                        begin
                            ticketPrice := 28;
                            delay(200);
                            clrscr;
                            writeln('Elegiste la opcion 3');
                            WriteLn('¿Estas seguro de llevar?:');
                            WriteLn(ticketAmount, '  ', i );
                            totalAmount := ticketAmount*ticketPrice;
                            WriteLn('En total seria: ',totalAmount, '$');
                            WriteLn('');
                            WriteLn('Presiona cualquier tecla para continuar');
                            readkey;
                            clrscr;
                            WriteLn('Debido a su ticket, solo puede utilizar el metro.');
                            ticketMetro := 40*ticketAmount;
                            WriteLn('Trendras disponible ', ticketMetro, ' viaje/s');
                            writeln('');
                            WriteLn('Por favor presiona cualquier tecla para continuar');
                            readkey;                          
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
                    writeln('-----------------------------------------------------------------------');
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
                            totalAmount := ticketAmount*ticketPrice;
                            WriteLn('En total seria: ',totalAmount, '$');
                            WriteLn('');
                            WriteLn('Presiona cualquier tecla para continuar');
                            readkey;
                            clrscr;
                            WriteLn('Debido a su ticket, solo puede utilizar el metro.');
                            ticketMetro := 20*ticketAmount;
                            ticketMBus := 20*ticketAmount;
                            WriteLn('Trendras disponible ', ticketMetro, ' viaje/s');
                            WriteLn('Por favor presiona cualquier tecla para continuar');
                            readkey;                          
                        end;
                    if (ticketMTarjeta = 2) then
                        begin
                            ticketPrice := 22;
                            delay(200);
                            clrscr;
                            writeln('Elegiste la opcion 2');
                            WriteLn('¿Estas seguro de llevar?:');
                            WriteLn(ticketMTarjeta, '  ', j );
                            totalAmount := ticketAmount*ticketPrice;
                            WriteLn('En total seria: ',totalAmount, '$');
                            WriteLn('');
                            WriteLn('Presiona cualquier tecla para continuar');
                            readkey;
                            clrscr;
                            WriteLn('Debido a su ticket, solo puede utilizar el metro.');
                            ticketMetro := 30*ticketAmount;
                            ticketMBus := 30*ticketAmount;
                            WriteLn('Trendras disponible ', ticketMetro, ' viaje/s');
                            WriteLn('Por favor presiona cualquier tecla para continuar');
                            readkey;                              
                        end;  
                    if (ticketMTarjeta = 3) then
                        begin
                            ticketPrice := 33;
                            delay(200);
                            clrscr;
                            writeln('Elegiste la opcion 3');
                            WriteLn('¿Estas seguro de llevar?:');
                            WriteLn(ticketAmount, '  ', j );
                            totalAmount := ticketAmount*ticketPrice;
                            WriteLn('En total seria: ',totalAmount, '$');
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
                            WriteLn('Por favor presiona cualquier tecla para continuar');
                            readkey;                            
                        end;                                 
                    until (ticketAmount>0);
                    until (ticketMTarjeta >= 1) and (ticketMTarjeta <= 3);
        end;                                                                         
    end;
// el case que se encuentra arriba, basicamente es selector de tickets, utilizado para saber que tickets se eligio, cuantos viajes/viajes tiene disponible
// cuanto es el monto a pagar, y en caso de MetroTarjeta/MetroTarjetaIntegrada tiene un if dentro de su seleccion para poder elegir una opcion correspondiente.
repeat 
    clrscr;
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
    textcolor(white);
    WriteLn('______________________________________________________________________________________________________________     |');;
    WriteLn('');
    writeln('Para ver las demas estaciones, presiona 1');
    writeln('Para seleccionar una de las estaciones ya vista, presiona 2');
    readln(masEstacion);
    if (masEstacion<> 1) and (masEstacion <> 2) then
        begin
            WriteLn('Debes presionar una opcion valida ')
        end;
    until (masEstacion>=1) and (masEstacion<=2);
    if (masEstacion=1) then
    begin
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
    end;
	writeln('');
    repeat
    WriteLn('Selecciona la linea que quieres usar.');
    Write('Linea: '); read(metroLinea);
    if (metroLinea<>1) and (metroLinea<>2) and (metroLinea<>3) and (metroLinea<>4) and (metroLinea<>5) and (metroLinea<>6) and (metroLinea<>7) and (metroLinea<>8) then
        begin
            WriteLn('Debes seleecionar una linea valida (1-8)');
        end;
    until(metroLinea=1) or (metroLinea=2) or (metroLinea=3) or (metroLinea=4) or (metroLinea=5) or (metroLinea=6) or (metroLinea=7) or (metroLinea=8); 
    clrscr;
    isSubestacion := true;
    case metroLinea of
        1:begin
            repeat
            clrscr;
            textcolor(lightblue);
            Writeln('| Linea 1:');
            textcolor(white);
            WriteLn('______________________________________________________________________________________________________________     |');
            textcolor(LightBlue);
            Writeln('|- Propatria   |- Capitolio       |- Plaza Venezuela |- Miranda    |- Perez Bonalde |- La Hoyada  |- Sabana Grande |');
            WriteLn('|- Plaza sucre |- Parque Carabobo |- Chacaito        |- Gato negro |- Bellas artes  |- Chacao     |- La california |');
            Writeln('|- Agua salud  |- Colegio de Ing  |- Los Dos Caminos |- Petare     |- Cabo Amarillo |- Palo Verde |- Altamira       |');
            WriteLn('|- Los Cortijos                                                                                                    |');
            textcolor(white);
            WriteLn('______________________________________________________________________________________________________________     |');
            writeln('');
            write('Escribe el nombre tu subestacion de partida: '); 
            ReadLn(estacionPartida);
            estacionPartida := lowercase(estacionPartida);
            
            if (estacionPartida <> 'propatria') and (estacionPartida <> 'plaza sucre') and (estacionPartida <> 'agua salud') and (estacionPartida <> 'los cortijos') and (estacionPartida <> 'capitolio')
            and (estacionPartida <> 'parque carabobo') and (estacionPartida <> 'colegio de ing') and (estacionPartida <> 'plaza venezuela') and (estacionPartida <> 'chacaito') and (estacionPartida <> 'los dos caminos')
            and (estacionPartida <> 'miranda') and (estacionPartida <> 'gato negro') and (estacionPartida <> 'petare') and (estacionPartida <> 'perez bonalde') and (estacionPartida <> 'bellas artes')
            and (estacionPartida <> 'cabo amarillo') and (estacionPartida <> 'la hoyada') and (estacionPartida <> 'chacao') and (estacionPartida <> 'palo verde') and (estacionPartida <> 'sabana grande')
            and (estacionPartida <> 'la california')  and (estacionPartida <> 'altamira') then
                begin
                    WriteLn('Debes escribir el nombre de una subestacion valida (valida)');
                    isSubestacion := false;
                    delay(1500);
                end
            else if (estacionPartida = 'propatria') or (estacionPartida = 'plaza sucre') or (estacionPartida = 'agua salud') or (estacionPartida  = 'los cortijos') or (estacionPartida = 'capitolio')
            or (estacionPartida = 'parque carabobo') or (estacionPartida = 'colegio de ing') or (estacionPartida = 'plaza venezuela') or (estacionPartida = 'chacaito') or (estacionPartida = 'los dos caminos')
            or (estacionPartida = 'miranda') or (estacionPartida = 'gato negro') or (estacionPartida = 'petare') or (estacionPartida = 'perez bonalde') or (estacionPartida = 'bellas artes')
            or (estacionPartida = 'cabo amarillo') or (estacionPartida = 'la hoyada') or (estacionPartida = 'chacao') or (estacionPartida = 'palo verde') or (estacionPartida = 'sabana grande')
            or (estacionPartida = 'la california')  or (estacionPartida = 'altamira') then
                begin
                    writeln('Informacion procesada');
                    isSubestacion := true;
                    repeat    
                    isSameEstacion := true;    
                    WriteLn('');
                    WriteLn('¿A que subestacion deseas ir?');
                    write('Deseo ir a la subestacion: ');
                    ReadLn(estacionLlegada);
                    estacionLlegada := lowercase(estacionLlegada);
                    if (estacionPartida = estacionLlegada) then
                        begin
                        WriteLn('Debes escribir una subestacion diferente a la de partida');
                        isSameEstacion := false;           
                        end;
                    if (estacionllegada <> 'propatria') and (estacionLlegada <> 'plaza sucre') and (estacionLlegada <> 'agua salud') and (estacionLlegada <> 'los cortijos') and (estacionLlegada <> 'capitolio')
                    and (estacionLlegada <> 'parque carabobo') and (estacionLlegada <> 'colegio de ing') and (estacionLlegada <> 'plaza venezuela') and (estacionLlegada <> 'chacaito') and (estacionLlegada <> 'los dos caminos')
                    and (estacionLlegada <> 'miranda') and (estacionLlegada <> 'gato negro') and (estacionLlegada <> 'petare') and (estacionLlegada <> 'perez bonalde') and (estacionLlegada <> 'bellas artes')
                    and (estacionLlegada <> 'cabo amarillo') and (estacionLlegada <> 'la hoyada') and (estacionLlegada <> 'chacao') and (estacionLlegada <> 'palo verde') and (estacionLlegada <> 'sabana grande')
                    and (estacionLlegada <> 'la california')  and (estacionLlegada <> 'altamira') then
                        begin
                        WriteLn('Debes escribir el nombre de una subestacion (valida)');
                        isSubestacion := false;
                        delay(1500);
                        end
                    else if (estacionLlegada = 'propatria') or (estacionLlegada = 'plaza sucre') or (estacionLlegada = 'agua salud') or (estacionLlegada = 'los cortijos') or (estacionLlegada = 'capitolio')
                    or (estacionLlegada= 'parque carabobo') or (estacionLlegada= 'colegio de ing') or (estacionLlegada = 'plaza venezuela') or (estacionLlegada = 'chacaito') or (estacionLlegada = 'los dos caminos')
                    or (estacionLlegada = 'miranda') or (estacionLlegada = 'gato negro') or (estacionLlegada = 'petare') or (estacionLlegada= 'perez bonalde') or (estacionLlegada = 'bellas artes')
                    or (estacionLlegada = 'cabo amarillo') or (estacionLlegada = 'la hoyada') or (estacionLlegada = 'chacao') or (estacionLlegada = 'palo verde') or (estacionLlegada = 'sabana grande')
                    or (estacionLlegada = 'la california')  or (estacionLlegada = 'altamira') then
                        begin
                        writeln('');
                        writeln('Informacion procesada');
                        isSubestacion := true;
                        writeln('');
                        writeln('Por favor presiona cualquier tecla para continuar');
                        readkey;
                        end;    
                    until isSameEstacion;
                end;                
            until  isSubestacion;    
        end;
        2:begin
            repeat
            clrscr;
            textcolor(lightred);
            Writeln('| Linea 2:');
            textcolor(white);
            WriteLn('______________________________________________________________________________________________________________     |');
            textcolor(Lightred);
            writeln('|- El silencio |- La Paz          |- Capuchinos      |- Mamera     |- Caricuao      |- Antimano   |- La Yaguara    |');
            writeln('|- Maternidad  |- Carapita        |- Zoologico       |- Artiguas   |- Ruiz Pineda/Las Adjuntas                     |');
            textcolor(white);
            WriteLn('______________________________________________________________________________________________________________     |');
            writeln('');
            write('Escribe el nombre tu subestacion de partida: '); 
            ReadLn(estacionPartida);
            estacionPartida := lowercase(estacionPartida);
            
            if (estacionPartida <> 'el silencio') and (estacionPartida <> 'la paz') and (estacionPartida <> 'capuchinos') and (estacionPartida <> 'mamera') and (estacionPartida <> 'caricuao')
            and (estacionPartida <> 'antimano') and (estacionPartida <> 'la yaguara') and (estacionPartida <> 'maternidad') and (estacionPartida <> 'carapita') and (estacionPartida <> 'zoologico')
            and (estacionPartida <> 'artiguas') and (estacionPartida <> 'ruiz pineda') and (estacionPartida <> 'las adjuntas') and (estacionPartida<>'ruiz pineda/las adjuntas') then
                begin
                    WriteLn('Debes escribir el nombre de una subestacion valida (valida)');
                    isSubestacion := false;
                    delay(1500);
                end
            else if (estacionPartida = 'el silencio') or (estacionPartida = 'la paz') or (estacionPartida = 'capuchinos') or (estacionPartida  = 'mamera') or (estacionPartida = 'caricuao')
            or (estacionPartida = 'antimano') or (estacionPartida = 'la yaguara') or (estacionPartida = 'maternidad') or (estacionPartida = 'carapita') or (estacionPartida = 'zoologico')
            or (estacionPartida = 'miranda') or (estacionPartida = 'gato negro') or (estacionPartida = 'petare') or (estacionPartida = 'perez bonalde') or (estacionPartida = 'bellas artes')
            or (estacionPartida = 'artiguas') or (estacionPartida = 'ruiz pineda') or (estacionPartida = 'las adjuntas') or (estacionPartida = 'ruiz pineda/las adjuntas') then
                begin
                    writeln('Informacion procesada');
                    isSubestacion := true;
                    repeat    
                    isSameEstacion := true;    
                    WriteLn('');
                    WriteLn('¿A que subestacion deseas ir?');
                    write('Deseo ir a la subestacion: ');
                    ReadLn(estacionLlegada);
                    estacionLlegada := lowercase(estacionLlegada);
                    if (estacionPartida = estacionLlegada) then
                        begin
                        WriteLn('Debes escribir el nombre de una subestacion diferente a la de partida');
                        isSameEstacion := false;           
                        end;
                    if (estacionLlegada <> 'el silencio') and (estacionLlegada <> 'la paz') and (estacionLlegada <> 'capuchinos') and (estacionLlegada <> 'mamera') and (estacionLlegada <> 'caricuao')
                    and (estacionLlegada <> 'antimano') and (estacionLlegada <> 'la yaguara') and (estacionLlegada <> 'maternidad') and (estacionLlegada <> 'carapita') and (estacionLlegada <> 'zoologico')
                    and (estacionLlegada <> 'artiguas') and (estacionLlegada<> 'ruiz pineda') and (estacionLlegada <> 'las adjuntas') and (estacionLlegada='ruiz pineda/las adjunta') then
                        begin
                        WriteLn('Debes escribir el nombre de una subestacion valida (valida)');
                        isSubestacion := false;
                        delay(1500);
                        end
                    else if (estacionLlegada = 'el silencio') or (estacionLlegada = 'la paz') or (estacionLlegada = 'capuchinos') or (estacionLlegada  = 'mamera') or (estacionLlegada = 'caricuao')
                    or (estacionLlegada = 'antimano') or (estacionLlegada = 'la yaguara') or (estacionLlegada = 'maternidad') or (estacionLlegada = 'carapita') or (estacionLlegada = 'zoologico')
                    or (estacionLlegada = 'miranda') or (estacionLlegada = 'gato negro') or (estacionLlegada = 'petare') or (estacionLlegada = 'perez bonalde') or (estacionLlegada = 'bellas artes')
                    or (estacionLlegada = 'artiguas') or (estacionLlegada = 'ruiz pineda') or (estacionLlegada= 'las adjuntas') or (estacionLlegada = 'ruiz pineda/las adjuntas') then
                        begin
                        writeln('');
                        writeln('Informacion procesada');
                        isSubestacion := true;
                        writeln('');
                        writeln('Por favor presiona cualquier tecla para continuar');
                        readkey;
                        end;    
                    until isSameEstacion;
                end;                
            until  isSubestacion;    
        end;
        3:begin
            repeat
            clrscr;
            textcolor(lightgreen);
            Writeln('| Linea 3:');
            textcolor(white);
            WriteLn('______________________________________________________________________________________________________________     |');
            textcolor(Lightgreen);
            WriteLn('|- Mercado     |- Los Jardines    |- Los Simbolos    |- El Valle   |- La Rinconada  |- Coche      |- La Bandera    |');
            WriteLn('|- Plaza Venezuela                |- Ciudad Universitaria                                                          |');
            textcolor(white);
            WriteLn('______________________________________________________________________________________________________________     |');
            writeln('');
            write('Escribe el nombre tu subestacion de partida: '); 
            ReadLn(estacionPartida);
            estacionPartida := lowercase(estacionPartida);
            
            if (estacionPartida <> 'mercado') and (estacionPartida <> 'los jardines') and (estacionPartida <> 'los simbolos') and (estacionPartida <> 'el valle') and (estacionPartida <> 'la rinconada')
            and (estacionPartida <> 'coche') and (estacionPartida <> 'la bandera') and (estacionPartida <> 'plaza venezuela') and (estacionPartida <> 'ciudad universitaria') then
                begin
                    WriteLn('Debes escribir el nombre de una subestacion valida (valida)');
                    isSubestacion := false;
                    delay(1500);
                end
            else if (estacionPartida = 'mercado') or (estacionPartida = 'los jardines') or (estacionPartida = 'los simbolos') or (estacionPartida  = 'el valle') or (estacionPartida = 'la rinconada')
            or (estacionPartida = 'coche') or (estacionPartida = 'la bandera') or (estacionPartida = 'plaza venezuela') or (estacionPartida = 'ciudad universitaria') then
                begin
                    writeln('Informacion procesada');
                    isSubestacion := true;
                    repeat    
                    isSameEstacion := true;    
                    WriteLn('');
                    WriteLn('¿A que subestacion deseas ir?');
                    write('Deseo ir a la subestacion: ');
                    ReadLn(estacionLlegada);
                    estacionLlegada := lowercase(estacionLlegada);
                    if (estacionPartida = estacionLlegada) then
                        begin
                        WriteLn('Debes escribir el nombre de una subestacion diferente a la de partida');
                        isSameEstacion := false;           
                        end;
                    if (estacionLlegada <> 'mercado') and (estacionLlegada <> 'los jardines') and (estacionLlegada <> 'los simbolos') and (estacionLlegada <> 'el valle') and (estacionLlegada <> 'la rinconada')
                    and (estacionLlegada <> 'coche') and (estacionLlegada <> 'la bandera') and (estacionLlegada <> 'plaza venezuela') and (estacionLlegada <> 'ciudad universitaria') then
                        begin
                        WriteLn('Debes escribir el nombre de una subestacion valida (valida)');
                        isSubestacion := false;
                        delay(1500);
                        end
                    else if (estacionLlegada = 'mercado') or (estacionLlegada = 'los jardines') or (estacionLlegada = 'los simbolos') or (estacionLlegada  = 'el valle') or (estacionLlegada = 'la rinconada')
                    or (estacionLlegada = 'coche') or (estacionLlegada = 'la bandera') or (estacionLlegada = 'plaza venezuela') or (estacionLlegada = 'ciudad universitaria') then
                        begin
                        writeln('');
                        writeln('Informacion procesada');
                        isSubestacion := true;
                        writeln('');
                        writeln('Por favor presiona cualquier tecla para continuar');
                        readkey;
                        end;    
                    until isSameEstacion;
                end;                
            until  isSubestacion;    
        end;
        4:begin
            repeat
            clrscr;
            textcolor(lightcyan);
            Writeln('| Linea 4:');
            textcolor(white);
            WriteLn('______________________________________________________________________________________________________________     |');
            textcolor(Lightcyan);
            WriteLn('|- Zona Rental |- Maternidad      |- Parque Central  |- Antimano   |- Capuchinos    |- La Yaragua |- Nuevo Circo   |');
            writeln('|- Artigas     |- Mamera          |- La Paz          |- Teatros    |- Carapita      |- Ruiz Pineda/Las Adjuntas    |');
            textcolor(white);
            WriteLn('______________________________________________________________________________________________________________     |');
            writeln('');
            write('Escribe el nombre tu subestacion de partida: '); 
            ReadLn(estacionPartida);
            estacionPartida := lowercase(estacionPartida);
            
            if (estacionPartida <> 'zona rental') and (estacionPartida <> 'maternidad') and (estacionPartida <> 'parque central') and (estacionPartida <> 'antimano') and (estacionPartida <> 'capuchinos')
            and (estacionPartida <> 'la yaragua') and (estacionPartida <> 'nuevo circo') and (estacionPartida <> 'artigas') and (estacionPartida <> 'mamera') and (estacionPartida <> 'la paz') and (estacionPartida <> 'teatros') 
            and (estacionPartida <> 'carapita') and (estacionPartida <> 'ruiz pineda') and (estacionPartida <> 'las adjuntas') and (estacionPartida<>'ruiz pineda/las adjuntas')  then
                begin
                    WriteLn('Debes escribir el nombre de una subestacion valida (valida)');
                    isSubestacion := false;
                    delay(1500);
                end
            else if (estacionPartida = 'zona rental') or (estacionPartida = 'maternidad') or (estacionPartida = 'parque central') or (estacionPartida  = 'antimano') or (estacionPartida = 'capuchinos')
            or (estacionPartida = 'la yaragua') or (estacionPartida = 'nuevo circo') or (estacionPartida = 'artigas') or (estacionPartida = 'mamera') or (estacionPartida = 'la paz') or (estacionPartida = 'teatros')
            or (estacionPartida = 'ruiz pineda') or (estacionPartida = 'las adjuntas') or (estacionPartida = 'ruiz pineda/las adjuntas') or (estacionPartida = 'carapita') then
                begin
                    writeln('Informacion procesada');
                    isSubestacion := true;
                    repeat    
                    isSameEstacion := true;    
                    WriteLn('');
                    WriteLn('¿A que subestacion deseas ir?');
                    write('Deseo ir a la subestacion: ');
                    ReadLn(estacionLlegada);
                    estacionLlegada := lowercase(estacionLlegada);
                    if (estacionPartida = estacionLlegada) then
                        begin
                        WriteLn('Debes escribir el nombre de una subestacion diferente a la de partida');
                        isSameEstacion := false;           
                        end;
                    if (estacionLlegada <> 'zona rental') and (estacionLlegada <> 'maternidad') and (estacionLlegada <> 'parque central') and (estacionLlegada <> 'antimano') and (estacionLlegada <> 'capuchinos')
                    and (estacionLlegada <> 'la yaragua') and (estacionLlegada <> 'nuevo circo') and (estacionLlegada <> 'artigas') and (estacionLlegada <> 'mamera') and (estacionLlegada <> 'la paz')
                    and (estacionLlegada <> 'teatros') and (estacionLlegada <> 'carapita') and (estacionLlegada<> 'ruiz pineda') and (estacionLlegada <> 'las adjuntas') and (estacionLlegada='ruiz pineda/las adjunta')  then
                        begin
                        WriteLn('Debes escribir el nombre de una subestacion valida (valida)');
                        isSubestacion := false;
                        delay(1500);
                        end
                    else if (estacionLlegada = 'zona rental') or (estacionLlegada = 'maternidad') or (estacionLlegada = 'parque central') or (estacionLlegada  = 'antimano') or (estacionLlegada = 'capuchinos')
                    or (estacionLlegada = 'la yaragua') or (estacionLlegada = 'nuevo circo') or (estacionLlegada = 'artigas') or (estacionLlegada = 'mamera') or (estacionLlegada = 'la paz')
                    or (estacionLlegada = 'teatros') or (estacionLlegada = 'carapita') or (estacionLlegada = 'ruiz pineda') or (estacionLlegada= 'las adjuntas') or (estacionLlegada = 'ruiz pineda/las adjuntas') then
                        begin
                        writeln('');
                        writeln('Informacion procesada');
                        isSubestacion := true;
                        writeln('');
                        writeln('Por favor presiona cualquier tecla para continuar');
                        readkey;
                        end;    
                    until isSameEstacion;
                end;                
            until  isSubestacion;    
        end;
        5:begin
            repeat
            clrscr;
            textcolor(lightmagenta);
            Writeln('| Linea 5:');
            textcolor(white);
            WriteLn('______________________________________________________________________________________________________________     |');
            textcolor(Lightmagenta);
            writeln('|- Bello Monte |- Warairarepano   |- Las Mercedes    |- El Marquez |- Bello Campo   |- Boleitas   |- Hugo Chavez   |');
            WriteLn('|- MonteCristo |- Parque Simon Bolivar                                                                             |');
            textcolor(white);
            WriteLn('______________________________________________________________________________________________________________     |');
            writeln('');
            write('Escribe el nombre tu subestacion de partida: '); 
            ReadLn(estacionPartida);
            estacionPartida := lowercase(estacionPartida);
            
            if (estacionPartida <> 'bello monte') and (estacionPartida <> 'warairarepano') and (estacionPartida <> 'las mercedes') and (estacionPartida <> 'el marquez') and (estacionPartida <> 'bello campo')
            and (estacionPartida <> 'boleitas') and (estacionPartida <> 'hugo chavez') and (estacionPartida <> 'MonteCristo') and (estacionPartida <> 'Parque Simon Bolivar') then
                begin
                    WriteLn('Debes escribir el nombre de una subestacion valida (valida)');
                    isSubestacion := false;
                    delay(1500);
                end
            else if (estacionPartida = 'bello monte') or (estacionPartida = 'warairarepano') or (estacionPartida = 'las mercedes') or (estacionPartida  = 'el marquez') or (estacionPartida = 'bello campo')
            or (estacionPartida = 'boleitas') or (estacionPartida = 'hugo chavez') or (estacionPartida = 'montecristo') or (estacionPartida = 'parque simon bolivar') then
                begin
                    writeln('Informacion procesada');
                    isSubestacion := true;
                    repeat    
                    isSameEstacion := true;    
                    WriteLn('');
                    WriteLn('¿A que subestacion deseas ir?');
                    write('Deseo ir a la subestacion: ');
                    ReadLn(estacionLlegada);
                    estacionLlegada := lowercase(estacionLlegada);
                    if (estacionPartida = estacionLlegada) then
                        begin
                        WriteLn('Debes escribir el nombre de una subestacion diferente a la de partida');
                        isSameEstacion := false;           
                        end;
                    if (estacionLlegada <> 'bello monte') and (estacionLlegada <> 'warairarepano') and (estacionLlegada <> 'las mercedes') and (estacionLlegada <> 'el marquez') and (estacionLlegada <> 'bello campo')
                    and (estacionLlegada <> 'boleitas') and (estacionLlegada <> 'hugo chavez') and (estacionLlegada <> 'montecristo') and (estacionLlegada <> 'parque simon bolivar')  then
                        begin
                        WriteLn('Debes escribir el nombre de una subestacion valida (valida)');
                        isSubestacion := false;
                        delay(1500);
                        end
                    else if (estacionLlegada = 'bello monte') or (estacionLlegada = 'warairarepano') or (estacionLlegada = 'las mercedes') or (estacionLlegada  = 'el marquez') or (estacionLlegada = 'bello campo')
                    or (estacionLlegada = 'boleitas') or (estacionLlegada = 'hugo chavez') or (estacionLlegada = 'montecristo') or (estacionLlegada = 'parque simon bolivar') then
                        begin
                        writeln('');
                        writeln('Informacion procesada');
                        isSubestacion := true;
                        writeln('');
                        writeln('Por favor presiona cualquier tecla para continuar');
                        readkey;
                        end;    
                    until isSameEstacion;
                end;                
            until  isSubestacion;    
        end;
        6:begin
            repeat
            clrscr;
            textcolor(lightmagenta);
            Writeln('| Linea 5:');
            textcolor(white);
            WriteLn('______________________________________________________________________________________________________________     |');
            textcolor(Lightmagenta);
            writeln('|- Zoologico   |- La Rinconada                                                                                     |');
            textcolor(white);
            WriteLn('______________________________________________________________________________________________________________     |');
            writeln('');
            write('Escribe el nombre tu subestacion de partida: '); 
            ReadLn(estacionPartida);
            estacionPartida := lowercase(estacionPartida);
            
            if (estacionPartida <> 'zoologico') and (estacionPartida <> 'la rinconada') then
                begin
                    WriteLn('Debes escribir el nombre de una subestacion valida (valida)');
                    isSubestacion := false;
                    delay(1500);
                end
            else if (estacionPartida = 'zoologico') or (estacionPartida = 'la rinconada') then
                begin
                    writeln('Informacion procesada');
                    isSubestacion := true;
                    repeat    
                    isSameEstacion := true;    
                    WriteLn('');
                    WriteLn('¿A que subestacion deseas ir?');
                    write('Deseo ir a la subestacion: ');
                    ReadLn(estacionLlegada);
                    estacionLlegada := lowercase(estacionLlegada);
                    if (estacionPartida = estacionLlegada) then
                        begin
                        WriteLn('Debes escribir el nombre de una subestacion diferente a la de partida');
                        isSameEstacion := false;           
                        end;
                    if (estacionLlegada <> 'zoologico') and (estacionLlegada <> 'la rinconada') then
                        begin
                        WriteLn('Debes escribir el nombre de una subestacion valida (valida)');
                        isSubestacion := false;
                        delay(1500);
                        end
                    else if (estacionLlegada = 'zoologico') or (estacionLlegada = 'la rinconada') then
                        begin
                        writeln('');
                        writeln('Informacion procesada');
                        isSubestacion := true;
                        writeln('');
                        writeln('Por favor presiona cualquier tecla para continuar');
                        readkey;
                        end;    
                    until isSameEstacion;
                end;                
            until  isSubestacion;    
        end;
        7:begin
            repeat
            clrscr;
            textcolor(lightgray);
            Writeln('| Linea 7:');
            textcolor(white);
            WriteLn('______________________________________________________________________________________________________________     |');
            textcolor(Lightgray);
            WriteLn('|- Las Flores  |- El Cristo       |- Roosevelt       |- Panteon     |- Roca Tarpeya  |- Socorro   |- La Bandera    |');
            writeln('|- INCES       |- La Hoyada       |- Los Ilustres    |- Presidente Medina                                          |');;
            textcolor(white);
            WriteLn('______________________________________________________________________________________________________________     |');
            writeln('');
            write('Escribe el nombre tu subestacion de partida: '); 
            ReadLn(estacionPartida);
            estacionPartida := lowercase(estacionPartida);
            
            if (estacionPartida <> 'las flores') and (estacionPartida <> 'el cristo') and (estacionPartida <> 'roosevelt') and (estacionPartida <> 'panteon') and (estacionPartida <> 'roca tarpeya')
            and (estacionPartida <> 'socorro') and (estacionPartida <> 'la bandera') and (estacionPartida <> 'inces') and (estacionPartida <> 'la hoyada') and (estacionPartida <> 'los ilustres') and (estacionPartida <> 'presidente medina') then
                begin
                    WriteLn('Debes escribir el nombre de una subestacion valida (valida)');
                    isSubestacion := false;
                    delay(1500);
                end
            else if (estacionPartida = 'las flores') or (estacionPartida = 'el cristo') or (estacionPartida = 'roosevelt') or (estacionPartida  = 'panteon') or (estacionPartida = 'roca tarpeya')
            or (estacionPartida = 'socorro') or (estacionPartida = 'la bandera') or (estacionPartida = 'inces') or (estacionPartida = 'la hoyada') or (estacionPartida = 'los ilustres') or (estacionPartida = 'presidente medina') then
                begin
                    writeln('Informacion procesada');
                    isSubestacion := true;
                    repeat    
                    isSameEstacion := true;    
                    WriteLn('');
                    WriteLn('¿A que subestacion deseas ir?');
                    write('Deseo ir a la subestacion: ');
                    ReadLn(estacionLlegada);
                    estacionLlegada := lowercase(estacionLlegada);
                    if (estacionPartida = estacionLlegada) then
                        begin
                        WriteLn('Debes escribir el nombre de una subestacion diferente a la de partida');
                        isSameEstacion := false;           
                        end;
                    if (estacionLlegada <> 'las flores') and (estacionLlegada <> 'el cristo') and (estacionLlegada <> 'roosevelt') and (estacionLlegada <> 'panteon') and (estacionLlegada <> 'roca tarpeya')
                    and (estacionLlegada <> 'socorro') and (estacionLlegada <> 'la bandera') and (estacionLlegada <> 'inces') and (estacionLlegada <> 'la hoyada') and (estacionLlegada <> 'los ilustres')
                    and (estacionLlegada <> 'presidente medina') then
                        begin
                        WriteLn('Debes escribir el nombre de una subestacion valida (valida)');
                        isSubestacion := false;
                        delay(1500);
                        end
                    else if (estacionLlegada = 'las flores') or (estacionLlegada = 'el cristo') or (estacionLlegada = 'roosevelt') or (estacionLlegada  = 'panteon') or (estacionLlegada = 'roca tarpeya')
                    or (estacionLlegada = 'socorro') or (estacionLlegada = 'la bandera') or (estacionLlegada = 'inces') or (estacionLlegada = 'la hoyada') or (estacionLlegada = 'los ilustres')
                    or (estacionLlegada = 'presidente medina')then
                        begin
                        writeln('');
                        writeln('Informacion procesada');
                        isSubestacion := true;
                        writeln('');
                        writeln('Por favor presiona cualquier tecla para continuar');
                        readkey;
                        end;    
                    until isSameEstacion;
                end;                
            until  isSubestacion;    
        end;
        8:begin
            repeat
            clrscr;
            textcolor(lightgray);
            Writeln('| Linea 7:');
            textcolor(white);
            WriteLn('______________________________________________________________________________________________________________     |');
            textcolor(Lightgray);
            writeln('|- Petare 2    |- Warairarepano   |- 5 de Julio      |- 19 de Abril |- 24 de Julio                                 |');
            textcolor(white);
            WriteLn('______________________________________________________________________________________________________________     |');
            writeln('');
            write('Escribe el nombre tu subestacion de partida: '); 
            ReadLn(estacionPartida);
            estacionPartida := lowercase(estacionPartida);
            
            if (estacionPartida <> 'petare 2') and (estacionPartida <> 'warairarepano') and (estacionPartida <> '5 de julio') and (estacionPartida <> '19 de abril') and (estacionPartida <> '24 de julio') then
                begin
                    WriteLn('Debes escribir el nombre de una subestacion valida (valida)');
                    isSubestacion := false;
                    delay(1500);
                end
            else if (estacionPartida = 'petare 2') or (estacionPartida = 'warairarepano') or (estacionPartida = '5 de julio') or (estacionPartida  = '19 de abril') or (estacionPartida = '24 de julio') then
                begin
                    writeln('Informacion procesada');
                    isSubestacion := true;
                    repeat    
                    isSameEstacion := true;    
                    WriteLn('');
                    WriteLn('¿A que subestacion deseas ir?');
                    write('Deseo ir a la subestacion: ');
                    ReadLn(estacionLlegada);
                    estacionLlegada := lowercase(estacionLlegada);
                    if (estacionPartida = estacionLlegada) then
                        begin
                        WriteLn('Debes escribir el nombre de una subestacion diferente a la de partida');
                        isSameEstacion := false;           
                        end;
                    if (estacionLlegada <> 'petare 2') and (estacionLlegada <> 'warairarepano') and (estacionLlegada <> '5 de julio') and (estacionLlegada <> '19 de abril') and (estacionLlegada <> '24 de julio') then
                        begin
                        WriteLn('Debes escribir el nombre de una subestacion valida (valida)');
                        isSubestacion := false;
                        delay(1500);
                        end
                    else if (estacionLlegada = 'petare 2') or (estacionLlegada = 'warairarepano') or (estacionLlegada = '5 de julio') or (estacionLlegada  = '19 de abril') or (estacionLlegada = '24 de julio') then
                        begin
                        writeln('');
                        writeln('Informacion procesada');
                        isSubestacion := true;
                        writeln('');
                        writeln('Por favor presiona cualquier tecla para continuar');
                        readkey;
                        end;    
                    until isSameEstacion;
                end;                
            until  isSubestacion;    
        end;                                                  
    end;
// Se utilizo un case para la seleccion de las lineas y subestaciones 
repeat
repeat
    clrscr;
    writeln('Ingresa tu contrasena especial para proceder con la facturacion');
    Write('Contrasena: ');
    ReadLn(readPassword);
    isNumber := True;
    for iNumber := 1 to length(readPassword) do
        begin
        if not (readPassword[iNumber] in ['0'..'9']) then
            begin
            writeln('Has ingresado un caracter no correspondiente a tu contrasena especial.');
            writeln('Por favor intente nuevamente');
            isNumber := false;
            break;
        end;
    end;
    until isNumber;

    if (readPassword = password) then
        begin
        isPassword := true;
        WriteLn('');
        WriteLn('Verificacion exitosa');
        writeln('');
        writeln('Por favor presiona cualquier tecla para continuar');
        readkey;
        repeat
        clrscr;
        textcolor(lightred);
        writeln(' ___________________________________________________');
        writeln('|                  FACTURACION                     '); 
        WriteLn('|');
        WriteLn('|');
        WriteLn('| Nombre: ', nombre);
        WriteLn('| Apellido: ', apellido);
        writeln('| Cedula: ', cedula);
        WriteLn('|');
        WriteLn('|');
        writeln('| Ticket/s MetroBus: ',ticketMBus);
        writeln('| Ticket/s Metro: ',ticketMetro); 
        WriteLn('| Precio total: ', totalAmount,'$');
        writeln('| ___________________________________________________');
        textcolor(white); 
        writeln('');
        writeln('¿Desea procesar su pago?');
        WriteLn('Si ---------------------------- No');
        readln(procesarPago);
        procesarPago := lowercase(procesarPago);
        if (procesarPago <> 'si') and (procesarPago <> 'no') then
            begin
                WriteLn('');
                writeln('DEBES SELECCIONAR ENTRE SI Y NO');
                delay(1550);
            end;
        if (procesarPago = 'si') then
            begin
                WriteLn('');
                WriteLn('');
                WriteLn('Tiene una deuda de: ', totalAmount, '$');
                Writeln('¿Cuanto dinero desea ingresar?');
                Write('Ingresar: ' );
                read(dineroCliente);
                if (dineroCliente>totalAmount) then
                    begin
                        devolucionCliente := dineroCliente-totalAmount;
                        writeln('');
                        WriteLn('Muchas gracias, se le ha entregado un vuelto de ', devolucionCliente,'$');
                        writeln('Por favor presiona cualquier tecla para continuar');
                        readkey;
                    end;
                if (dineroCliente<totalAmount) then
                    begin
                        writeln('');
                        writeln('Disculpe ha ingresado una cantidad, menor a el precio total de la factura');
                        writeln('No le puedo entregar sus tickets');
                        WriteLn('');
                        writeln('Hasta luego!');
                        halt(55);
                    end;
                if (dineroCliente=totalAmount) then
                    begin
                        writeln('');
                        writeln('Muchas gracias por su compra, procede a entregarle los tickets');
                        WriteLn('');
                        writeln('Por favor presiona cualquier tecla para continuar');
                        readkey; 
                    end;        
            end;
        if (procesarPago = 'no') then
            begin
                clrscr;
                WriteLn('Gracias por preferirnos, vuelva pronto!');
                halt(30);
            end;                 
        until (procesarPago='no') or (procesarPago='si');
        end
    else
        begin
        isPassword := false;
        WriteLn('');
        WriteLn('Contrasena incorrecta; intentalo de nuevo...');
        writeln('');
        delay(1110);
        readkey;
        end;
    until isPassword;
    repeat
    clrscr;
    textcolor(lightgreen);
    writeln(' ___________________________________________________');
    WriteLn('OPCION 1: Utilizar ticket');
    WriteLn('OPCION 2: Ver datos personales');
    WriteLn('OPCION 3: Salir del sistema');
    WriteLn();
    writeln(' ___________________________________________________');
    textcolor(white);
    Writeln('');
    write('Opcion: ');
    readln(travelMetro);
    if (travelmetro<>2) and (travelMetro<>1) and (travelMetro<>0) then
        begin
            WriteLn('Muchas gracias por utilizar el sistema del Metro de Caracas, vuelva pronto ');
            halt(100);
        end;
    case travelMetro of
    1: begin
    WriteLn('Para utilizar tu boleto debes confirmar tu cedula');
    write('C.I: ');
    readln(verificarCedula);
    if (verificarCedula = cedula) then
        begin
            if (ticketMBus > 0) then
            begin
                WriteLn('¿Quieres viajar en MetroBus o en Metro');
                WriteLn('Presiona 1 para viajar en MetroBus');
                WriteLn('Presiona 2 para viajar en Metro');
                write('Opcion: ');
                read(opcionViaje);
                if (opcionViaje = 1) then
                    begin
                            if (ticketMBus = 0) then 
                        begin
                        WriteLn('Ya no te quedan tickets de metrobus'); 
                        end;
                        ticketMBus := ticketMBus - 1;
                        writeln(' ___________________________________________________');
                        writeln('|                  VIAJE                    '); 
                        WriteLn('|');
                        WriteLn('|');
                        WriteLn('| Has utilizado un ticket de MetroBus');
                        WriteLn('| Te restan: ', ticketMBus, ' tickets');
                        writeln('| Cedula: ', cedula);
                        WriteLn('| Nombre: ', nombre);
                        WriteLn('| Apellido: ', apellido);
                        WriteLn('|');
                        WriteLn('|');
                        writeln('| subestacion de partida: ',estacionPartida);
                        writeln('| subestacion de llegada: ',estacionLlegada); 
                        writeln('| ___________________________________________________');
                        writeln('');
                        WriteLn('Presiona una opcion diferente para ir al menur');
                        readkey;

                    end;
                if (opcionViaje = 1) then
                    begin
                        if (ticketMetro = 0) then 
                        begin
                        WriteLn('Ya no te quedan tickets de metro'); 
                        end;
                        ticketMetro := ticketMetro - 1;
                        writeln(' ___________________________________________________');
                        writeln('|                  VIAJE                    '); 
                        WriteLn('|');
                        WriteLn('|');
                        WriteLn('| Has utilizado un ticket de Metro');
                        WriteLn('| Te restan: ', ticketMetro, ' tickets');
                        writeln('| Cedula: ', cedula);
                        WriteLn('| Nombre: ', nombre);
                        WriteLn('| Apellido: ', apellido);
                        WriteLn('|');
                        WriteLn('|');
                        writeln('| subestacion de partida: ',estacionPartida);
                        writeln('| subestacion de llegada: ',estacionLlegada); 
                        writeln('| ___________________________________________________');
                        writeln('');
                        WriteLn('Presiona una opcion diferente para ir al menu');
                        readkey;

            end;        end;                    
            if (ticketMetro >0 ) then
                begin
                    if (ticketMetro = 0) then 
                        begin
                        WriteLn('Ya no te quedan tickets de metro'); 
                        end;
                        ticketMetro := ticketMetro - 1;
                        writeln(' ___________________________________________________');
                        writeln('|                  VIAJE                    '); 
                        WriteLn('|');
                        WriteLn('|');
                        WriteLn('| Has utilizado un ticket de Metro');
                        WriteLn('| Te restan: ', ticketMetro, ' tickets');
                        writeln('| Cedula: ', cedula);
                        WriteLn('| Nombre: ', nombre);
                        WriteLn('| Apellido: ', apellido);
                        WriteLn('|');
                        WriteLn('|');
                        writeln('| subestacion de partida: ',estacionPartida);
                        writeln('| subestacion de llegada: ',estacionLlegada); 
                        writeln('| ___________________________________________________');
                        writeln('');
                        WriteLn('Presiona una opcion diferente para ir al menu');
                        readkey;
                end;
        end;
    end;
    2: begin
        writeln(' ___________________________________________________');
        writeln('C.I: ', cedula);
        writeln('Nombre: ', nombre);
        writeln('Apellido: ', apellido);
        writeln('Clave personal ', password);
        writeln(' ___________________________________________________');
        writeln('');
        WriteLn('Presiona una opcion diferente para ir al menu');
        readkey;
    end;
    3: begin
        clrscr;
        writeln('Muchas gracias por preferirnos, vuelva pronto!');
        Halt;
    end;
    end;
    until (travelMetro=3); 
end.
