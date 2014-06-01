#lang planet neil/sicp

;Exercise 2.3

(define (make-rectangle A C)
  (let ((B (make-point (x-point C) (y-point A)))
        (D (make-point (x-point A) (y-point C))))
    (cons (cons A B) (cons C D))))
(define (ptA rect)
  (car (car rect)))
(define (ptB rect)
  (cdr (car rect)))
(define (ptC rect)
  (car (cdr rect)))
(define (ptD rect)
  (cdr (cdr rect)))

(define (make-rect2 A x y)
  (let ((B (make-point (+ x (x-point A)) (y-point A)))
        (C (make-point (+ x (x-point A)) (+ (y-point A) y)))
        (D (make-point (x-point A) (+ (y-point A) y))))
        (cons (cons A B) (cons C D))))


(define (rectangle-dimensions rect)
  (cons 
   (length-segment (make-segment (ptA rect) (ptB rect)))
   (length-segment (make-segment (ptA rect) (ptD rect)))))

(define (area-rectangle rect)
  (let ((dim (rectangle-dimensions rect)))
        (* (car dim) (cdr dim))))


(define (perimeter-rectangle rect)
  (let ((dim (rectangle-dimensions rect)))
        (+ (* (car dim) 2) (* 2 (cdr dim)))))
  

(define (length-segment seg)
  (let ((x-delta (abs(- (x-point (start-segment seg)) (x-point (end-segment seg)))))
        (y-delta (abs(- (y-point (start-segment seg)) (y-point (end-segment seg))))))
    (sqrt (+ (square x-delta) (square y-delta)))))
  
; All of 2.2 below
(define (make-point x y)
  (cons x y))
(define (x-point point)
  (car point))
(define (y-point point)
  (cdr point))

(define (make-segment start end)
  (cons start end))
(define (start-segment segment)
  (car segment))
(define (end-segment segment)
  (cdr segment))
  

(define (midpoint-segment segment)
  (let (( start (start-segment segment))
        (end (end-segment segment)))
    (let ((x1 (x-point start))
          (x2 (x-point end))
          (y1 (y-point start))
          (y2 (y-point end)))
      (make-point (average x1 x2) (average y1 y2)))))

(define (average x y) (/ (+ x y) 2))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (square x) (* x x))

; testing

(area-rectangle (make-rectangle (make-point 0 0) (make-point 4 3)))
(perimeter-rectangle (make-rectangle (make-point 0 0) (make-point 4 3)))

(area-rectangle (make-rect2 (make-point 2 3) 4 1))
(perimeter-rectangle (make-rect2 (make-point 2 3) 4 1))
