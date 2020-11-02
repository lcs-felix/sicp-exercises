#lang racket

(require "seq-funcs.rkt" "../cap-01/primality.rkt")

(define (unique-pairs n)
  (flatmap (lambda (i) 
          (map (lambda (j) (list i j))
                (enumerate-interval 1 (- i 1))))
    (enumerate-interval 1 n)))

;; (unique-pairs 5) '((2 1) (3 1) (3 2) (4 1) (4 2) (4 3) (5 1) (5 2) (5 3) (5 4))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
  (map make-pair-sum
    (filter prime-sum? 
      (unique-pairs n))))

;; (prime-sum-pairs 5) '((2 1 3) (3 2 5) (4 1 5) (4 3 7) (5 2 7))
