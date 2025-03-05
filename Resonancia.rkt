#lang racket

#|-Fecha de publicación: 9/5/2024
-Hora: 5:50 p.m.
- Versión de su código: 2.5
-Autor. Ing(c): Jose Daniel Gomez Buritica
- Nombre del lenguaje utilizado: Racket
- Versión del lenguaje utilizado: 8.12
- Presentado a: Doctor Ricardo Moreno Laverde
- Universidad Tecnológica de Pereira
- Programa de Ingeniería de Sistemas y Computación
- Este programa simula un programa de resonancia magnetica a partir de datos aleatorios dados desde adentro del mismo codigo, en este caso, un string de 1 millon de valores los cuales se convierten a caracteres para poder analizarlos mas facil, ademas se crean funciones que grafican los valores para poder ser analizados.  
-Salvedades: No intente usar valores diferentes a los numericos para usar el programa, si lo hace, no se garantiza el buen funcionamiento, o sea, ingrese solo valores entre 1 y 98.
 El programa tiene algunas funciones que se han adaptado para poder crear el menú, esto resultó en un aumento considerable en el número de lineas de código,
en un futuro se trabajara en la optimización de este para que ocupe menos lineas.|#

;------------------------------------------------------------------------------------------------------------------------------------------

( require graphics/graphics );esta funcion pide abrir la libreria graphics y su carpeta graphics de racket para poder usar las funciones.
( open-graphics );esta funcion abre la libreria.

( define ( RandomNum a )
   ( random 18 42 ) );se define una funcion para que pueda ser usada en la creacion del vector

( define ( RandomNumb a )
   ( random 20 41 ) );se define una funcion para que pueda ser usada en la creacion del vector y para hacer una simulacion de puntos sospechosos

( define mainVec ( vector-append ( build-vector 20550 RandomNum )
                                 
                                 ( build-vector 10 RandomNumb ) ( build-vector 90 RandomNum )
                                 ( build-vector 10 RandomNumb ) ( build-vector 90 RandomNum )
                                 ( build-vector 10 RandomNumb ) ( build-vector 90 RandomNum )
                                 ( build-vector 10 RandomNumb ) ( build-vector 90 RandomNum )
                                 ( build-vector 10 RandomNumb ) ( build-vector 90 RandomNum )
                                 ( build-vector 10 RandomNumb ) ( build-vector 90 RandomNum )
                                 ( build-vector 10 RandomNumb ) ( build-vector 90 RandomNum )
                                 ( build-vector 10 RandomNumb ) ( build-vector 90 RandomNum )
                                 ( build-vector 10 RandomNumb ) ( build-vector 90 RandomNum )
                                 ( build-vector 10 RandomNumb ) ( build-vector 90 RandomNum )
                          
                                 ( build-vector 9000 RandomNum )
                                 ( build-vector 10 RandomNumb ) ( build-vector 90 RandomNum )
                                 ( build-vector 10 RandomNumb ) ( build-vector 90 RandomNum )
                                 ( build-vector 10 RandomNumb ) ( build-vector 90 RandomNum )
                                 ( build-vector 10 RandomNumb ) ( build-vector 90 RandomNum )
                                 ( build-vector 10 RandomNumb ) ( build-vector 90 RandomNum )
                                 ( build-vector 10 RandomNumb ) ( build-vector 90 RandomNum )
                                 ( build-vector 10 RandomNumb ) ( build-vector 90 RandomNum )
                                 ( build-vector 10 RandomNumb ) ( build-vector 90 RandomNum )
                                 ( build-vector 10 RandomNumb ) ( build-vector 90 RandomNum )
                                 ( build-vector 10 RandomNumb ) ( build-vector 90 RandomNum )

                                 ( build-vector 9000 RandomNum )
                                 ( build-vector 10 RandomNumb ) ( build-vector 90 RandomNum )
                                 ( build-vector 10 RandomNumb ) ( build-vector 90 RandomNum )
                                 ( build-vector 10 RandomNumb ) ( build-vector 90 RandomNum )
                                 ( build-vector 10 RandomNumb ) ( build-vector 90 RandomNum )
                                 ( build-vector 10 RandomNumb ) ( build-vector 90 RandomNum )
                                 ( build-vector 10 RandomNumb ) ( build-vector 90 RandomNum )
                                 ( build-vector 10 RandomNumb ) ( build-vector 90 RandomNum )
                                 ( build-vector 10 RandomNumb ) ( build-vector 90 RandomNum )
                                 ( build-vector 10 RandomNumb ) ( build-vector 90 RandomNum )
                                 ( build-vector 10 RandomNumb ) ( build-vector 90 RandomNum )
                             
                                 ( build-vector 9000 RandomNum )
                                 ( build-vector 10 RandomNumb ) ( build-vector 90 RandomNum )
                                 ( build-vector 10 RandomNumb ) ( build-vector 90 RandomNum )
                                 ( build-vector 10 RandomNumb ) ( build-vector 90 RandomNum )
                                 ( build-vector 10 RandomNumb ) ( build-vector 90 RandomNum )
                                 ( build-vector 10 RandomNumb ) ( build-vector 90 RandomNum )
                                 ( build-vector 10 RandomNumb ) ( build-vector 90 RandomNum )
                                 ( build-vector 10 RandomNumb ) ( build-vector 90 RandomNum )
                                 ( build-vector 10 RandomNumb ) ( build-vector 90 RandomNum )
                                 ( build-vector 10 RandomNumb ) ( build-vector 90 RandomNum )
                                 ( build-vector 10 RandomNumb ) ( build-vector 90 RandomNum )
                       
                                 ( build-vector 9000 RandomNum )
                                 ( build-vector 10 RandomNumb ) ( build-vector 90 RandomNum )
                                 ( build-vector 10 RandomNumb ) ( build-vector 90 RandomNum )
                                 ( build-vector 10 RandomNumb ) ( build-vector 90 RandomNum )
                                 ( build-vector 10 RandomNumb ) ( build-vector 90 RandomNum )
                                 ( build-vector 10 RandomNumb ) ( build-vector 90 RandomNum )
                                 ( build-vector 10 RandomNumb ) ( build-vector 90 RandomNum )
                                 ( build-vector 10 RandomNumb ) ( build-vector 90 RandomNum )
                                 ( build-vector 10 RandomNumb ) ( build-vector 90 RandomNum )
                                 ( build-vector 10 RandomNumb ) ( build-vector 90 RandomNum )
                                 ( build-vector 10 RandomNumb ) ( build-vector 90 RandomNum )
                        
                                 ( build-vector 9000 RandomNum )
                                 ( build-vector 10 RandomNumb ) ( build-vector 90 RandomNum )
                                 ( build-vector 10 RandomNumb ) ( build-vector 90 RandomNum )
                                 ( build-vector 10 RandomNumb ) ( build-vector 90 RandomNum )
                                 ( build-vector 10 RandomNumb ) ( build-vector 90 RandomNum )
                                 ( build-vector 10 RandomNumb ) ( build-vector 90 RandomNum )
                                 ( build-vector 10 RandomNumb ) ( build-vector 90 RandomNum )
                                 ( build-vector 10 RandomNumb ) ( build-vector 90 RandomNum )
                                 ( build-vector 10 RandomNumb ) ( build-vector 90 RandomNum )
                                 ( build-vector 10 RandomNumb ) ( build-vector 90 RandomNum )
                                
                                 
                                 ( build-vector 973450 RandomNum ) ) );se unen los vectores para crar uno solo

( define ( NeuroString string counter );se define la funcion para crear una parte de la cadena de caracteres
   ( if ( < counter 10000 )
        ( NeuroString ( string-append
                        string
                        (~a ( integer->char ( random 18 42 ) ) ) ) (+ counter 1 ) )
        string )
   );fin if 

( define ( DeadPacient string counter );funcion que crea una parte del string la cual se usa para probar el programa
   ( if ( < counter 10000 )
        ( if ( or ( and (> counter 4050 ) (< counter 4061 ) )
                  ( and (> counter 4150 ) (< counter 4161 ) )
                  ( and (> counter 4250 ) (< counter 4261 ) )
                  ( and (> counter 4350 ) (< counter 4361 ) )
                  ( and (> counter 4450 ) (< counter 4461 ) )
                  ( and (> counter 4550 ) (< counter 4561 ) )
                  ( and (> counter 4650 ) (< counter 4661 ) )
                  ( and (> counter 4750 ) (< counter 4761 ) )
                  ( and (> counter 4850 ) (< counter 4861 ) )
                  ( and (> counter 4950 ) (< counter 4961 ) )
                  )
             ( DeadPacient ( string-append
                             string
                             (~a ( integer->char ( random 20 41 ) ) ) ) (+ counter 1 ) )
             ( DeadPacient ( string-append
                             string
                             (~a ( integer->char ( random 18 42 ) ) ) ) (+ counter 1 ) ) )
        string )
   );fin if

( define ( PageMaker string counter );funcion que crea una parte del string la cual se usa para rellenar el millon de caracteres juntando strings de 10000 caracteres
   ( if (< counter 100 )
        ( if ( and (> counter 3 )  (< counter 13 ) )
             ( PageMaker ( string-append string ( DeadPacient "" 0 ) ) (+ counter 1 ) )
             ( PageMaker ( string-append string ( NeuroString "" 0 ) ) (+ counter 1 ) )
             );fin if
        string );fin if
   );fin definicion funcion PageMaker

( define mainString ( PageMaker "" 0 ) );se le da un identificador para poder llamarla despues

;En esta seccion se definen las funciones que van a crear el string de 1 millon de caracteres y el vector con 1 millon de posiciones
;------------------------------------------------------------------------------------------------------------------------------------------

( define ( limiter number );se crea una funcion que solo me deje ingresar valores numericos a la hora de definir los ejes que se usan para ubicar un punto en x, y o z
   
   ( if ( boolean=? ( real? number ) #f )
        ( begin
           ( displayln "Por favor ingrese un valor numerico.")
           ( limiter ( read ) ) );fin begin
        ;else
        ( if ( or (<= number 0 ) (>= number 99 ) )
             ( begin
                ( displayln "Posición inválida, intente con otro valor.")
                ( limiter ( read ) ) );fin begin
             ;else
             number );fin if
        );fin if
   );fin definicion funcion limiter

( define ( Reader number );se define Reader para validar las opciones principales
   ( if (= number 1 )
        1
        ( if (= number 2 )
             2
             ( if (= number 3 )
                  3
                  ( begin
                     ( displayln "Ingrese una de las opciones disponibles." )
                     ( Reader ( read ) )
                     );fin begin
                  );fin if
             );fin if
        );fin if
   );fin definicion funcion Reader2

( define ( Reader2 number );se define Reader2 para validar las opciones internas
   ( if (= number 1 )
        1
        ( if (= number 2 )
             2
             ( if (= number 3 )
                  3
                  ( if (= number 4 )
                       4
                       ( begin
                          ( displayln "Ingrese una de las opciones disponibles." )
                          ( Reader2 ( read ) ) );fin if
                       );fin if
                  );fin if
             );fin if
        );fin if
   );fin definicion funcion Reader2

( define ( Asker string );se define asker para valodar si el usuario ingresa s o n
   ( if ( or ( string=? string "s" ) ( string=? string "n" ) )
        string
        ( begin
           ( displayln "Ingrese solo s o n" )
           ( Asker (~a ( read ) ) ) );fin begin
        );fin if 
   );fin definicion funcion asker

( define ( MainMenu );se define el menu principal
   ( displayln "Bienvenido\n" )
   ( displayln "Ingrese el modo a operar.\n\n1.String\n2.Vector\n3.Salir\n" )
   ( define option ( Reader ( read ) ) );se define option para las opciones
   ( if (= option 1 )
        ( StringMode )
        ( if (= option 2 )
             ( VectorMode )
             ( void ) );fin if
        );fin if
   );fin definicion funcion MainMenu
      


( define ( DataReader string number verifier page z viewport );se define la funcion que verifica si un punto es sospechoso

   ( if (= verifier 0 )
        ( begin 
           ( ( draw-string viewport ) ( make-posn 250 220 ) (~a "Plano en z (hoja): " (~a z )  ) )
           ( ( draw-string viewport ) ( make-posn 450 220 ) (~a "Plano en z (hoja): " (~a (+ z 1 ) ) ) )
           ( ( draw-string viewport ) ( make-posn 50 220 ) (~a "Plano en z (hoja): " (~a (- z 1 ) ) ) )

           ;pagina escogida

           ( ( draw-solid-ellipse viewport ) ( make-posn 288 77 ) 24 24 "red"  )
           ( ( draw-string viewport )  ( make-posn 256 92 ) (~a ( char->integer ( string-ref mainString (- number 1 ) ) ) ) )
           ( ( draw-string viewport ) ( make-posn 323 92 ) (~a ( char->integer ( string-ref mainString (+ number 1 ) ) ) ) )

           ( ( draw-string viewport ) ( make-posn 256 60 ) (~a ( char->integer ( string-ref mainString (- number 101 ) ) ) ) )
           ( ( draw-string viewport ) ( make-posn 288 60 ) (~a ( char->integer ( string-ref mainString (- number 100 ) ) ) ) )
           ( ( draw-string viewport ) ( make-posn 323 60 ) (~a ( char->integer ( string-ref mainString (- number 99 ) ) ) ) )

           ( ( draw-string viewport ) ( make-posn 323 130 ) (~a ( char->integer ( string-ref mainString (+ number 101 ) ) ) ) )
           ( ( draw-string viewport ) ( make-posn 288 130 ) (~a ( char->integer ( string-ref mainString (+ number 100 ) ) ) ) )
           ( ( draw-string viewport ) ( make-posn 256 130 ) (~a ( char->integer ( string-ref mainString (+ number 99 ) ) ) ) )

           ;pagina anterior

           ( ( draw-string viewport ) ( make-posn 86 92 ) (~a ( char->integer ( string-ref mainString (- number 10000 ) ) ) ) )
           ( ( draw-string viewport ) ( make-posn 53 92 ) (~a ( char->integer ( string-ref mainString (- (- number 1 ) 10000 ) ) ) ) )
           ( ( draw-string viewport ) ( make-posn 120 92 ) (~a ( char->integer ( string-ref mainString (- (+ number 1 ) 10000 ) ) ) ) )

           ( ( draw-string viewport ) ( make-posn 53 60 ) (~a ( char->integer ( string-ref mainString (- (- number 101 ) 10000 ) ) ) ) )
           ( ( draw-string viewport ) ( make-posn 86 60 ) (~a ( char->integer ( string-ref mainString (- (- number 100 ) 10000 ) ) ) ) )
           ( ( draw-string viewport ) ( make-posn 120 60 ) (~a ( char->integer ( string-ref mainString (- (- number 99 ) 10000 ) ) ) ) )

           ( ( draw-string viewport ) ( make-posn 120 130 ) (~a ( char->integer ( string-ref mainString (- (+ number 101 ) 10000 ) ) ) ) )
           ( ( draw-string viewport ) ( make-posn 86 130 ) (~a ( char->integer ( string-ref mainString (- (+ number 100 ) 10000 ) ) ) ) )
           ( ( draw-string viewport ) ( make-posn 56 130 ) (~a ( char->integer ( string-ref mainString (- (+ number 99 ) 10000 ) ) ) ) )

           ;pagina superior

           ( ( draw-string viewport ) ( make-posn 486 92 ) (~a ( char->integer ( string-ref mainString (+ number 10000 ) ) ) ) )
           ( ( draw-string viewport ) ( make-posn 453 92 ) (~a ( char->integer ( string-ref mainString (+ (- number 1 ) 10000 ) ) ) ) )
           ( ( draw-string viewport ) ( make-posn 520 92 ) (~a ( char->integer ( string-ref mainString (+ (+ number 1 ) 10000 ) ) ) ) )

           ( ( draw-string viewport ) ( make-posn 453 60 ) (~a ( char->integer ( string-ref mainString (+ (- number 101 ) 10000 ) ) ) ) )
           ( ( draw-string viewport ) ( make-posn 486 60 ) (~a ( char->integer ( string-ref mainString (+ (- number 100 ) 10000 ) ) ) ) )
           ( ( draw-string viewport ) ( make-posn 520 60 ) (~a ( char->integer ( string-ref mainString (+ (- number 99 ) 10000 ) ) ) ) )

           ( ( draw-string viewport ) ( make-posn 520 130 ) (~a ( char->integer ( string-ref mainString (+ (+ number 101 ) 10000 ) ) ) ) )
           ( ( draw-string viewport ) ( make-posn 486 130 ) (~a ( char->integer ( string-ref mainString (+ (+ number 100 ) 10000 ) ) ) ) )
           ( ( draw-string viewport ) ( make-posn 453 130 ) (~a ( char->integer ( string-ref mainString (+ (+ number 99 ) 10000 ) ) ) ) ) )
        ( void )
        );fin begin

   ( if ( and ( boolean=? (= (- (/ number 100 ) ( floor (/ number 100 ) ) ) 99/100 ) #f );se verifica si el numero no termina en 99 lo cual indicaria el fin de la linea
              ( boolean=? (= ( modulo number 100 ) 0 ) #f );se verifica si el numero no es el inicio de una nueva linea
              ( > number (+ page 100 ) );se verifica si el numero no esta en la primera linea de la pagina
              ( < number (+ page 9900 ) );se verifica si el numero no esta en la ultima linea de la pagina

              ;Pagina del medio
              
              (> ( char->integer ( string-ref string (- number 1 ) ) ) 19 )
              (< ( char->integer ( string-ref string (- number 1 ) ) ) 41 )
              (> ( char->integer ( string-ref string (+ number 1 ) ) ) 19 )
              (< ( char->integer ( string-ref string (+ number 1 ) ) ) 41 )
              
              (> ( char->integer ( string-ref string (- number 100 ) ) ) 19 )
              (< ( char->integer ( string-ref string (- number 100 ) ) ) 41 )
              (> ( char->integer ( string-ref string (+ number 100 ) ) ) 19 )
              (< ( char->integer ( string-ref string (+ number 100 ) ) ) 41 )

              (> ( char->integer ( string-ref string (- number 101 ) ) ) 19 )
              (< ( char->integer ( string-ref string (- number 101 ) ) ) 41 )
              (> ( char->integer ( string-ref string (+ number 101 ) ) ) 19 )
              (< ( char->integer ( string-ref string (+ number 101 ) ) ) 41 )

              (> ( char->integer ( string-ref string (- number 99 ) ) ) 19 )
              (< ( char->integer ( string-ref string (- number 99 ) ) ) 41 )
              (> ( char->integer ( string-ref string (+ number 99 ) ) ) 19 )
              (< ( char->integer ( string-ref string (+ number 99 ) ) ) 41 )

              ;Pagina anterior

              (> ( char->integer ( string-ref string (- (- number 1 ) 10000 ) ) ) 19 )
              (< ( char->integer ( string-ref string (- (- number 1 ) 10000 ) ) ) 41 )
              (> ( char->integer ( string-ref string (- (+ number 1 ) 10000 ) ) ) 19 )
              (< ( char->integer ( string-ref string (- (+ number 1 ) 10000 ) ) ) 41 )
              
              (> ( char->integer ( string-ref string (- (- number 100 ) 10000 ) ) ) 19 )
              (< ( char->integer ( string-ref string (- (- number 100 ) 10000 ) ) ) 41 )
              (> ( char->integer ( string-ref string (- (+ number 100 ) 10000 ) ) ) 19 )
              (< ( char->integer ( string-ref string (- (+ number 100 ) 10000 ) ) ) 41 )

              (> ( char->integer ( string-ref string (- (- number 101 ) 10000 ) ) ) 19 )
              (< ( char->integer ( string-ref string (- (- number 101 ) 10000 ) ) ) 41 )
              (> ( char->integer ( string-ref string (- (+ number 101 ) 10000 ) ) ) 19 )
              (< ( char->integer ( string-ref string (- (+ number 101 ) 10000 ) ) ) 41 )

              (> ( char->integer ( string-ref string (- (- number 99 ) 10000 ) ) ) 19 )
              (< ( char->integer ( string-ref string (- (- number 99 ) 10000 ) ) ) 41 )
              (> ( char->integer ( string-ref string (- (+ number 99 ) 10000 ) ) ) 19 )
              (< ( char->integer ( string-ref string (- (+ number 99 ) 10000 ) ) ) 41 )

              (> ( char->integer ( string-ref string (- number 10000 ) ) ) 19 )
              (< ( char->integer ( string-ref string (- number 10000 ) ) ) 41 )

              ;Pagina superior
              
              (> ( char->integer ( string-ref string (+ (- number 1 ) 10000 ) ) ) 19 )
              (< ( char->integer ( string-ref string (+ (- number 1 ) 10000 ) ) ) 41 )
              (> ( char->integer ( string-ref string (+ (+ number 1 ) 10000 ) ) ) 19 )
              (< ( char->integer ( string-ref string (+ (+ number 1 ) 10000 ) ) ) 41 )
              
              (> ( char->integer ( string-ref string (+ (- number 100 ) 10000 ) ) ) 19 )
              (< ( char->integer ( string-ref string (+ (- number 100 ) 10000 ) ) ) 41 )
              (> ( char->integer ( string-ref string (+ (+ number 100 ) 10000 ) ) ) 19 )
              (< ( char->integer ( string-ref string (+ (+ number 100 ) 10000 ) ) ) 41 )

              (> ( char->integer ( string-ref string (+ (- number 101 ) 10000 ) ) ) 19 )
              (< ( char->integer ( string-ref string (+ (- number 101 ) 10000 ) ) ) 41 )
              (> ( char->integer ( string-ref string (+ (+ number 101 ) 10000 ) ) ) 19 )
              (< ( char->integer ( string-ref string (+ (+ number 101 ) 10000 ) ) ) 41 )

              (> ( char->integer ( string-ref string (+ (- number 99 ) 10000 ) ) ) 19 )
              (< ( char->integer ( string-ref string (+ (- number 99 ) 10000 ) ) ) 41 )
              (> ( char->integer ( string-ref string (+ (+ number 99 ) 10000 ) ) ) 19 )
              (< ( char->integer ( string-ref string (+ (+ number 99 ) 10000 ) ) ) 41 )

              (> ( char->integer ( string-ref string (+ number 10000 ) ) ) 19 )
              (< ( char->integer ( string-ref string (+ number 10000 ) ) ) 41 ) );fin and
        
        "sus";si es sospechoso
        "no";no es sospechoso

        );fin if
   );fin definicion funcion DataReader



( define ( VecReader vector number verifier page z viewport );se define la funcion que verifica si un punto es sospechoso

   ( if (= verifier 0 )
        ( begin 
           ( ( draw-string viewport ) ( make-posn 250 220 ) (~a "Plano en z (hoja): " (~a z )  ) )
           ( ( draw-string viewport ) ( make-posn 450 220 ) (~a "Plano en z (hoja): " (~a (+ z 1 ) ) ) )
           ( ( draw-string viewport ) ( make-posn 50 220 ) (~a "Plano en z (hoja): " (~a (- z 1 ) ) ) )

           ;pagina escogida

           ( ( draw-solid-ellipse viewport ) ( make-posn 288 77 ) 24 24 "red"  )
           ( ( draw-string viewport ) ( make-posn 256 92 ) (~a ( vector-ref mainVec (- number 1 ) ) ) ) 
           ( ( draw-string viewport ) ( make-posn 323 92 ) (~a ( vector-ref mainVec (+ number 1 ) ) ) )

           ( ( draw-string viewport ) ( make-posn 256 60 ) (~a ( vector-ref mainVec (- number 101 ) ) ) )
           ( ( draw-string viewport ) ( make-posn 288 60 ) (~a ( vector-ref mainVec (- number 100 ) ) ) )
           ( ( draw-string viewport ) ( make-posn 323 60 ) (~a ( vector-ref mainVec (- number 99 ) ) ) )

           ( ( draw-string viewport ) ( make-posn 323 130 ) (~a ( vector-ref mainVec (+ number 101 ) ) ) )
           ( ( draw-string viewport ) ( make-posn 288 130 ) (~a ( vector-ref mainVec (+ number 100 ) ) ) )
           ( ( draw-string viewport ) ( make-posn 256 130 ) (~a ( vector-ref mainVec (+ number 99 ) ) ) )

           ;pagina anterior

           ( ( draw-string viewport ) ( make-posn 86 92 ) (~a ( vector-ref mainVec (- number 10000 ) ) ) )
           ( ( draw-string viewport ) ( make-posn 53 92 ) (~a ( vector-ref mainVec (- (- number 1 ) 10000 ) ) ) )
           ( ( draw-string viewport ) ( make-posn 120 92 ) (~a ( vector-ref mainVec (- (+ number 1 ) 10000 ) ) ) )

           ( ( draw-string viewport ) ( make-posn 53 60 ) (~a ( vector-ref mainVec (- (- number 101 ) 10000 ) ) ) )
           ( ( draw-string viewport ) ( make-posn 86 60 ) (~a ( vector-ref mainVec (- (- number 100 ) 10000 ) ) ) )
           ( ( draw-string viewport ) ( make-posn 120 60 ) (~a ( vector-ref mainVec (- (- number 99 ) 10000 ) ) ) )

           ( ( draw-string viewport ) ( make-posn 120 130 ) (~a ( vector-ref mainVec (- (+ number 101 ) 10000 ) ) ) ) 
           ( ( draw-string viewport ) ( make-posn 86 130 ) (~a ( vector-ref mainVec (- (+ number 100 ) 10000 ) ) ) ) 
           ( ( draw-string viewport ) ( make-posn 56 130 ) (~a ( vector-ref mainVec (- (+ number 99 ) 10000 ) ) ) )

           ;pagina superior

           ( ( draw-string viewport ) ( make-posn 486 92 ) (~a ( vector-ref mainVec (+ number 10000 ) ) ) ) 
           ( ( draw-string viewport ) ( make-posn 453 92 ) (~a ( vector-ref mainVec (+ (- number 1 ) 10000 ) ) ) ) 
           ( ( draw-string viewport ) ( make-posn 520 92 ) (~a ( vector-ref mainVec (+ (+ number 1 ) 10000 ) ) ) )

           ( ( draw-string viewport ) ( make-posn 453 60 ) (~a ( vector-ref mainVec (+ (- number 101 ) 10000 ) ) ) )
           ( ( draw-string viewport ) ( make-posn 486 60 ) (~a ( vector-ref mainVec (+ (- number 100 ) 10000 ) ) ) )
           ( ( draw-string viewport ) ( make-posn 520 60 ) (~a (vector-ref mainVec (+ (- number 99 ) 10000 ) ) ) )

           ( ( draw-string viewport ) ( make-posn 520 130 ) (~a ( vector-ref mainVec (+ (+ number 101 ) 10000 ) ) ) )
           ( ( draw-string viewport ) ( make-posn 486 130 ) (~a ( vector-ref mainVec (+ (+ number 100 ) 10000 ) ) ) )
           ( ( draw-string viewport ) ( make-posn 453 130 ) (~a ( vector-ref mainVec (+ (+ number 99 ) 10000 ) ) ) ) )
        ( void ) );fin begin

   ( if ( and ( boolean=? (= (- (/ number 100 ) ( floor (/ number 100 ) ) ) 99/100 ) #f );se verifica si el numero no termina en 99 lo cual indicaria el fin de la linea
              ( boolean=? (= ( modulo number 100 ) 0 ) #f );se verifica si el numero no es el inicio de una nueva linea
              ( > number (+ page 100 ) );se verifica si el numero no esta en la primera linea de la pagina
              ( < number (+ page 9900 ) );se verifica si el numero no esta en la ultima linea de la pagina
              
              (> ( vector-ref vector (- number 1 ) ) 19 )
              (< ( vector-ref vector (- number 1 ) ) 41 )
              (> ( vector-ref vector (+ number 1 ) ) 19 )
              (< ( vector-ref vector (+ number 1 ) ) 41 )
              
              (> ( vector-ref vector (- number 100 ) ) 19 )
              (< ( vector-ref vector (- number 100 ) ) 41 )
              (> ( vector-ref vector (+ number 100 ) ) 19 )
              (< ( vector-ref vector (+ number 100 ) ) 41 )

              (> ( vector-ref vector (- number 101 ) ) 19 )
              (< ( vector-ref vector (- number 101 ) ) 41 )
              (> ( vector-ref vector (+ number 101 ) ) 19 )
              (< ( vector-ref vector (+ number 101 ) ) 41 )

              (> ( vector-ref vector (- number 99 ) ) 19 )
              (< ( vector-ref vector (- number 99 ) ) 41 )
              (> ( vector-ref vector (+ number 99 ) ) 19 )
              (< ( vector-ref vector (+ number 99 ) ) 41 )

              ;Pagina anterior

              (> ( vector-ref vector (- (- number 1 ) 10000 ) ) 19 )
              (< ( vector-ref vector (- (- number 1 ) 10000 ) ) 41 )
              (> ( vector-ref vector (- (+ number 1 ) 10000 ) ) 19 )
              (< ( vector-ref vector (- (+ number 1 ) 10000 ) ) 41 )
              
              (> ( vector-ref vector (- (- number 100 ) 10000 ) ) 19 )
              (< ( vector-ref vector (- (- number 100 ) 10000 ) ) 41 )
              (> ( vector-ref vector (- (+ number 100 ) 10000 ) ) 19 )
              (< ( vector-ref vector (- (+ number 100 ) 10000 ) ) 41 )

              (> ( vector-ref vector (- (- number 101 ) 10000 ) ) 19 )
              (< ( vector-ref vector (- (- number 101 ) 10000 ) ) 41 )
              (> ( vector-ref vector (- (+ number 101 ) 10000 ) ) 19 )
              (< ( vector-ref vector (- (+ number 101 ) 10000 ) ) 41 )

              (> ( vector-ref vector (- (- number 99 ) 10000 ) ) 19 )
              (< ( vector-ref vector (- (- number 99 ) 10000 ) ) 41 )
              (> ( vector-ref vector (- (+ number 99 ) 10000 ) ) 19 )
              (< ( vector-ref vector (- (+ number 99 ) 10000 ) ) 41 )

              (> ( vector-ref vector (- number 10000 ) ) 19 )
              (< ( vector-ref vector (- number 10000 ) ) 41 )

              ;Pagina superior
              
              (> ( vector-ref vector (+ (- number 1 ) 10000 ) ) 19 )
              (< ( vector-ref vector (+ (- number 1 ) 10000 ) ) 41 )
              (> ( vector-ref vector (+ (+ number 1 ) 10000 ) ) 19 )
              (< ( vector-ref vector (+ (+ number 1 ) 10000 ) ) 41 )
              
              (> ( vector-ref vector (+ (- number 100 ) 10000 ) ) 19 )
              (< ( vector-ref vector (+ (- number 100 ) 10000 ) ) 41 )
              (> ( vector-ref vector (+ (+ number 100 ) 10000 ) ) 19 )
              (< ( vector-ref vector (+ (+ number 100 ) 10000 ) ) 41 )

              (> ( vector-ref vector (+ (- number 101 ) 10000 ) ) 19 )
              (< ( vector-ref vector (+ (- number 101 ) 10000 ) ) 41 )
              (> ( vector-ref vector (+ (+ number 101 ) 10000 ) ) 19 )
              (< ( vector-ref vector (+ (+ number 101 ) 10000 ) ) 41 )

              (> ( vector-ref vector (+ (- number 99 ) 10000 ) ) 19 )
              (< ( vector-ref vector (+ (- number 99 ) 10000 ) ) 41 )
              (> ( vector-ref vector (+ (+ number 99 ) 10000 ) ) 19 )
              (< ( vector-ref vector (+ (+ number 99 ) 10000 ) ) 41 )

              (> ( vector-ref vector (+ number 10000 ) ) 19 )
              (< ( vector-ref vector (+ number 10000 ) ) 41 ) );fin and
        
        "sus";si es sospechoso
        "no";no es sospechoso

        );fin if
   );fin definicion funcion VecReader

;Esta seccion contiene la funcion que verifica si un numero es sospechoso o no, verificando las paginas anteriores, medias y superiores a la que se este analizando, esta funcion imprime los valores en la ventana "resonance" solo si el verificador es 0
;------------------------------------------------------------------------------------------------------------------------------------------

( define ( SearchPoint data mode )

   ( displayln "Ingrese las coordenadas en X, Y y Z del punto que quiere analizar\n
(X: para la posicion hacia la derecha o la izquierda desde el 1 hasta el 98)
(Y: para la posicion hacia arriba o abajo desde la linea 1 hasta la 98)
(Z: para el numero de página desde la 1 hasta la 98):\n" );esto seria un menu que se imprime en la ventana de interacciones  

   ( display "X:");imprime "X:" para indicar que el usuario puede ingresar el valor numerico
   ( define x ( limiter ( read ) ) );se define x leyendo el valor ingresado por el teclado, el cual pasa primero por la funcion limiter para poder validarlo
   ( display "Y:" );imprime "Y:" para indicar que el usuario puede ingresar el valor numerico
   ( define y ( limiter ( read ) ) );se define y leyendo el valor ingresado por el teclado, el cual pasa primero por la funcion limiter para poder validarlo
   ( display "Z:" );imprime "Z:" para indicar que el usuario puede ingresar el valor numerico
   ( define z ( limiter ( read ) ) );se define z leyendo el valor ingresado por el teclado, el cual pasa primero por la funcion limiter para poder validarlo
   ( display "\n" );se imprime una nueva linea para tener un orden

   ;En esta seccion se imprimen y se definen las funciones que imprimen la mayoria de elementos que se veran en la barra de interacciones
   ;------------------------------------------------------------------------------------------------------------------------------------------
   ( define resonance ( open-viewport "Escaner de puntos." 600 300 ) )
   ( ( draw-pixmap resonance ) "cuadrop.jpg" ( make-posn 50 40 ) );se imprime la imagen de uno de los cuadros en la ventana "resonance"
   ( ( draw-pixmap resonance ) "cuadrop.jpg" ( make-posn 250 40 ) );se imprime la imagen de uno de los cuadros en la ventana "resonance"
   ( ( draw-pixmap resonance ) "cuadrop.jpg" ( make-posn 450 40 ) );se imprime la imagen de uno de los cuadros en la ventana "resonance"

   ( ( draw-pixmap resonance ) "flecha.png" ( make-posn 50 0 ) );se imprime la imagen de una de las flechas que indica el eje en el que van los valores
   ( ( draw-pixmap resonance ) "flechay.png" ( make-posn 5 40 ) );se imprime la imagen de una de las flechas que indica el eje en el que van los valores
   ( ( draw-string resonance ) ( make-posn 10 155 ) "Y" );se imprime en forma de string la letra que indica el eje en el que van los datos
   ( ( draw-string resonance ) ( make-posn 155 15 ) "X" );se imprime en forma de string la letra que indica el eje en el que van los datos
   ( ( draw-string resonance ) ( make-posn 122 35 ) "x+1" );se imprime en forma de string la letra que indica el eje en el que van los datos
   ( ( draw-string resonance ) ( make-posn 95 35 ) "x" );se imprime en forma de string la letra que indica el eje en el que van los datos
   ( ( draw-string resonance ) ( make-posn 55 35 ) "x-1" );se imprime en forma de string la letra que indica el eje en el que van los datos
   ( ( draw-string resonance ) ( make-posn 26 60 ) "y-1" );se imprime en forma de string la letra que indica el eje en el que van los datos
   ( ( draw-string resonance ) ( make-posn 26 93 ) "y" );se imprime en forma de string la letra que indica el eje en el que van los datos
   ( ( draw-string resonance ) ( make-posn 26 126 ) "y+1" );se imprime en forma de string la letra que indica el eje en el que van los datos


   ( ( draw-pixmap resonance ) "flecha.png" ( make-posn 250 0 ) );se imprime la imagen de una de las flechas que indica el eje en el que van los valores
   ( ( draw-pixmap resonance ) "flechay.png" ( make-posn 205 40 ) );se imprime la imagen de una de las flechas que indica el eje en el que van los valores
   ( ( draw-string resonance ) ( make-posn 210 155 ) "Y" );se imprime en forma de string la letra que indica el eje en el que van los datos
   ( ( draw-string resonance ) ( make-posn 355 15 ) "X" );se imprime en forma de string la letra que indica el eje en el que van los datos
   ( ( draw-string resonance ) ( make-posn 322 35 ) "X+1" );se imprime en forma de string la letra que indica el eje en el que van los datos
   ( ( draw-string resonance ) ( make-posn 295 35 ) "X" );se imprime en forma de string la letra que indica el eje en el que van los datos
   ( ( draw-string resonance ) ( make-posn 255 35 ) "X-1" );se imprime en forma de string la letra que indica el eje en el que van los datos
   ( ( draw-string resonance ) ( make-posn 226 60 ) "y-1" );se imprime en forma de string la letra que indica el eje en el que van los datos
   ( ( draw-string resonance ) ( make-posn 226 93 ) "y" );se imprime en forma de string la letra que indica el eje en el que van los datos
   ( ( draw-string resonance ) ( make-posn 226 126 ) "y+1" );se imprime en forma de string la letra que indica el eje en el que van los datos



   ( ( draw-pixmap resonance ) "flecha.png" ( make-posn 450 0 ) );se imprime la imagen de una de las flechas que indica el eje en el que van los valores
   ( ( draw-pixmap resonance ) "flechay.png" ( make-posn 405 40 ) );se imprime la imagen de una de las flechas que indica el eje en el que van los valores
   ( ( draw-string resonance ) ( make-posn 410 155 ) "Y" );se imprime en forma de string la letra que indica el eje en el que van los datos
   ( ( draw-string resonance ) ( make-posn 555 15 ) "X" );se imprime en forma de string la letra que indica el eje en el que van los datos
   ( ( draw-string resonance ) ( make-posn 522 35 ) "X+1" );se imprime en forma de string la letra que indica el eje en el que van los datos
   ( ( draw-string resonance ) ( make-posn 495 35 ) "X" );se imprime en forma de string la letra que indica el eje en el que van los datos
   ( ( draw-string resonance ) ( make-posn 455 35 ) "X-1" );se imprime en forma de string la letra que indica el eje en el que van los datos
   ( ( draw-string resonance ) ( make-posn 426 60 ) "y-1" );se imprime en forma de string la letra que indica el eje en el que van los datos
   ( ( draw-string resonance ) ( make-posn 426 93 ) "y" );se imprime en forma de string la letra que indica el eje en el que van los datos
   ( ( draw-string resonance ) ( make-posn 426 126 ) "y+1" );se imprime en forma de string la letra que indica el eje en el que van los datos

   ( if ( string=? mode "string" )
        ( if ( string=? ( DataReader data (+ x (* y 100 ) (* z 10000 ) ) 0 (* z 10000 ) z resonance ) "sus" )
             ( ( draw-string resonance ) ( make-posn 250 250 ) "Punto sospechoso" )
             ;else
             ( ( draw-string resonance ) ( make-posn 250 250 ) "No es sospechoso" )
             );fin if
        ( if ( string=? ( VecReader data (+ x (* y 100 ) (* z 10000 ) ) 0 (* z  10000 ) z resonance ) "sus" )
             ( ( draw-string resonance ) ( make-posn 250 250 ) "Punto sospechoso" )
             ;else
             ( ( draw-string resonance ) ( make-posn 250 250 ) "No es sospechoso" )
             );fin if
        )
   )
;se imprime en la ventana "resonance" si el valor del punto que ingresamos es sospechoso o no

;En esta seccion se imprimen la mayoria de las imagenes que van por defecto en la ventana del programa
;------------------------------------------------------------------------------------------------------------------------------------------
   
  

( define ( PageReader data number x y counter line susLineCounter pass verifier page viewport );se define la funcion que imprime y lee cuantas lineas sospechosas hay en un plano
   
   ( if (= line 99 )
        ( if (= verifier 1 )
             (- susLineCounter 1 )
             ;else
             ( void )
             );fin if
        ;else
        ( if (= counter 99 )
             ( PageReader data (+ number 1 ) 18 (+ y 9 ) (- counter 99 ) (+ line 1 ) susLineCounter pass verifier page viewport )
             ;else
             ( if ( and ( string=? ( DataReader data number 1 page 0 "" ) "sus" ) ( string=? ( DataReader data (+ number 1 ) 1 page 0 "" ) "sus" ) ( string=? ( DataReader data (+ number 2 ) 1 page 0 "" ) "sus" ) )
                  ( if (= verifier 1 )
                       ( PageReader data (+ number 1 ) (+ x 9 ) y (+ counter 1 ) line susLineCounter 0 verifier page viewport)
                       ;else
                       ( begin
                          ( ( draw-solid-rectangle viewport ) ( make-posn x y ) 8 8 "red" )
                          ( ( draw-solid-rectangle viewport ) ( make-posn (+ x 9 ) y ) 8 8 "red" )
                          ( ( draw-solid-rectangle viewport ) ( make-posn (+ x 18 ) y ) 8 8 "red" )
                          ( PageReader data (+ number 1 ) (+ x 9 ) y (+ counter 1 ) line susLineCounter 0 verifier page viewport )
                          );fin begin
                       );fin if
                  ;else
                  ( PageReader data (+ number 1 ) (+ x 9 ) y (+ counter 1 ) line ( if (= pass 0 )
                                                                                      (+ susLineCounter 1 )
                                                                                      susLineCounter ) 1 verifier page viewport )
                  );fin if
             );fin if
        );fin if
   );fin definicion funcion PageReader


( define ( PageReader2 data number x y counter line susLineCounter pass verifier page viewport );se define la funcion que imprime y lee cuantas lineas sospechosas hay en un plano
   
   ( if (= line 99 )
        ( if (= verifier 1 )
             (- susLineCounter 1 )
             ;else
             ( void )
             );fin if
        ;else
        ( if (= counter 99 )
             ( PageReader2 data (+ number 1 ) 18 (+ y 9 ) (- counter 99 ) (+ line 1 ) susLineCounter pass verifier page viewport )
             ;else
             ( if ( and ( string=? ( VecReader data number 1 page 0 "" ) "sus" ) ( string=? ( VecReader data (+ number 1 ) 1 page 0 "" ) "sus" ) ( string=? ( VecReader data (+ number 2 ) 1 page 0 "" ) "sus" ) )
                  ( if (= verifier 1 )
                       ( PageReader2 data (+ number 1 ) (+ x 9 ) y (+ counter 1 ) line susLineCounter 0 verifier page viewport)
                       ;else
                       ( begin
                          ( ( draw-solid-rectangle viewport ) ( make-posn x y ) 8 8 "red" )
                          ( ( draw-solid-rectangle viewport ) ( make-posn (+ x 9 ) y ) 8 8 "red" )
                          ( ( draw-solid-rectangle viewport ) ( make-posn (+ x 18 ) y ) 8 8 "red" )
                          ( PageReader2 data (+ number 1 ) (+ x 9 ) y (+ counter 1 ) line susLineCounter 0 verifier page viewport )
                          );fin begin
                       );fin if
                  ;else
                  ( PageReader2 data (+ number 1 ) (+ x 9 ) y (+ counter 1 ) line ( if (= pass 0 )
                                                                                       (+ susLineCounter 1 )
                                                                                       susLineCounter ) 1 verifier page viewport )
                  );fin if
             );fin if
        );fin if
   );fin definicion funcion PageReader

;Esta funcion imprime las lineas sospechosas y ademas las devuelve para que este valor pueda ser usado en la siguiente funcion, tambien usa un verificador que solo imprime valores si este es igual 0 
;------------------------------------------------------------------------------------------------------------------------------------------

( define ( Scanner data number )
   (  define res ( open-viewport "Escaner de paginas" 950 950  ) )
   ( ( draw-pixmap res ) "tabla.jpg" ( make-posn 0 0 ) );se imprime la imagen de la tabla en la ventana
   ( ( draw-line res ) ( make-posn 9 9 ) ( make-posn 928 9 ) );se imprimen unas lineas para unir las flechas
   ( ( draw-line res ) ( make-posn 9 9 ) ( make-posn 9 928 ) );se imprimen unas lineas para unir las flechas
   ( ( draw-pixmap res ) "punta.png" ( make-posn 918 0 ) );se imprime la imagen de una de las flechas que indica el eje en el que van los valores
   ( ( draw-pixmap res ) "puntaa.png" ( make-posn 0 918 ) );se imprime la imagen de una de las flechas que indica el eje en el que van los valores
   ( ( draw-string res ) ( make-posn 930 15 ) "X" );se imprime en forma de string la letra que indica el eje en el que van los datos
   ( ( draw-string res ) ( make-posn 5 945 ) "Y" );se imprime en forma de string la letra que indica el eje en el que van los datos
   ( PageReader data (* number 10000 ) 18 18 0 0 0 0 0 (* number 10000 ) res ) )

( define ( Scanner2 data number )
   (  define res ( open-viewport "Escaner de paginas" 950 950  ) )
   ( ( draw-pixmap res ) "tabla.jpg" ( make-posn 0 0 ) );se imprime la imagen de la tabla en la ventana
   ( ( draw-line res ) ( make-posn 9 9 ) ( make-posn 928 9 ) );se imprimen unas lineas para unir las flechas
   ( ( draw-line res ) ( make-posn 9 9 ) ( make-posn 9 928 ) );se imprimen unas lineas para unir las flechas
   ( ( draw-pixmap res ) "punta.png" ( make-posn 918 0 ) );se imprime la imagen de una de las flechas que indica el eje en el que van los valores
   ( ( draw-pixmap res ) "puntaa.png" ( make-posn 0 918 ) );se imprime la imagen de una de las flechas que indica el eje en el que van los valores
   ( ( draw-string res ) ( make-posn 930 15 ) "X" );se imprime en forma de string la letra que indica el eje en el que van los datos
   ( ( draw-string res ) ( make-posn 5 945 ) "Y" );se imprime en forma de string la letra que indica el eje en el que van los datos
   ( PageReader2 data (* number 10000 ) 18 18 0 0 0 0 0 (* number 10000 ) res ) )

;------------------------------------------------------------------------------------------------------------------------------------------

( define ( Inform )
   
   ( define ( PointCounter counter number page points );esta funcion auxiliar lee cuantos puntos sospechosos hay en un plano y los devuelve a la funcion ChartMaker
      ( if (= counter 10000 )
           points
           ;else
           ( if ( string=? (DataReader mainString (- number 1 ) 1 page 0 "" ) "sus" )
                ( PointCounter (+ counter 1 ) (+ number 1 ) page (+ points 1 ) )
                ;else
                ( PointCounter (+ counter 1 ) (+ number 1 ) page points )
                );fin if
           );fin if
      );fin definicion funcion PointCounter

   ( define ( MaxLines page maxim maximPage );esta funcion lee cual es el plano con mayor numero de lineas sospechosas
      ( if (= page 99 )
           ( begin
           ( printf (~a "La página con más lineas sospechosas es " maximPage " con " maxim "\n" ) )
           ( Scanner mainString maximPage ) )
           
           ;else
           ( if (< maxim ( PageReader mainString (* page 10000 ) 18 18 0 0 0 0 1 (* page 10000 ) "" ) )
                ( MaxLines (+ page 1 ) ( PageReader mainString (* page 10000 ) 18 18 0 0 0 0 1 (* page 10000 ) "" ) page )
                ;else
                ( MaxLines (+ page 1 ) maxim maximPage )
                );fin if
           );fin if
      );fin definicion funcion MaxLines

       ( MaxLines 1 0 0 )

       ( define ( MaxPoints page min minPage );esta funcion lee cual es el plano con mayor numero de lineas sospechosas
        ( if (= page 99 )
             ( begin
             ( printf (~a "La página con menos puntos sospechosos es " minPage " con " min "\n" ) )
             ( Scanner mainString minPage )
             )
             ;else
             ( if (> min ( PointCounter 0 (* page 10000 ) (* page 10000 ) 0 )  )
                  ( MaxPoints (+ page 1 ) ( PointCounter 0 (* page 10000 ) (* page 10000 ) 0 ) page ) 
                  ;else
                  ( MaxPoints (+ page 1 ) min  minPage )
                  );fin if
             );fin if
        );fin definicion funcion MaxPoints

       ( MaxPoints 1 ( PointCounter 0 (* 1 10000 ) (* 1 10000 ) 0 ) 1 )


   )

;------------------------------------------------------------------------------------------------------------------------------------------

( define ( Inform2 )
   
   ( define ( PointCounter counter number page points );esta funcion auxiliar lee cuantos puntos sospechosos hay en un plano y los devuelve a la funcion ChartMaker
      ( if (= counter 10000 )
           points
           ;else
           ( if ( string=? (VecReader mainVec (- number 1 ) 1 page 0 "" ) "sus" )
                ( PointCounter (+ counter 1 ) (+ number 1 ) page (+ points 1 ) )
                ;else
                ( PointCounter (+ counter 1 ) (+ number 1 ) page points )
                );fin if
           );fin if
      );fin definicion funcion PointCounter

   ( define ( MaxLines page maxim maximPage );esta funcion lee cual es el plano con mayor numero de lineas sospechosas
      ( if (= page 99 )
           ( begin
           ( printf (~a "La página con más lineas sospechosas es " maximPage " con " maxim "\n" ) )
           ( Scanner2 mainVec maximPage ) )
           ;else
           ( if (< maxim ( PageReader2 mainVec (* page 10000 ) 18 18 0 0 0 0 1 (* page 10000 ) "" ) )
                ( MaxLines (+ page 1 ) ( PageReader2 mainVec (* page 10000 ) 18 18 0 0 0 0 1 (* page 10000 ) "" ) page )
                ;else
                ( MaxLines (+ page 1 ) maxim maximPage )
                );fin if
           );fin if
      );fin definicion funcion MaxLines

( MaxLines 1 0 0 )

( define ( MaxPoints page min minPage );esta funcion lee cual es el plano con mayor numero de lineas sospechosas   
 ( if (= page 99 )
      ( begin
      ( printf (~a "La página con menos puntos sospechosos es " minPage " con " min "\n" ) )
      ( Scanner2 mainVec minPage )
      )
      ;else
      ( if (> min ( PointCounter 0 (* page 10000 ) (* page 10000 ) 0 ) )
           ( MaxPoints (+ page 1 ) ( PointCounter 0 (* page 10000 ) (* page 10000 ) 0 ) page )
           ;else
           ( MaxPoints (+ page 1 ) min minPage )
           );fin if
      );fin if
 );fin definicion funcion MaxPoints

( MaxPoints 1 ( PointCounter 0 (* 1 10000 ) (* 1 10000 ) 0 ) 0 )

   )

;En esta seccion se crean las funciones que se usan para crear el cuadro que nos muesta los valores de cada plano, en estas se usan la funciones anteriores para hacer mas optimo el programa, tambien se hace uso de una funcion auxiliar para que se mas rapido el proceso
;------------------------------------------------------------------------------------------------------------------------------------------

( define ( StringMode )
   
   ( displayln "Modo String:\n" )
   ( displayln "Elija la funcion que quiere usar:\n1.Escanear un punto.\n2.Escanear una pagina\n3.Informe general\n4.Volver\n")
   ( define option ( Reader2 ( read ) ) );se define option para escoger la funcion
   ( if (= option 1 )
        ( begin
           ( displayln "Opcion elegida: Escaner de un punto" )
           ( SearchPoint mainString "string" )
           ( displayln "Desea seguir? (Escriba s para seguir o n para salir)" )
           ( if ( string=? ( Asker (~a ( read ) ) ) "s")
                ( StringMode )
                ( void ) );fin if
           );fin begin
        ( if (= option 2 )
             ( begin
                ( displayln "Opcion elegida: Escaner de una pagina" )
                ( displayln "Ingrese el número de página a escanear:")
                ( Scanner mainString ( limiter ( read ) ) )
                ( displayln "Desea seguir? (Escriba s para seguir o n para salir)" )
                ( if ( string=? ( Asker (~a ( read ) ) ) "s")
                     ( StringMode )
                     ( void ) );fin if
                );fin begin
             ( if (= option 3 )
                  ( begin
                     ( displayln "Opcion elegida: Informe general" )
                     ( Inform )
                     ( displayln "Desea seguir? (Escriba s para seguir o n para salir)" )
                     ( if ( string=? ( Asker (~a ( read ) ) ) "s")
                          ( StringMode )
                          ( void ) );fin if
                     );fin begin
                  ( MainMenu )
                  );fin if
             );fin if
        );fin if
   );fin definicion funcion StringMode

( define ( VectorMode )
   ( displayln "Modo Vector:\n" )
   ( displayln "Elija la funcion que quiere usar:\n1.Escanear un punto.\n2.Escanear una pagina\n3.Informe general\n4.Volver\n")
   ( define option ( Reader2 ( read ) ) );se define option para escoger la funcion
   ( if (= option 1 )
        ( begin
           ( displayln "Opcion elegida: Escaner de un punto" )
           ( SearchPoint mainVec "vector" )
           ( displayln "Desea seguir? (Escriba s para seguir o n para salir)" )
           ( if ( string=? ( Asker (~a ( read ) ) ) "s")
                ( VectorMode )
                ( void ) );fin if
           );fin begin
        ( if (= option 2 )
             ( begin
                ( displayln "Opcion elegida: Escaner de una pagina" )
                ( displayln "Ingrese el número de página a escanear:")
                ( Scanner2 mainVec ( limiter ( read ) ) )
                ( displayln "Desea seguir? (Escriba s para seguir o n para salir)" )
                ( if ( string=? ( Asker (~a ( read ) ) ) "s")
                     ( VectorMode )
                     ( void ) );fin if
                );fin begin
             ( if (= option 3 )
                  ( begin
                     ( displayln "Opcion elegida: Informe general" )
                     ( Inform2 )
                     ( displayln "Desea seguir? (Escriba s para seguir o n para salir)" )
                     ( if ( string=? ( Asker (~a ( read ) ) ) "s")
                          ( VectorMode )
                          ( void ) );fin if
                     );fin begin
                  ( MainMenu ) );fin if
             );fin if
        );fin if
   );fin definición función VectorMode
( MainMenu );se llama a la función del menú para activar el código

;Fin del codigo
;------------------------------------------------------------------------------------------------------------------------------------------
