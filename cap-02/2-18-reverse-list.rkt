#lang racket

(define (reverse list)
  (if (null? (cdr list))
    (car list)
    (cons (reverse (cdr list)) (car list))))

(define reversed (reverse (list 1 4 9 16 25)))
(display reversed)
(newline)