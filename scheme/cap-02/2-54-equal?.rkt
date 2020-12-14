#lang racket

(define (equal? l1 l2)
  (cond 
    [(null? (cdr l1)) (null? (cdr l2))]
    [(null? (cdr l2)) false]
    [(symbol? (car l1))
      (if (symbol? (car l2))
        (and 
          (eq? (car l1) (car l2)) 
          (equal? (cdr l1) (cdr l2)))
        false)]
    [else (and 
            (equal? (car l1) (car l2))
            (equal? (cdr l1) (cdr l2)))]))

(equal? '(this is a list) '(this is a list))
(equal? '(this is a list) '(this is a))
(equal? '(this is a) '(this is a list))
(equal? '(this is a list) '(this (is a) list))
(equal? '(this (is a) list) '(this (is a) list))
(equal? '(this (is (a)) list) '(this (is (a)) list))
