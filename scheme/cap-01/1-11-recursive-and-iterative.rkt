#lang racket

; exercise 1.11
; recursive process

(define (f-recursive n)
  (if (< n 3)
      n
      (+ (f-recursive (- n 1))
         (* 2 (f-recursive (- n 2)))
         (* 3 (f-recursive (- n 3))))))

; iterative process

(define (f-iter a b c count)
  ; (println "count: " count " | a: " a ", b: " b ", c: " c)
  (if (= count 0)
    c
    (f-iter (+ (* 3 c) (* 2 b) a) a b (- count 1))))

(define (f n)
  (f-iter 2 1 0 n))

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
