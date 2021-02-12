#lang racket

(provide make-leaf make-code-tree decode)

(define (make-leaf symbol weight) (list 'leaf symbol weight))
(define (leaf? object) (equal? 'leaf (car object)))
(define (symbol-leaf object) (cadr object))
(define (weight-leaf object) (caddr object))

(define (left-branch tree) (car tree))
(define (right-branch tree) (cadr tree))
(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))
(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))

(define (make-code-tree left right)
  (list left
        right
        (append left right)
        (+ (weight left) (weight right))))

(define (choose-branch bit tree)
  (cond 
    [(= bit 0) (left-branch tree)]
    [(= bit 1) (right-branch tree)]
    [else (error "bad bit: CHOOSE-BRANCH" bit)]))
(define (decode bits tree)
  (define (decode-1 bits current-branch)
    (if (null? bits)
        '()
        (let ([next-branch (choose-branch (car bits) current-branch)])
          (if (leaf? next-branch)
            (cons (symbol-leaf next-branch)
                  (decode-1 (cdr bits) tree))
            (decode-1 (cdr bits) next-branch)))))
  (decode-1 bits tree))

(define (adjoin-set x set)
  (cond [(null? set) (list x)]
        [(< (weight x) (weight (car set))) (cons x set)]
        [else (cons (car set) 
                    (adjoin-set x (cdr set)))]))

(define (make-leaf-set pairs)
  (if (null? pairs)
    '()
    (let* 
      ([pair (car pairs)]
        [symbol (car pair)]
        [frequency (cadr pair)])
      (adjoin-set (make-leaf symbol frequency)
                  (make-leaf-set (cdr pairs))))))

;; (make-list 'A 8)
;; (leaf? (make-list 'A 8))
;; (symbol-leaf (make-list 'A 8))
;; (weight-leaf (make-list 'A 8))
;; (make-leaf-set '((A 4) (B 2) (C 1) (D 1)))
