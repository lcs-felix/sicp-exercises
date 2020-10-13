#lang racket

(require "seq-funcs.rkt")

(define (count-leaves t)
  (accumulate + 0 (map (lambda (e)
                          (if (not (pair? e)) 1
                              (count-leaves e))) t)))

(define x (cons (list 1 2) (list 3 4)))
(count-leaves x) ;; 4
(count-leaves (list x x)) ;; 8
