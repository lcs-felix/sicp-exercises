#lang racket

(define (square n) 
  (* n n))

; (define (fast-expt b n)
;   (cond [(= n 0) 1]
;         [(odd? n) (* b (fast-expt b (- n 1)))]
;         [else (square (fast-expt b (/ n 2)))]))

; (fast-expt 3 6)
; (square (fast-expt 3 3))
; (square (* 3 (fast-expt 3 2)))
; (square (* 3 (square (fast-expt 3 1))))
; (square (* 3 (square (* 3 (fast-expt 3 0)))))
; (square (* 3 (square (* 3 1))))
; (square (* 3 (square 3)))
; (square (* 3 9))
; (square 27)
; 729


; (fast-expt 3 5)
; (* 3 (fast-expt 3 4))
; (* 3 (square (fast-expt 3 2)))
; (* 3 (square (square (fas-expt 3 1))))
; (* 3 (square (square (* 3 (fast-expt 3 0)))))
; (* 3 (square (square (* 3 1))))
; (* 3 (square (square 3)))
; (* 3 (square 9))
; (* 3 81)
; 243

(define (fast-expt b n)
  (define (fast-expt-iter b n a)
  ; (println (string-append-immutable "base:" (~a b) ", n:" (~a n) ", a:" (~a)))
  (cond [(= n 0) a]
        [(odd? n) (fast-expt-iter b (- n 1) (* b a))]
        [else (fast-expt-iter (square b) (/ n 2) a)]))
  (fast-expt-iter b n 1))

(fast-expt 2 0)
(fast-expt 2 1)
(fast-expt 2 2)
(fast-expt 2 3)

(fast-expt 3 2)
(fast-expt 3 3) ; 27
(fast-expt 3 4) ; 81
(fast-expt 3 5) ; 243

(fast-expt 2 6) ; 64
(fast-expt 2 7) ; 128
(fast-expt 2 8) ; 256
(fast-expt 6 2) ; 36