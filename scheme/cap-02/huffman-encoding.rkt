#lang racket

(provide encode decode make-leaf-set generate-huffman-tree)

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
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))

(define (symbol-exists? symbol symbols)
  (cond [(null? symbols) false]
        [(equal? symbol (car symbols)) true]
        [else (symbol-exists? symbol (cdr symbols))]))

(define (encode-symbol symbol tree)
  (define (navigate tree)
    (if (leaf? tree) 
        '()
        (let ([left-tree (left-branch tree)])
          (if (symbol-exists? symbol (symbols left-tree))
            (cons 0 (navigate (left-branch tree)))
            (cons 1 (navigate (right-branch tree)))))))
  (if (symbol-exists? symbol (symbols tree))
      (navigate tree)
      (error "symbol does not exists in list" (symbols tree))))

(define (encode message tree)
  (if (null? message)
    '()
    (append (encode-symbol (car message) tree)
            (encode (cdr message) tree))))

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

;; from https://jots-jottings.blogspot.com/2011/12/sicp-exercise-269-generating-huffman.html
(define (successive-merge set)
  ;; (printf "set: ~a\n" set)
  (cond [(null? (cdr set)) (car set)]
        [else (successive-merge
               (adjoin-set (make-code-tree (car set) (cadr set))
                           (cddr set)))]))

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

;; (make-list 'A 8)
;; (leaf? (make-list 'A 8))
;; (symbol-leaf (make-list 'A 8))
;; (weight-leaf (make-list 'A 8))
;; (make-leaf-set '((A 4) (B 2) (D 1) (C 1)))

;; (make-code-tree (make-leaf 'D 1) (make-code-tree (make-leaf 'C 1) (make-leaf 'A 2)))

;; '((leaf A 4)
;;  ((leaf B 2) ((leaf D 1) (leaf C 1) (D C) 2) (B D C) 4)
;;  (A B D C)
;;  8)
