#lang racket

(require "../math/numeric.rkt")

(define (normalize-sign rat)
  (cond 
    [(and (> (car rat) 0) (> (cdr rat) 0)) rat]
    [(and (< (car rat) 0) (< (cdr rat) 0)) (cons (abs (car rat)) (abs (cdr rat)))]
    [(< (car rat) 0) rat]
    [else (cons (* (car rat) -1) (abs (cdr rat)))]))

(define (make-rat x y)
  (cond [(and (> x 0) (> y 0))   ])
  (let ([gdc-num (gdc x y)])
    (normalize-sign 
      (cons 
        (/ x gdc-num) 
        (/ y gdc-num)))))