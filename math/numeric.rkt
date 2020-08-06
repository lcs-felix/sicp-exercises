#lang racket

(provide gdc)
(provide abs)

(define (abs n)
  (if (< n 0)
    (* n -1)
    n))

(define (gdc a b) 
  ; (newline)
  ; (display (string-append-immutable "a: " (~a a) " b: " (~a b)))
  (if (= b 0)
    a
    (gdc b (remainder a b))))

(define (average v1 v2)
  (/ (+ v1 v2) 2))
