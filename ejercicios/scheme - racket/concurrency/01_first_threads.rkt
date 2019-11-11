#|
First example of using threads in Racket
|#

#lang racket

;A function to be executed in another thread
;Replaced with lambda function
#|(define (starting)
    (display "This is the thread")
)|#


(define (main) 
    (display "Main thread\n")

    ;Run the thread
    (thread (lambda () (printf "Thread 1: ~a\n" (current-thread))))
    (thread (lambda () (printf "Thread 2: ~a\n" (current-thread))))
    (thread (lambda () (printf "Thread 3: ~a\n" (current-thread))))
    ;Wait some time on this thread
    (sleep 2)
    (display "Main finishing\n")
)