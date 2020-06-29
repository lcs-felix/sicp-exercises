#lang racket

(define (make-accumulator acc)
  (lambda (value)
    (set! acc (+ acc value))
    acc))

(define A (make-accumulator 5))
(A 10) ; 15
(A 10) ; 25
