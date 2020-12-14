#lang racket
(require sicp-pict)

(define (flip-horiz-1 painter)
  (transform-painter painter
                     (make-vect 1 0)
                     (make-vect 0 0)
                     (make-vect 0 1)))


(paint (flip-vert einstein))
(paint (flip-horiz-1 einstein))
