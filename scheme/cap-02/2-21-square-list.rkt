#lang racket

(require "../math/numeric.rkt")

(define (square-list items)
  (if (null? items)
    '()
    (cons (square (car items)) (square-list (cdr items)))))

(define (square-list-map items)
  (map square items))
