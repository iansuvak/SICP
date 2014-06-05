#lang planet neil/sicp
;Exercise 2.11

;is there such a thing as obfuscated Scheme contest?
(define (mul-interval x y)
  (let ((x-low (lower-bound x))
        (y-low (lower-bound y))
        (x-high (upper-bound x))
        (y-high (upper-bound y)))
    (cond 
      
      ((and (neg? x-low)
            (neg? x-high)
            (neg? y-low)
            (neg? y-high))
       (make-interval (* x-high y-high) (* x-low y-low)))
      ((and (neg? x-low)
            (neg? x-high)
            (neg? y-low))
       (make-interval (* x-low y-high) (* x-low y-low)))
      ((and (neg? x-low)
            (neg? x-high))
       (make-interval (* x-low y-high) (* x-high y-low)))
      
      ((and (neg? x-low)
            (neg? y-low)
            (neg? y-high))
       (make-interval (* x-high y-low) (* x-low y-low)))
       ((and (neg? x-low) 
             (neg? y-low)) ; complicated case
        (let ((low1 ( * x-low y-high))
              (low2 ( * x-high y-low))
              (high (* x-high y-high)))
          (if (< low1 low2)
              (make-interval low1 high) (make-interval low2 high))))
       ((neg? x-low)
        (make-interval (* x-low y-high) (* x-high y-high)))
       
       ((and (neg? y-low)
             (neg? y-high))
        (make-interval (* x-high y-low) (* x-low y-high)))
       ((neg? y-low)
        (make-interval (* x-high y-low) (* x-high y-high)))
       (else 
        (make-interval (* x-low y-low) (* x-high y-high))))))

(define (neg? x) 
  (> 0 x))

;earlier stuff
(define (make-interval a b) (cons a b))
(define (upper-bound interval) (cdr interval))
(define (lower-bound interval) (car interval))

;testing

(define (mul-interval2 x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))


(define positive (make-interval 2 3))
(define span (make-interval -4 5))
(define negative (make-interval -6 -1))

(mul-interval positive positive)
(mul-interval positive span)
(mul-interval positive negative)

(mul-interval span positive)
(mul-interval span span)
(mul-interval span negative)

(mul-interval negative positive)
(mul-interval negative span)
(mul-interval negative negative)
(newline)
(display "Old")
(newline)
(mul-interval2 positive positive)
(mul-interval2 positive span)
(mul-interval2 positive negative)

(mul-interval2 span positive)
(mul-interval2 span span)
(mul-interval2 span negative)

(mul-interval2 negative positive)
(mul-interval2 negative span)
(mul-interval2 negative negative)

; after a few tweaks works