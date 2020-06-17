#lang racket

(define (pascal-row n k)
  ; (display (string-append-immutable "n: " (~v n) ", k: " (~v k) "\n"))
  (if (zero? k)
      '(1)
      (let ([list (pascal-row n (- k 1))])
        (cons (* (first list)
                 (/ (- (+ n 1) k) k))
              list))))

(define (pascal-triangle rows)
  (define (pascal-triangle-iter rows count)
    (cond [(not (= count rows))
        (begin
          (display (pascal-row count count))
          (newline)
          (pascal-triangle-iter rows (+ count 1)))]))
  (pascal-triangle-iter rows 0))

; (pascal-triangle 5)
; (1)
; (1 1)
; (1 2 1)
; (1 3 3 1)
; (1 4 6 4 1)

