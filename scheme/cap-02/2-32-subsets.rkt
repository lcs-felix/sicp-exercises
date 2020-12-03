#lang racket

(define (subsets s)
  (if (null? s)
    (list null)
    (let ([rest (subsets (cdr s))])
      (append rest (map (lambda (v)
                          (append (list (car s)) v))
                        rest)))))


(define s (list 1 2 3));; (() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3))
(subsets s)
