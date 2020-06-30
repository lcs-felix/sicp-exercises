#lang racket

(define (double n)
  (+ n n))

(define (halve n)
  (/ n 2))

(define (mult-recur a b)
    ; (display (string-append-immutable "a: " (~a a) ", b: " (~a b)))(newline)
    (cond [(= b 0) 0]
          [(odd? b) (+ a (* a (- b 1)))]
          [else (double (* a (halve b)))]))

(define (* a b)
  (define (mult-iter a b acc)
    (cond [(= b 0) acc]
          [(even? b) (mult-iter (double a) (halve b) acc)]
          [else (mult-iter a (- b 1) (+ a acc))]))
  (mult-iter a b 0))

(* 3 4)
(* 3 6)
(* 3 7)
(* 10 10)
(* 2 5)