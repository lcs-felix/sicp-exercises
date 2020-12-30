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
;; (define (union-set set1 set2)
;;  (if (null? set1) 
;;      set2
;;      (adjoin-set (car set1) (union-set (cdr set1) set2))))

;; solution from http://community.schemewiki.org/?sicp-ex-2.62

(define (union-set set1 set2)
  (cond [(null? set1) set2]
        [(null? set2) set1]
        [else (let ([x1 (car set1)]
                    [x2 (car set2)])
                (cond [(= x1 x2) (cons x1 (union-set (cdr set1) (cdr set2)))]
                      [(< x1 x2) (cons x1 (union-set (cdr set1) set2))]
                      [else (cons x2 (union-set set1 (cdr set2)))]))]))

(union-set '(1 2) '(3 4))
(union-set '(3 4 5) '(1 2 3 4))
(union-set '(1 2) '(3 4 5 6))
(union-set '(1 2) '(1 3 4 5 6))
(union-set '(10 11) '(1 3))
