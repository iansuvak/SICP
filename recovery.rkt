
#lang planet neil/sicp

(display "Exercise 1.1\n")

10
(+ 5 3 4)
(- 9 1)
(/ 6 2)
(+ (* 2 4) (- 4 6))
(define a 3)
(define b (+ a 1))
(+ a b (* a b))
(= a b)
(if (and (> b a) (< b (* a b)))
    b
    a)
(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))
(+ 2 (if (> b a) b a))
(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1))

(display "Exercise 1.2\n")
(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
   (* 3 (- 6 2) (- 2 7)))

(display "Exercise 1.3\n")
(define (square a) (* a a))
(define (smallest? a b c) 
  (if (and (< a b) (< a c)) true false))
(define (exe-1.3 a b c)
  (cond ((smallest? a b c) (+ (square b) (square c)))
        ((smallest? b c a) (+ (square a) (square c)))
        (else (+ (square a) (square b)))))

(display "Exercise 1.4\n")
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
;the operator for the outer parent is decided based upon the evaluation of the inner one where operator is if
(display "Exercise 1.5\n")
(define (p) (p))
(define (test x y)
  (if (= x 0)
      0
      y))
;In applicative order the function never returns since the interpreter tries to evaluate both operans and since second operand is recursive it never returns anything and blows the callstack. 
;In normal order (p) is never evaluated since it is never need sine (= x 0) evaluates to true
(display "Exercise 1.6\n")
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))
(define (average x y)
  (/ (+ x y) 2))
(define (improve guess x)
  (average guess (/ x guess)))
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                    x)))
(define (sqrt x) (sqrt-iter 1 x))
;Because of applicative order the function tries to evaluate both arguments to new-if each time it is called so it ends up in an infinite recursion loop.

(display "Exercise 1.7\n")
(define (good-enough2? guess-old guess-new x)
  (< (abs (- 1 (/ guess-old guess-new))) 0.001))
(define (sqrt-iter-helper guess-old guess-new x)
  (if (good-enough2? guess-old guess-new x)
      guess-new
      (sqrt-iter-helper guess-new (improve guess-new x)
                        x)))
(define (sqrt2 x) (sqrt-iter-helper 0 1 x))

;Meh clobbered together but works and is more precise for smaller numbers
(display "Exercise 1.8\n")
(define (improve-cube guess x)
  (/ (+ (/ x (square guess)) (* 2 guess))
     3))
(define (cube-root-helper guess-old guess-new x)
  (if (good-enough2? guess-old guess-new x)
      guess-new
      (cube-root-helper guess-new (improve-cube guess-new x)
                        x)))
(define (cube-root x) (cube-root-helper 0 1 x))

(define (even? n)
  (= (remainder n 2) 0))
;1.16
(define (expt b n)
  (define (fexp b n a)
    (cond ((= n 0) a)
          ((even? n) (fexp  (square b) (/ n 2) a))
          (else (fexp b (- n 1)  (* a b)))))
  (fexp b n 1))
;1.17
(define (double x)
  (+ x x))
(define (halve x)
  (/ x 2 ))
(define (mult a b)
  (cond ((= b 1) a)
        ((even? b) (double (mult a (halve b))))
        (else (+ a (mult a (- b 1))))))
; 1.18
(define (mult2 a b)
  (define (miter a b c)
    (cond ((= b 0) c)
          ((even? b) (miter (double a) (halve b) c))
          (else (miter a (- b 1) (+ c a)))))
  (miter a b 0))

; Exercise 1.19

(define (fib n)
  (fib-iter 1 0 0 1 n))
 (define (fib-iter a b p q count)
   (cond ((= count 0) b)
         ((even? count)
          (fib-iter a
                    b
                    (+ (square p) (square q))
                    (+ (square q) (* 2 p q))
                    (/ count 2)))
          (else (fib-iter (+ (* b q) (* a q) (* a p))
                          (+ (* b p) (* a q))
                          p
                          q
                          (- count 1)))))

; Exercise 1.20 In normal order it is executed one extra time.

;Exercise 1.21
(define (smallest-divisor n)
  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (+ test-divisor 1)))))
  (define (divides? a b)
    (= 0 (remainder b a)))
    (find-divisor n 2))
; 199, 1999, 7

;Exercise 1.22
(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (search-for-primes n)
  (define (prime-iter n count)
    (cond ((= count 3) (newline))
          ((not (prime? n)) (prime-iter (+ n 1) count))
          (else (timed-prime-test n) (prime-iter (+ n 1) (+ count 1)))))
  (prime-iter n 0))
; 1000 ~ 10  (1009 1013 1019)
; 10000 ~ 40 (10007 10009 10037)
; 100000 ~ 130 (100003 100019 100043)
; 100000 ~ 350 (1000003 1000033 1000037)
; it is consistent with teh sqrt(10) prediction

;1.23
(define (next n)
  (if (= n 2) 3 (+ n 2)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test2 n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))
