#lang racket

(define (fringe col)
  (cond [(null? col) '()]
        [(not (pair? (car col))) (cons (car col) (fringe (cdr col)))]
        [else (append (fringe (car col))
                    (fringe (cdr col)))]))


(define x (list (list 1 2) (list 3 4)))
(fringe x) ;; (1 2 3 4)
(fringe (list x x)) ;; (1 2 3 4 1 2 3 4)

;; just testing...
(fringe (list 1 (list (list 2 (list 3)))))
(fringe (list 1 (list 2 (list 4 5) 3)))