#lang racket

(define (fringe col)
  (cond [(null? col) '()]
        [(not (pair? (car col))) (cons (car col) (fringe (cdr col)))]
        [else (append (fringe (car col))
                    (fringe (cdr col)))]))


(define x (list (list 1 2) (list 3 4)))
(fringe x) ;; (1 2 3 4)
(fringe (list x x)) ;; (1 2 3 4 1 2 3 4)
