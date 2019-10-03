#|
    Recursion exercises
|#

;Recursive multiplication function
(define (multiply a b)
    (case b
        [ (0) 0 ]
        [ (1) a ]
        [else (+ a (multiply a (- b 1)))]
    )
)

;Recursion with tail
(define (multiply_2 a b)
    (multiply_tail a b 0)
)

(define (multiply_tail a b result)
    (if (<= b 0)
        result
        (multiply_tail a (- b 1) (+ result a))
    )
)

;Recursive summatory of all elements in a list
(define (sum_elements a)
    (sum_elements_tail a 0)
)


(define (sum_elements_tail a result)
    (if (empty? a) 
        result 
        (sum_elements_tail (cdr a) (+ result (car a)))
    )
)

;Function that takes a list and returns it backwards
(define (invert_list list1)
    (invert_list_tail list1 (length list1) 0)
)

(define (invert_list_tail list1 lengthList count)
    (if (>= count lengthList)
        list1
        (invert_list_tail (append (cdr list1) (list (car list1))) lengthList (+ count 1))    
    )
)