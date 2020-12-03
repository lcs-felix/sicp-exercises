#lang racket

(define (factorial n)
  (if (= n 1)
  1
  (* n (factorial (- n 1)))))


(define (bi-coefficient n k)
  (if (or (= 0 k) (= n k))
      1
      (/ (factorial n)
         (* (factorial k)
            (factorial (- n k))))))

(define (make-row n k numbers)
  (if (= k -1)
      numbers
  (make-row n
            (- k 1)
            (cons (bi-coefficient n k) numbers))))

(define (triangle-iter rows numbers)
  (if (< rows 0)
      numbers
      (triangle-iter (- rows 1) (cons (make-row rows rows '()) numbers))))

(define (triangle rows)
  (for ([row (triangle-iter (- rows 1) '())])
    (display row)
    (newline)))

(triangle 6)

; (1)
; (1 1)
; (1 2 1)
; (1 3 3 1)
; (1 4 6 4 1)
; (1 5 10 10 5 1)