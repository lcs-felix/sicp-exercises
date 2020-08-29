#lang racket

(provide filter accumulate enumerate-interval enumerate-tree)

(define (filter predicate sequence)
  (cond 
    [(null? sequence) null]
    [(predicate (car sequence))
      (cons (car sequence)
            (filter predicate (cdr sequence)))]
    [else (filter predicate (cdr sequence))]))

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
      (accumulate op initial (cdr sequence)))))

(define (enumerate-interval low high)
  (if (> low high)
    null
    (cons low (enumerate-interval (+ low 1) high))))

(define (enumerate-tree tree)
  (cond [(null? tree) null]
        [(not (pair? tree)) (list tree)]
        [else (append (enumerate-tree (car tree))
          (enumerate-tree (cdr tree)))]))