#lang racket

(require "../math/numeric.rkt")

(define (normalize-sign rat)
  (cond 
    [(and (negative? (car rat)) (negative? (cdr rat))) (cons (abs (car rat)) (abs (cdr rat)))]
    [(negative? (cdr rat)) (cons (* (car rat) -1) (abs (cdr rat)))]
    [else rat]))

(define (make-rat x y)
  (let ([gdc-num (gdc x y)])
    (normalize-sign 
      (cons 
        (/ x gdc-num) 
        (/ y gdc-num)))))