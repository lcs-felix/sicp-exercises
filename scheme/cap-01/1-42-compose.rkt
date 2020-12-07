#lang racket

(define (square x)
  (* x x))

(define (inc x)
  (+ 1 x))

(define (compose f g)
  (lambda (value)
    (f (g value))))

((compose square inc) 6)
