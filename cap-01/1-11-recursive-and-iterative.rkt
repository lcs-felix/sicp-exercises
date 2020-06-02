#lang racket

; exercise 1.11
; recursive process

(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
         (* 2 (f (- n 2)))
         (* 3 (f (- n 3))))))

(f 2)
; 2

(f 3)
; 4

(f 4)
; 11

(f 5)
; 25

(f 6)
; 59

(f 7)
; 142

(f 8)
; 335
