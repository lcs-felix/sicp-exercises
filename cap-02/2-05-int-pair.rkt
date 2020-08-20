#lang racket

(require "../math/numeric.rkt")

(define (cons-int a b)
  (* (pow 2 a)
     (pow 3 b)))

(define (car1 z)
  (if (odd? z)
    0
    (inc (car1 (/ z 2)))))

(define (cdr1 z)
  (cond [(= z 1) 0]
        [(odd? z) (inc (cdr1 (/ z 3)))]
        [(even? z) (cdr1 (/ z 2))]))
