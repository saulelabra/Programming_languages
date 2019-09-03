#|
Tarea 1 Quadratic equation
Saúl Enrique Labra Cruz A01020725
03/09/2019
|#

;Quadratic function that triggers both cases
(define (quadratic a b c)
    (if (equal? a 0) (display (special_case c b)) (display (normal_case a b c)))
)

;function that returns a single x (special case)
(define (special_case c b)
    (list (* -1 (/ c b)))
)

;function that triggers the general case
(define (normal_case a b c)
    (list (general_formula_pos a b c) (general_formula_neg a b c))
)

;function that returns the positive x
(define (general_formula_pos a b c)
    (/ (+ (* -1 b) (sqrt (- (* b b) (* 4 a c)))) (* 2 a))
)

;function that returns the negative x
(define (general_formula_neg a b c)
    (/ (- (* -1 b) (sqrt (- (* b b) (* 4 a c)))) (* 2 a))
)