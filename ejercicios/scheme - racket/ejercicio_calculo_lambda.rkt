#|
Function to replicate 'invert'
|#

;Regular recursion
(define (invert-string data)
    (if (empty? (cdr data))
        ;List of one element only
        data
        (append (invert-string (cdr data)) (list (car data)))
    )
)

;Entry point for a tail recursive method
(define (tail-invert data)
    (tail-invert-2 data '())
)

(define (tail-invert-2 data result)
    (if (empty? (cdr data))
        result
        (tail-invert-2 (cdr data) (append result (list (car data))))
    )
)

;Tail recursion using lambda function
(define (invert-tail data)
    (letrec 
    ( [loop (lambda (data result))]);letrec es similar a let* pero con funciones, deja utilizar la función "loop" definida dentro del let
        (if (empty? (cdr data))
            result
            (tail-invert-2 (cdr data) (append result (list (car data))))
        )
    )

    ;Call the recursive tail function
    (loop data '())
)

;;;Using named let
;The function takes only one argument
(define (let-invert data)
    (let loop
        (
            [lst data]
            [result '()]
        )
        
        (if empty? (cdr lst))
        (append lst result)
        (loop (cdr lst) (append (list (car lst)) result))
    )
)