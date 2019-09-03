#|
First program in Racket
    Valid extensions: .rkt or .scm

Saúl Enrique Labra Cruz
02/09/2019
|#

;Create a greeting function
(define (greeting name)
    (display (string-append "hello " name "!"))
)