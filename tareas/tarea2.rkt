#|
Tarea 2 Next Day
Saúl Enrique Labra Cruz A01020725
08/09/2019
|#

;pendiente -> componer parámetros de listas y terminar caso "febrero"

(define (prueba_lista a b c)
    (display (string-append (number->string a) " " (number->string b) " " (number->string c)))
)

;Next_day function
(define (next_day '(a b c))
    (if (< a 28) 
        (list (+ a 1) b c)
        ;else
        (cond
            ;Month has 31 days 
            [
                (and (>= b 1) (<= b 7) (not (exact-positive-integer? (/ b 2)))) 
                (month_with_31 a b c)
            ]

            ;Month has 31 days
            [
                (and (>= b 8) (<= b 12) (exact-positive-integer? (/ b 2)))
                (month_with_31 a b c)
            ]

            ;Month has 30 days
            [
                (and (>= b 4) (<= b 6) (exact-positive-integer? (/ b 2)))
                (month_with_30 a b c)
            ]

            ;Month has 30 days
            [
                (and (>= b 9) (<= b 11) (not (exact-positive-integer? (/ b 2))))
                (month_with_30 a b c)
            ]

            ;February
            ;[
            ;    (equals? b 2)

            ;]
        )
    )
)

(define (month_with_31 '(a b c))
    (if (< a 31) 
        (list (+ a 1) b c)
        ;else 
        (if (not (equals? b 12)) 
            (list 1 (+ b 1) c)
            ;else
            (list 1 1 (+ c 1))
        ) 
    )
)

(define (month_with_30 '(a b c))
    (if (< a 30) 
        (list (+ a 1) b c)
        ;else 
        (list 1 1 (+ c 1))
    )
)

#|(define (february '(a b c))
    (if (true? (leap_year c))
        
    )
)|#

(define (leap_year year)
    (if (exact-positive-integer? (/ year 4)) (if (exact-positive-integer? (/ year 100)) (if (exact-positive-integer? (/ year 400)) #t #f)#t) #f)
)