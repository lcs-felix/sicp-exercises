#lang racket

(define (cons1 x y)
  (lambda (m) (m x y)))

(define (car1 z)
  (z (lambda (p q) p)))

(define (cdr1 z)
  (z (lambda (p q) q)))

(define pair (cons1 1 2))
(car1 pair)
(cdr1 pair)