#|
Operations with threads that have a name
|#

#lang racket

(define (main)
    (display "The main thread\n")
    (define counter 
        (thread 
            (lambda ()
                (let loop
                    ([n 0])
                    (if (< n 10)
                        (begin
                            (printf "Iteration ~a in thread\n" n)
                            (sleep 0.2)
                            (loop (+ n 1))
                        )
                        
                        (printf "Thread finishing\n")
                    )
                )
            )
        )
    )

    (sleep 1)
    (kill-thread counter)

    (display "Main thread finishing\n")
)