#lang racket

(define (accumulate combiner null-value term a next b)
  (if (> a b)
    null-value
    (combiner (term a)
              (accumulate combiner null-value term (next a) next b))))

(define (accumulate-iter combiner null-value term a next b)
  (define (accumulate-iter-inner a result)
    (if (> a b)
       result
       (accumulate-iter-inner (next a) (combiner (term a) result))))
    (accumulate-iter-inner a null-value))

(define (filtered-accumulate predicate combiner null-value term a next b)
  (cond ((> a b) null-value )
    ((predicate a) (combiner (term a) 
                      (filtered-accumulate predicate combiner null-value 
                        term (next a) next b)))
    (else (filtered-accumulate predicate combiner null-value 
                        term (next a) next b))))

(define (inc n) (+ 1 n))
(filtered-accumulate prime? + 0 identity 2 inc 10)