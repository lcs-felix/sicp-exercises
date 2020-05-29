#lang sicp

;; exercise 1.2
;; result: -0.24666666666666667, or -37/150

(/ (+ 5
      4
      (- 2 (- 3 (+ 6 (/ 4 5)))))
   (* 3
      (- 6 2)
      (- 2 7)))

;; exerise 1.3

(define (square number) (* number number))

(define (sum-square a b)
  (+ (square a) (square b)))

(define (larger-sum-squares a b c)
  (cond ((and (>= a b) (>= b c)) (sum-square a b))
        ((and (>= b a) (>= c a)) (sum-square b c))
        ((and (>= a b) (>= c b)) (sum-square a c))))

;; exercise 1.4

