#lang sicp

(define (square n) (* n n))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  ; (display (string-append "n: " (number->string n) ", test-divisor: " 
  ;  (number->string test-divisor)))(newline)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b) (= (remainder b a) 0))

(define (prime? n)
  (= (smallest-divisor n) n))

(prime? 9)
(prime? 7)
(prime? 4)
