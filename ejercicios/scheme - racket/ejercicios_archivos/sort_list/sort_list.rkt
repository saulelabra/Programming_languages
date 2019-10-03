#|
Sorting the elements of a file and writing them into another file
|#

(define in (open-input-file "example.txt"))

(define (read-numbers file list)
    (let 
        ([line (read-line file)])
        ; Check if the line could be read
        (if (eof-object? line)
            (display "Finished Reading\n")
            (begin
                (display list)
                (append list line)
                (display list)
                (read-numbers file list)
            )
        )
    )

    (close-input-port in)
)
;(call-with-input-file "example.txt" read-numbers)
