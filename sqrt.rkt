#lang sicp

(define (average x y)
  (/ (+ x y) 2))

(define (square x)
  (* x x))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

;; if the result is not rounded
(define (try-refine guess x)
  (let ([int-part (floor guess)])
    (if (= (square int-part) x)
        int-part
        guess)))
  
(define (try guess x)
  (if (good-enough? guess x)
      (try-refine guess x)
      (try (improve guess x) x)))

(define (sqrt x)
  (try 1 x))

;; tests

;; 1 + 169/408
(sqrt 2)

;; 3
(sqrt 9)

;; 5
(sqrt 25)