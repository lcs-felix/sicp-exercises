#lang racket

(require "../math/numeric.rkt")

(define (square-tree tree)
  (cond 
    [(null? tree) '()]
    [(not (pair? tree)) (square tree)]
    [else (cons 
            (square-tree (car tree))
            (square-tree (cdr tree)))]))

(define (square-tree-map tree)
  (map
    (lambda (value)
      (if (pair? value)
        (square-tree-map value)
        (square value)))
    tree))

(square-tree (list 1 (list 2 (list 3 4) 5) (list 6 7))) ;;(1 (4 (9 16) 25) (36 49))
(square-tree-map (list 1 (list 2 (list 3 4) 5) (list 6 7))) ;;(1 (4 (9 16) 25) (36 49))
