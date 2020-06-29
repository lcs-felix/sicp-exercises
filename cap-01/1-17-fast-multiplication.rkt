#lang racket

(define (double n)
  (+ n n))

(define (halve n)
  (/ n 2))

(define (* a b)
    ; (display (string-append-immutable "a: " (~a a) ", b: " (~a b)))(newline)
    (cond [(= b 0) 0]
          [(= b 1) a]
          [(odd? b) (+ a (* a (- b 1)))]
          [else (double a (* a (halve b)))]))

; (* 3 4)
; (* 3 6)
; (* 3 7)
(* 10 10)
(* 2 5)