#lang racket

(define (deep-reverse1 original reversed)
  (cond 
    [(null? original) reversed]
    [(pair? (car original)) 
      (deep-reverse1 (cdr original) (cons (deep-reverse1 (car original) '()) reversed))]
    [else (deep-reverse1 (cdr original) (cons (car original) reversed))]))

(define (deep-reverse items)
  (deep-reverse1 items '()))

(define x (list (list 1 2) (list 3 4)))
x ;; ((1 2) (3 4))
(reverse x) ;; ((3 4) (1 2))
(deep-reverse x) ;;((4 3) (2 1))

(deep-reverse (cons 1 x)) ;; '((4 3) (2 1) 1)
