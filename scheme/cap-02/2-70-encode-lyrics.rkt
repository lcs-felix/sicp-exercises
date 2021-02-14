#lang racket

(require "./huffman-encoding.rkt")

(define tree (generate-huffman-tree '((A 2) (GET 2) (SHA 3) (WAH 1) (BOOM 1) (JOB 2) (NA 16) (YIP 9))))

(define message '(GET A JOB SHA NA NA NA NA NA NA NA NA GET A JOB
                SHA NA NA NA NA NA NA NA NA
                WAH YIP YIP YIP YIP YIP YIP YIP YIP YIP
                SHA BOOM))

(encode message tree)
;; '(1 1 1 1 1 1 1 0 0 1 1 1 1 0 1 1 1 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 0 0 1 1 1 1 0 1 1 1 0 0 0 0 0 0 0 0 0 1 1 0 1 1 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 1 1 0 1 1 0 1 0)
;; 84 bits for huffman encoding

;; (= (* 36 3) 108) for fixed-length code
