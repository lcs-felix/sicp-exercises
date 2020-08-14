#lang racket

(define (reverse1 original reversed)
  (if (null? original)
    reversed
    (reverse1 (cdr original) (cons (car original) reversed))))

(define (reverse items)
  (reverse1 items '()))

(define reversed (reverse (list 1 4 9 16 25)))
(display reversed)
(newline)