#lang racket

(define (for-each func col)
  (if (null? col)
    true
    ((lambda () 
      (func (car col))
      (for-each func (cdr col))))))

(for-each 
  (lambda (x)
    (newline)
    (display x))
  (list 57 321 88))
