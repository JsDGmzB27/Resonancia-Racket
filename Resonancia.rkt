#lang racket

( require graphics/graphics  )
( open-graphics )
( require racket/flonum )

( define resonance ( open-viewport "Resonancia" 1500 918 ) )
( ( draw-pixmap resonance ) "tabla.jpg" ( make-posn 0 0 ) )
( ( draw-pixmap resonance ) "cuadrop.jpg" ( make-posn 1175 30 ) )
( ( draw-pixmap resonance ) "cuadrop.jpg" ( make-posn 1000 30 ) )
( ( draw-pixmap resonance ) "cuadrop.jpg" ( make-posn 1350 30 ) )
( define ( NeuroString string counter )
   ( if ( < counter 10000 )
        ( NeuroString ( string-append
                        string
                        (~a ( integer->char ( random 19 41 ) ) ) ) (+ counter 1 ) )
        string ) )

( define ( DeadPacient string counter )
   ( if ( < counter 10000 )
        ( if ( and (> counter 4500 ) (< counter 5100 ) )
         ( DeadPacient ( string-append
                        string
                        (~a ( integer->char ( random 19 41 ) ) ) ) (+ counter 1 ) )
        ( DeadPacient ( string-append
                        string
                        (~a ( integer->char ( random 0 256 ) ) ) ) (+ counter 1 ) ) )
        string ) )

( define ( PageMaker string counter )
   ( if (< counter 100 )
        ( if ( and (> counter 30 )  (< counter 60 ) )
             ( PageMaker ( string-append string ( DeadPacient "" 0 ) ) (+ counter 1 ) )
             ( PageMaker ( string-append string ( NeuroString "" 0 ) ) (+ counter 1 ) ) )
         string ) )

( define hola ( PageMaker "" 0 ) )

( displayln "Ingrese las coordenadas en X, Y y Z del punto que quiere analizar\n
(X: para la posicion hacia la derecha o la izquierda desde el 2 hasta el 99)
(Y: para la posicion hacia arriba o abajo desde la linea 2 hasta la 99)
(Z: para el numero de página desde la 2 hasta la 99):\n" )

( define ( limiter number )
   ( if ( or (<= number 0 ) (= number 1 ) (>= number 100 ) )
        ( begin
           ( displayln "Posición inválida, intente con otro valor.")
        ( limiter ( read ) ) )
        number ) )

( display "X:")
( define x ( limiter ( read ) ) )
( display "Y:" )
( define y ( limiter ( read ) ) )
( display "Z:" )
( define z ( limiter ( read ) ) )
( display "\n" )

( ( draw-string resonance ) ( make-posn 1175 200 ) (~a "Plano en z (hoja): " (~a z )  ) )
( ( draw-string resonance ) ( make-posn 1350 200 ) (~a "Plano en z (hoja): " (~a (+ z 1 ) ) ) )
( ( draw-string resonance ) ( make-posn 1000 200 ) (~a "Plano en z (hoja): " (~a (- z 1 ) ) ) )

;pagina escogida

( ( draw-solid-ellipse resonance ) ( make-posn 1213 67 ) 24 24 "red"  )
( ( draw-string resonance ) ( make-posn 1181 87 ) (~a ( char->integer ( string-ref hola (- (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 1 ) ) ) ) )
( ( draw-string resonance ) ( make-posn 1246 87 ) (~a ( char->integer ( string-ref hola (+ (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 1 ) ) ) ) )

( ( draw-string resonance ) ( make-posn 1181 54 ) (~a ( char->integer ( string-ref hola (- (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 101 ) ) ) ) )
( ( draw-string resonance ) ( make-posn 1213 54 ) (~a ( char->integer ( string-ref hola (- (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 100 ) ) ) ) )
( ( draw-string resonance ) ( make-posn 1246 54 ) (~a ( char->integer ( string-ref hola (- (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 99 ) ) ) ) )

( ( draw-string resonance ) ( make-posn 1246 120 ) (~a ( char->integer ( string-ref hola (+ (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 101 ) ) ) ) )
( ( draw-string resonance ) ( make-posn 1213 120 ) (~a ( char->integer ( string-ref hola (+ (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 100 ) ) ) ) )
( ( draw-string resonance ) ( make-posn 1181 120 ) (~a ( char->integer ( string-ref hola (+ (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 99 ) ) ) ) )

;pagina anterior

( ( draw-string resonance ) ( make-posn 1039 87 ) (~a ( char->integer ( string-ref hola (- (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 10000 ) ) ) ) )
( ( draw-string resonance ) ( make-posn 1006 87 ) (~a ( char->integer ( string-ref hola (- (- (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 1 ) 10000 ) ) ) ) )
( ( draw-string resonance ) ( make-posn 1072 87 ) (~a ( char->integer ( string-ref hola (- (+ (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 1 ) 10000 ) ) ) ) )

( ( draw-string resonance ) ( make-posn 1006 54 ) (~a ( char->integer ( string-ref hola (- (- (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 101 ) 10000 ) ) ) ) )
( ( draw-string resonance ) ( make-posn 1039 54 ) (~a ( char->integer ( string-ref hola (- (- (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 100 ) 10000 ) ) ) ) )
( ( draw-string resonance ) ( make-posn 1072 54 ) (~a ( char->integer ( string-ref hola (- (- (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 99 ) 10000 ) ) ) ) )

( ( draw-string resonance ) ( make-posn 1072 120 ) (~a ( char->integer ( string-ref hola (- (+ (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 101 ) 10000 ) ) ) ) )
( ( draw-string resonance ) ( make-posn 1039 120 ) (~a ( char->integer ( string-ref hola (- (+ (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 100 ) 10000 ) ) ) ) )
( ( draw-string resonance ) ( make-posn 1006 120 ) (~a ( char->integer ( string-ref hola (- (+ (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 99 ) 10000 ) ) ) ) )

;pagina superior

( ( draw-string resonance ) ( make-posn 1388 87 ) (~a ( char->integer ( string-ref hola (+ (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 10000 ) ) ) ) )
( ( draw-string resonance ) ( make-posn 1355 87 ) (~a ( char->integer ( string-ref hola (+ (- (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 1 ) 10000 ) ) ) ) )
( ( draw-string resonance ) ( make-posn 1421 87 ) (~a ( char->integer ( string-ref hola (+ (+ (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 1 ) 10000 ) ) ) ) )

( ( draw-string resonance ) ( make-posn 1355 54 ) (~a ( char->integer ( string-ref hola (+ (- (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 101 ) 10000 ) ) ) ) )
( ( draw-string resonance ) ( make-posn 1388 54 ) (~a ( char->integer ( string-ref hola (+ (- (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 100 ) 10000 ) ) ) ) )
( ( draw-string resonance ) ( make-posn 1421 54 ) (~a ( char->integer ( string-ref hola (+ (- (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 99 ) 10000 ) ) ) ) )

( ( draw-string resonance ) ( make-posn 1421 120 ) (~a ( char->integer ( string-ref hola (+ (+ (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 101 ) 10000 ) ) ) ) )
( ( draw-string resonance ) ( make-posn 1388 120 ) (~a ( char->integer ( string-ref hola (+ (+ (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 100 ) 10000 ) ) ) ) )
( ( draw-string resonance ) ( make-posn 1355 120 ) (~a ( char->integer ( string-ref hola (+ (+ (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 99 ) 10000 ) ) ) ) )

( define ( StringReader string x y z )
   ( if ( and (> ( char->integer ( string-ref string (- (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 1 ) ) ) 19 )
              (< ( char->integer ( string-ref string (- (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 1 ) ) ) 41 )
              (> ( char->integer ( string-ref string (+ (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 1 ) ) ) 19 )
              (< ( char->integer ( string-ref string (+ (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 1 ) ) ) 41 )
              
              (> ( char->integer ( string-ref string (- (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 100 ) ) ) 19 )
              (< ( char->integer ( string-ref string (- (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 100 ) ) ) 41 )
              (> ( char->integer ( string-ref string (+ (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 100 ) ) ) 19 )
              (< ( char->integer ( string-ref string (+ (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 100 ) ) ) 41 )

              (> ( char->integer ( string-ref string (- (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 101 ) ) ) 19 )
              (< ( char->integer ( string-ref string (- (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 101 ) ) ) 41 )
              (> ( char->integer ( string-ref string (+ (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 101 ) ) ) 19 )
              (< ( char->integer ( string-ref string (+ (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 101 ) ) ) 41 )

              (> ( char->integer ( string-ref string (- (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 99 ) ) ) 19 )
              (< ( char->integer ( string-ref string (- (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 99 ) ) ) 41 )
              (> ( char->integer ( string-ref string (+ (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 99 ) ) ) 19 )
              (< ( char->integer ( string-ref string (+ (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 99 ) ) ) 41 )

              ;Pagina anterior

              (> ( char->integer ( string-ref string (- (- (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 1 ) 10000 ) ) ) 19 )
              (< ( char->integer ( string-ref string (- (- (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 1 ) 10000 ) ) ) 41 )
              (> ( char->integer ( string-ref string (- (+ (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 1 ) 10000 ) ) ) 19 )
              (< ( char->integer ( string-ref string (- (+ (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 1 ) 10000 ) ) ) 41 )
              
              (> ( char->integer ( string-ref string (- (- (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 100 ) 10000 ) ) ) 19 )
              (< ( char->integer ( string-ref string (- (- (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 100 ) 10000 ) ) ) 41 )
              (> ( char->integer ( string-ref string (- (+ (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 100 ) 10000 ) ) ) 19 )
              (< ( char->integer ( string-ref string (- (+ (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 100 ) 10000 ) ) ) 41 )

              (> ( char->integer ( string-ref string (- (- (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 101 ) 10000 ) ) ) 19 )
              (< ( char->integer ( string-ref string (- (- (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 101 ) 10000 ) ) ) 41 )
              (> ( char->integer ( string-ref string (- (+ (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 101 ) 10000 ) ) ) 19 )
              (< ( char->integer ( string-ref string (- (+ (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 101 ) 10000 ) ) ) 41 )

              (> ( char->integer ( string-ref string (- (- (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 99 ) 10000 ) ) ) 19 )
              (< ( char->integer ( string-ref string (- (- (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 99 ) 10000 ) ) ) 41 )
              (> ( char->integer ( string-ref string (- (+ (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 99 ) 10000 ) ) ) 19 )
              (< ( char->integer ( string-ref string (- (+ (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 99 ) 10000 ) ) ) 41 )

              (> ( char->integer ( string-ref string (- (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 10000 ) ) ) 19 )
              (< ( char->integer ( string-ref string (- (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 10000 ) ) ) 41 )

              ;Pagina superior
              
              (> ( char->integer ( string-ref string (+ (- (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 1 ) 10000 ) ) ) 19 )
              (< ( char->integer ( string-ref string (+ (- (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 1 ) 10000 ) ) ) 41 )
              (> ( char->integer ( string-ref string (+ (+ (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 1 ) 10000 ) ) ) 19 )
              (< ( char->integer ( string-ref string (+ (+ (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 1 ) 10000 ) ) ) 41 )
              
              (> ( char->integer ( string-ref string (+ (- (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 100 ) 10000 ) ) ) 19 )
              (< ( char->integer ( string-ref string (+ (- (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 100 ) 10000 ) ) ) 41 )
              (> ( char->integer ( string-ref string (+ (+ (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 100 ) 10000 ) ) ) 19 )
              (< ( char->integer ( string-ref string (+ (+ (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 100 ) 10000 ) ) ) 41 )

              (> ( char->integer ( string-ref string (+ (- (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 101 ) 10000 ) ) ) 19 )
              (< ( char->integer ( string-ref string (+ (- (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 101 ) 10000 ) ) ) 41 )
              (> ( char->integer ( string-ref string (+ (+ (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 101 ) 10000 ) ) ) 19 )
              (< ( char->integer ( string-ref string (+ (+ (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 101 ) 10000 ) ) ) 41 )

              (> ( char->integer ( string-ref string (+ (- (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 99 ) 10000 ) ) ) 19 )
              (< ( char->integer ( string-ref string (+ (- (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 99 ) 10000 ) ) ) 41 )
              (> ( char->integer ( string-ref string (+ (+ (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 99 ) 10000 ) ) ) 19 )
              (< ( char->integer ( string-ref string (+ (+ (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 99 ) 10000 ) ) ) 41 )

              (> ( char->integer ( string-ref string (+ (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 10000 ) ) ) 19 )
              (< ( char->integer ( string-ref string (+ (+ (- x 1 ) (* (- y 1 ) 100 ) (* (- z 1 ) 10000 ) ) 10000 ) ) ) 41 ) )
        
   ( display "Punto sospechoso" )
   ( display "No es sospechoso" ) ) )

( define ( SusLine string number )
   ( if ( and ( boolean=? ( fl= (/ number 100. ) .99 ) #f )
          ( boolean=?(=  (/ number (* ( floor (/ number 100 ) ) 100 ) ) 1 ) #f )
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
          (< ( char->integer ( string-ref string (+ number 10000 ) ) ) 41 ) )
        "sus"
        "no" ) )

( define ( PageReader string number x y line counter )
   ( if (= line 98 )
        ( void )
        ( if (= counter 0 )
             ( PageReader string (+ number 1 ) x y line (+ counter 1 ) )
        ( if (= counter 98 )
             ( PageReader string (+ number 1 ) 27 (+ y 9 ) (+ line 1 ) (- counter 98 ) )
             ( if ( and ( string=? ( SusLine string number ) ) ( or ( string=? ( SusLine string (+ number 1 ) ) "sus" ) ( string=? ( SusLine string (+ number 2 ) ) "sus" ) ) )
                  ( begin
                  ( ( draw-solid-rectangle resonance ) ( make-posn x y ) 8 8 "red" )
                  ( ( draw-solid-rectangle resonance ) ( make-posn (+ x 9 ) y ) 8 8 "red" )
                  ( ( draw-solid-rectangle resonance ) ( make-posn (+ x 18 ) y ) 8 8 "red" )
                  ( PageReader string (+ number 1 ) (+ x 9 ) y line (+ counter 1 ) ) )
                  ( PageReader string (+ number 1 ) (+ x 9 ) y line (+ counter 1 ) ) ) ) ) ) )

( PageReader hola (* z 10000 ) 27 27 0 0 )

( StringReader hola x y z )