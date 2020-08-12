#lang racket

(require "../math/numeric.rkt")

(provide make-point make-segment)

(define (make-point x y)
  (cons x y))

(define (make-segment start end)
  (cons start end))

(define (x-point point) 
  (car point))

(define (y-point point)
  (cdr point))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

(define (midpoint-segment segment)
  (let ([start (start-segment segment)]
        [end (end-segment segment)])
    (cons (average (x-point start) (x-point end))
      (average (y-point start) (y-point end)))))
  
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define segment (make-segment (make-point 1 1) (make-point 5 5)))
(print-point (start-segment segment))
(print-point (end-segment segment))
