#|
Ejercicio1

Saúl Enrique Labra Cruz
02/09/2019
|#

;Celcius to Fahrenheit
(define (C->F celcius)
    (+ (* celcius (/ 9 5)) 32)
)

;Fahrenheit to Celcius
(define (F->C fahrenheit)
    (* (- fahrenheit 32) (/ 5 9))
)

;Area of triangle based on sides
(define (areaTriangle a b c)
    (sqrt (* (/ (+ a (+ b c)) 2) (* (- (/ (+ a (+ b c)) 2) a) (* (- (/ (+ a (+ b c)) 2) b) (- (/ (+ a (+ b c)) 2) c)))))
)