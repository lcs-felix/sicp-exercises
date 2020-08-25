#lang racket

(define (reverse1 original reversed)
  (cond 
    [(null? original) reversed]
    [(not (pair? (car original))) (reverse1 (cdr original) (cons (car original) reversed))]
    [else (reverse1 (cdr original) (cons (car original) reversed))]))

(define (deep-reverse items)
  (reverse1 items '()))

(define x (list (list 1 2) (list 3 4)))
x ;; ((1 2) (3 4))
(reverse x) ;; ((3 4) (1 2))
(deep-reverse x) ;;((4 3) (2 1))
