#lang racket

(define (equal? l1 l2)
  (cond 
    [(null? (cdr l1)) (null? (cdr l2))]
    [(null? (cdr l2)) false]
    [(symbol? (car l1)) 
      (and (eq? (car l1) (car l2))
            (equal? (cdr l1) (cdr l2)))]
    [else (and 
            (equal? (car l1) (car l2))
            (equal? (cdr l1) (cdr l2)))]))

(eq? (equal? '(this is a list) '(this is a list)) #t)
(eq? (equal? '(this is a list) '(this is a)) #f)
(eq? (equal? '(this is a) '(this is a list)) #f)
(eq? (equal? '(this is a list) '(this (is a) list)) #f)
(eq? (equal? '(this (is a) list) '(this (is a) list)) #t)
(eq? (equal? '(this (is (a)) list) '(this (is (a)) list)) #t)
