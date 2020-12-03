#lang racket

(require "./seq-funcs.rkt" "./2-36-accumulate-n.rkt")

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (m-row) (dot-product m-row  v)) m))

(define (transpose mat)
  (accumulate-n cons '() mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (matrix-row) (matrix-*-vector cols matrix-row)) m)))

;; tests

(dot-product '(1 3 -5) '(4 -2 -1)) ;; 3

(define matrix '((1 2 3) (4 5 6) (7 8 9)))
(define vector '(2 1 3))

(matrix-*-vector matrix vector) ;; '(13 31 49)

(transpose '((1 2) (3 4))) ;; '((1 3) (2 4))

(matrix-*-matrix '((1 2 3) (4 5 6)) '((7 8) (9 10) (11 12))) ;; '((58 64) (139 154))
