#lang racket

(define (element-of-set? x set)
  (cond [(null? set) false]
        [(equal? x (car set)) true]
        [else (element-of-set? x (cdr set))]))

(define (adjoin-set x set)
  (if (element-of-set? x set)
    set
    (cons x set)))

(define (union-set set1 set2)
  (if (null? set1)
      set2
      (adjoin-set (car set1) (union-set (cdr set1) set2))))

(union-set '(1 2 3 4 5) '(1 2 3 4))
(union-set '(1 2 3) '(1 2 3))
(union-set '(10 5) '(1 2 3 4 5))
