#lang racket

(require "seq-funcs.rkt")

(define (reverse sequence)
  (fold-right (lambda (x y) (append y (list x))) null sequence))

(define (reverse1 sequence)
  (fold-left (lambda (x y) (cons y x)) null sequence))

(reverse '(1 2 3))
(reverse1 '(1 2 3))
