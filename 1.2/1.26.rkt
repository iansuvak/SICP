#lang planet neil/sicp
; 1.26

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (* (expmod base (/ exp 2) m)
                       (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

; By not using square abstraction and explicitly calling expmod twice in each multiplication step you are doubling the number of calls to expmod at each step and since
; it is recursive this accounts for running time change from theta(log(n)) to theta(n)

