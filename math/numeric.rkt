#lang racket

(provide gdc abs average zero? dec pow)

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

(define (zero? n)
  (= n 0))

(define (dec n)
  (- n 1))

(define (pow a b)
  (if (zero? b)
    1
    (* a (pow a (dec b)))))
