#lang racket

(define (filter pred list)
  (cond
    [(null? list) '()]
    [(pred (car list)) (cons (car list) (filter pred (cdr list)))]
    [else (filter pred (cdr list))]))

(define (same-parity n . m)
  (if (even? n)
    (cons n (filter even? m))
    (cons n (filter odd? m))))

(same-parity 1 2 3 4 5 6 7)
;; (1 3 5 7)
(same-parity 2 3 4 5 6 7)
;; (2 4 6)
(same-parity 1)
;; 1
