#lang sicp

(define (pow x y)
  (if (= 0 y) 1
  (* x (pow x (- y 1)))))

(define (cube x)
  (pow x 3))

(define (square x)
  (pow x 2))

(define (improve guess x)
  (/ (+ (/ x (square guess))
        (* 2 guess))
     3))

(define (abs x)
  (cond ((< x 0) (- x))
        (else x)))

(define (good-enough? guess x)
  (< (abs (- (cube guess) x)) 0.0001))

(define (cbrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (cbrt-iter (improve guess x) x)))

(define (cbrt x)
  (cbrt-iter 1 x))

;; 3
(cbrt 27)

;; 4
(cbrt 64)