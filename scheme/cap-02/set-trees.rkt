#lang racket

(define (entry tree)
  (car tree))

(define (left-branch tree)
  (cadr tree))

(define (right-branch tree)
  (caddr tree))

(define (make-tree entry left right)
  (list entry left right))

(define (element-of-set? x set)
  (cond [(null? set) false]
        [(= x (entry set)) true]
        [(< x (entry set)) (element-of-set? x (left-branch set))]
        [(> x (entry set)) (element-of-set? x (right-branch set))]))

(define (adjoin-set x set)
  (cond [(null? set) (make-tree x '() '())]
        [(= x (entry set)) set]
        [(< x (entry set))
          (make-tree (entry set)
                     (adjoin-set x (left-branch set))
                     (right-branch set))]
        [(> x (entry set)) 
          (make-tree (entry set) (left-branch set)
                     (adjoin-set x (right-branch set)))]))

(define (tree->list-1 tree)
  ;; (display (~a "tree : " tree "\n"))
  (if (null? tree)
    '()
    (append (tree->list-1 (left-branch tree))
            (cons (entry tree)
                  (tree->list-1 (right-branch tree))))))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    ;; (display (~a "tree : " tree ", result-list: " result-list "\n"))
    (if (null? tree)
      result-list
      (copy-to-list (left-branch tree)
                    (cons (entry tree) 
                          (copy-to-list (right-branch tree) result-list)))))
  (copy-to-list tree '()))

;; (tree->list-1 (adjoin-set 11 (adjoin-set 7 (adjoin-set 1 (adjoin-set 9 (adjoin-set 3 (adjoin-set 5 '())))))))
;; (tree->list-1 (adjoin-set 11 (adjoin-set 9 (adjoin-set 5 (adjoin-set 7 (adjoin-set 1 (adjoin-set 3 '())))))))
;; (tree->list-1 (adjoin-set 11 (adjoin-set 5 (adjoin-set 1 (adjoin-set 9 (adjoin-set 3 (adjoin-set 7 '())))))))

(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let* ([left-size (quotient (- n 1) 2)]
             [left-result (partial-tree elts left-size)]
             [left-tree (car left-result)]
             [non-left-elts (cdr left-result)]
             [right-size (- n (+ left-size 1))]
             [this-entry (car non-left-elts)]
             [right-result (partial-tree (cdr non-left-elts) right-size)]
             [right-tree (car right-result)]
             [remaining-elts (cdr right-result)])
        (cons (make-tree this-entry left-tree right-tree)
              remaining-elts))))

(define (list->tree elements)
  (partial-tree elements (length elements)))

;; (list->tree '(1 3 5 7 9 11))
;; '(5 (1 () (3 () ())) (9 (7 () ()) (11 () ())))


;; exercise 2.66

;; from 2.62
(define (union-set-ordered set1 set2)
  (cond [(null? set1) set2]
        [(null? set2) set1]
        [else (let ([x1 (car set1)]
                    [x2 (car set2)])
                (cond [(= x1 x2) (cons x1 (union-set-ordered (cdr set1) (cdr set2)))]
                      [(< x1 x2) (cons x1 (union-set-ordered (cdr set1) set2))]
                      [else (cons x2 (union-set-ordered set1 (cdr set2)))]))]))

(define (union-set set1 set2)
  (let ([set1-list (tree->list-1 set1)]
        [set2-list (tree->list-1 set2)])
    (car (list->tree (union-set-ordered set1-list set2-list)))))

;; (union-set (car (list->tree '(1 3 5 7 9))) (car (list->tree '(1 3 10 15))))

(define (intersection-set-ordered set1 set2)
  (if (or (null? set1) (null? set2))
      '()
      (let ([x1 (car set1)] 
            [x2 (car set2)])
        (cond [(= x1 x2) (cons x1 (intersection-set-ordered (cdr set1) (cdr set2)))]
              [(< x1 x2) (intersection-set-ordered (cdr set1) set2)]
              [(< x2 x1) (intersection-set-ordered set1 (cdr set2))]))))

(define (intersection-set set1 set2)
  (let ([set1-list (tree->list-1 set1)]
        [set2-list (tree->list-2 set2)])
    (car (list->tree (intersection-set-ordered set1-list set2-list)))))

(intersection-set (car (list->tree '(1 3 5 7 9))) (car (list->tree '(1 3 5 10 15))))
