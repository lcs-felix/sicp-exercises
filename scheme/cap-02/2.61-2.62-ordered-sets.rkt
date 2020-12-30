#lang racket

(define (element-of-set? x set)
  (cond [(null? set) false]
        [(= x (car set)) true]
        [(< x (car set) false)]
        [else (element-of-set? x (cdr set))]))

;; 2.61

(define (adjoin-set x set)
  (cond [(null? set) (list x)]
        [(= x (car set)) set]
        [(< x (car set)) (cons x set)]
        [else (cons (car set) (adjoin-set x (cdr set)))]))

;; (adjoin-set 3 '(1 2))
;; (adjoin-set 1 '(1 2))
;; (adjoin-set 2 '(1 3))

;; 2.62

;; not O(n)
(define (union-set set1 set2)
  (if (null? set1) 
      set2
      (adjoin-set (car set1) (union-set (cdr set1) set2))))

(union-set '(1 2) '(3 4))
(union-set '(4 3 5) '(3 4))
(union-set '(1 2) '(3 4 5 6))
(union-set '(1 2) '(1 3 4 5 6))
(union-set '(10 11) '(1 3))
