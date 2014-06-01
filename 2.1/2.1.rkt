#lang planet neil/sicp
;Exercise 2.1

(define (make-rat n d)
  (let ((g (gcd n d)))
    (let ((num (/ n g))
        (den (/ d g)))
    (if (> (* num den) 0)
        (cons (abs num) (abs den))
        (cons (- 0 (abs num)) (abs den))))))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))