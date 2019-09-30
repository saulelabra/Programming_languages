#|
List comprehensions

Saúl Enrique Labra Cruz
30/09/2019
|#

;List of numbers --> get the second power of each of them
(define (squares data)
    (let loop
        (
            [lst data]
            [results empty]
        )

        (
            if (empty? lst)
                results
                (loop (cdr lst) (append results (list (* (car lst) (car lst)))))
        )
    )
)

;Using map and lamda functions
(define (squares-map data)
    (map (lambda (x) (* x x)) data)
)

;Using list comprehensions
(define (squares-for data)
    ;for i in data:
    (for/list ([i data] #:when (= (remainder i 2) 0));variante de "for" que crea en automático una lista
        (* i i)
    )
)