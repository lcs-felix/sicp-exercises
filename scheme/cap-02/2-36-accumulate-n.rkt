#lang racket

(require "seq-funcs.rkt")

(define (get-firsts seqs)
  (map car seqs))

(define (remove-firsts seqs)
  (map cdr seqs))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
    null
    (cons (accumulate op init (get-firsts seqs))
          (accumulate-n op init (remove-firsts seqs)))))

(define s '((1 2 3) (4 5 6) (7 8 9) (10 11 12)))
(accumulate-n + 0 s) ;; (22 26 30)
