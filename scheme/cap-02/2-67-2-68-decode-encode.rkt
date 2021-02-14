#lang racket

(require "./huffman-encoding.rkt")

(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree
                    (make-leaf 'B 2)
                    (make-code-tree
                      (make-leaf 'D 1)
                      (make-leaf 'C 1)))))
(define sample-message '(0 1 1 0 0 1 0 1 0 1 1 1 0))

(decode sample-message sample-tree) ;; '(A D A B B C A)

(encode '(D) sample-tree)

(encode '(A D A B B C A) sample-tree) ;; '(0 1 1 0 0 1 0 1 0 1 1 1 0)

;; '((leaf A 4)
;;  ((leaf B 2) ((leaf D 1) (leaf C 1) (D C) 2) (B D C) 4)
;;  (A B D C)
;;  8)

'((leaf A 4)
  ((leaf B 2) ((leaf C 1) (leaf D 1) (C D) 2) (B C D) 4)
  (A B C D)
  8)

(make-code-tree
  (make-code-tree
      (make-leaf 'D 1)
      (make-leaf 'C 1))
  (make-leaf 'B 2))
