#|
Saúl Enrique Labra Cruz A01020725
Tarea 4 - Prime Numbers
|#

;Receives as argument a number, and returns true or false, indicating whether the argument is a prime number
(define (prime? number)
    (let loop
        (
            [number number]
            [test 2]
        )

        (if (>= test number)
            #t
            (if (= 0 (remainder number test))
                #f
                (loop number (+ test 1))
            )
        )
    )
)

;Receives a number, and returns a list containing all the prime numbers smaller than the input. The first prime listed must be 2
(define (primes-less-than number)
    (let loop
        (
            [counter 2]
            [limit number]
            [results empty]
        )

        (if (>= counter limit)
            results
            (loop (+ counter 1) limit (if (prime? counter) (append results (list counter)) results))
        )
    )
)

;Receives a number, and returns the prime number at that position of the sequence of primes. The first prime is number 2, and the second prime is number 3
(define (nth-prime position)
    (let loop
        (
            [counter 0]
            [test 2]
            [limit position]
        )

        (if(>= counter limit)
            (- test 1)
            (loop (if(prime? test) (+ counter 1) counter) (+ test 1) limit)
        )
    )
)