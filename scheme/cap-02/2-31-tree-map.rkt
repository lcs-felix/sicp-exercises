#lang racket

(require "../math/numeric.rkt")

(define (tree-map func tree)
  (map 
    (lambda (value)
      (if (pair? value)
        (tree-map func value)
        (func value)))
    tree))

(define (square-tree tree) (tree-map square tree))

(define tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))
(square-tree tree)
