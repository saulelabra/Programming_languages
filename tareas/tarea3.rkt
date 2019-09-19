#|
Tarea 3 Guess-game
Saúl Enrique Labra Cruz A01020725
19/09/2019
|#

(define (guess-game upper-limit)
   ;Obtain random number with upper limit and print
   (let* ([rnd_num (random (+ upper-limit 1))])
    (display (string-append "The random number is " (number->string rnd_num) "\n"))
    (display "Welcome to the Guess Number game!\n\n")
    (guess_tail rnd_num 1)
   )   
)

(define (guess_tail rnd_num tries)
    (display "Enter your guess\n")
    (define guess (read))

    (cond
        ;the guess is higher than the number
        [
            (> guess rnd_num)
            (display "Enter a lower number\n")
            (guess_tail rnd_num (+ tries 1))
        ]

        ;the guess is lower than the number
        [
            (< guess rnd_num)
            (display "Enter a higher number\n")
            (guess_tail rnd_num (+ tries 1))
        ]

        ;the guess is the number!
        [
            (= guess rnd_num)
            (display (string-append "Congratulations you won after " (number->string tries) " tries"))
        ]
    )
)