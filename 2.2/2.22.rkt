#lang planet neil/sicp
;Exercise 2.22
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items nil))

(define (square x) (* x x))
(square-list (list 1 2 3 4))

;Order is reversed originally because you are building the list by squaring the first item, then next iteration you are consing the second to the result.. 
;I've noticed this in my iterative implementation of same-parity. This is because of the way lists work in Scheme. You can cons a single element to the list because it
;will be implemented as a pair where car of it is your element and cdr is the list

;if you try and reversing the order as Louis did you end up with each list being consed to the pair which is wrong..
