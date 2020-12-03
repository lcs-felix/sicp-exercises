#lang racket

(define (make-monitored func)
  (let ([acc 0])
    (define (mf input)
        (cond [(eq? input 'how-many-calls?) acc]
              [(eq? input 'reset-count) (set! acc 0)]
              [else (begin (set! acc (+ acc 1)) (func input))]))
    mf))

(define s (make-monitored sqrt)) 
(s 100) ; 10
(s 'how-many-calls?) ; 1
(s 'reset-count)
(s 'how-many-calls?) ; 0
(s 100) ; 10
(s 100) ; 10
(s 'how-many-calls?) ; 2

(display "creating s2")(newline)
(define s2 (make-monitored sqrt)) 
(s2 100)
(s2 'how-many-calls?) ; 1