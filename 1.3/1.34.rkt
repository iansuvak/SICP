#lang planet neil/sicp

;Exercise 1.34

(define (square x) (* x x))
(define (f g)
  (g 2))

(f square)
;4

(f (lambda (z) (* z (+ z 1))))
;6

;What happens if we (perversely) ask the interpreter to evaluate the combination (f f)? Explain.

; The error says "not a prodcedure". What happened is that function f that we defined expects a procedure with 1 argument as it's input and evaluates it with argument 2.
; When (f f) gets evaluated it runs (f f) -> (f (f 2) -> (f (f (f 2)))... and it keeps nesting indefinitely.

