#lang racket

(require "seq-funcs.rkt")

(define (triple-sum t)
  (fold-right + 0 t))

(define (make-triple-sum t)
  (append t (list (triple-sum t))))

(define (unique-triples n)
  (flatmap (lambda (i)
          (flatmap (lambda (j)
                  (map (lambda (k)
                          (list i j k))
                    (enumerate-interval 1 (- j 1))))
            (enumerate-interval 1 (- i 1))))
    (enumerate-interval 1 n)))

(define (triple-sum-to-n n s)
  (map  (lambda (t) (make-triple-sum t))
        (filter 
          (lambda (t) 
            (= (triple-sum t) s))
          (unique-triples n))))

(display (unique-triples 6)) ;; ((3 2 1) (4 2 1) (4 3 1) (4 3 2) (5 2 1) (5 3 1) (5 3 2) (5 4 1) (5 4 2) (5 4 3) (6 2 1) (6 3 1) (6 3 2) (6 4 1) (6 4 2) (6 4 3) (6 5 1) (6 5 2) (6 5 3) (6 5 4))

(display (triple-sum-to-n 6 12)) ;; ((5 4 3 12) (6 4 2 12) (6 5 1 12))
