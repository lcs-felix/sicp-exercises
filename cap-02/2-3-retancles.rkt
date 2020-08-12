#lang racket

(require "2-2-plane-lines.rkt")

; (((2, 2), (2, 4)), ((2, 4), (4, 4)))

(define (make-rec height-segment width-segment)
  (cons height-segment width-segment))

(define (calc-height rectangle)
  (let ([height-seg (car rectangle)])
    (- (cdr (cdr height-seg)) (cdr (car height-seg)))))

(define (calc-width rectangle)
  (let ([width-seg (cdr rectangle)])
    (- (car (cdr width-seg)) (car (car width-seg)))))

(define (perimeter rectangle)
  (* 2 (+ (calc-height rectangle)
          (calc-width rectangle))))

(define (area rectangle)
  (* (calc-height rectangle)
     (calc-width rectangle)))

(define rec (make-rec (make-segment (make-point 2 2) (make-point 2 4)) (make-segment (make-point 2 4) (make-point 4 4))))
(perimeter rec)
