#|
Find numbers that are divisible up to the input

Saúl Enrique Labra Cruz
|#

;Check if test is divisible by all integers from 2 to limit
(define (divisible? test limit)
    (if (= limit 1)
        #t
        (if (= 0 (remainder test limit))
            (divisible? test (- limit 1))
            ;else
            #f
        )
    )
)

;Find the smallest integer divisible by all numbers from 2 to limit
(define (divisible-up-to limit)
    (let loop
        ;parameters
        (
            [test (* limit (- limit 1))]
            [limit limit]
        )
        ;function
        (
            (if (divisible? test limit)
                ;this is already the solution
                test
                ;else: Check a different candidate
                (loop (+ test limit) limit)
            )
        )
    )
)