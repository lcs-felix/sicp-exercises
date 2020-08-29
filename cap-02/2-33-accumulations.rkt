#lang racket

(require "seq-funcs.rkt" "../math/numeric.rkt")

(define (map1 p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) null sequence))

(define (append1 seq1 seq2)
  (accumulate cons seq2 seq1))

(define (length1 sequence)
  (accumulate (lambda (x y) (inc y)) 0 sequence))

(map1 square (enumerate-interval 1 5)) ;; '(1 4 9 16 25)
(append1 (list 1 2) (list 3 4)) ;; '(1 2 3 4)
(length1 (list 1 2 3)) ;; 3
