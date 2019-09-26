#|
Saúl Enrique Labra Cruz
Managing files
|#

;Writing to a file named "out"
;Overwriting
(define out (open-output-file "test.txt"))

(display "This is only a test1\n" out)
(display "This is only a test2\n" out)
(display "This is only a test3\n" out)
(display "This is only a test4\n" out)
(close-output-port out)

;Reading from a file
(define in (open-input-file "test.txt"))
(read-line in)
(close-input-port in)