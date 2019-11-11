#|
Sending messages between threads
|#

#lang racket

(define (counter-fun)
    ;Loop inside the thread function
    (let loop
        ()
        (if (= (thread-receive) 'hello)
            (begin
                (printf "Iteration ~a in thread\n" n)
                (sleep 0.2)
                (loop)
            )
            
            (printf "Thread finishing\n")
        )
    )
)

(define (main)
    (display "The main thread\n")
    ;Create e new thread with the name "counter"
    (define counter (thread counter-fun))
    ;Loop to send messages to the thread
    (let loop
        ([n 0])
        (if (< n 10)
            (begin
                (thread-send counter 'hello)
                (loop (+ n 1))
            )
            
            (thread-send counter 'finish)
        )
    )
    ;Main thread waiths for the thread to finish
    ;Main thread waits for the thread to finish
    (sleep 1)
    (kill-thread counter)

    (display "Main thread finishing\n")
)