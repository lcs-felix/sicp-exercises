#lang racket
(require sicp-pict)

(define (compose f g)
  (lambda (value)
    (f (g value))))

(define wave
  (segments->painter
   (list
    (make-segment (make-vect 0.20 0.00) (make-vect 0.35 0.50))
    (make-segment (make-vect 0.35 0.50) (make-vect 0.30 0.60))
    (make-segment (make-vect 0.30 0.60) (make-vect 0.15 0.45))
    (make-segment (make-vect 0.15 0.45) (make-vect 0.00 0.60))
    (make-segment (make-vect 0.00 0.80) (make-vect 0.15 0.65))
    (make-segment (make-vect 0.15 0.65) (make-vect 0.30 0.70))
    (make-segment (make-vect 0.30 0.70) (make-vect 0.40 0.70))
    (make-segment (make-vect 0.40 0.70) (make-vect 0.35 0.85))
    (make-segment (make-vect 0.35 0.85) (make-vect 0.40 1.00))
    (make-segment (make-vect 0.60 1.00) (make-vect 0.65 0.85))
    (make-segment (make-vect 0.65 0.85) (make-vect 0.60 0.70))
    (make-segment (make-vect 0.60 0.70) (make-vect 0.75 0.70))
    (make-segment (make-vect 0.75 0.70) (make-vect 1.00 0.40))
    (make-segment (make-vect 1.00 0.20) (make-vect 0.60 0.48))
    (make-segment (make-vect 0.60 0.48) (make-vect 0.80 0.00))
    (make-segment (make-vect 0.40 0.00) (make-vect 0.50 0.30))
    (make-segment (make-vect 0.50 0.30) (make-vect 0.60 0.00)))))

;; (define (right-split painter n)
;;  (if (= n 0)
;;    painter
;;    (let ([smaller (right-split painter (- n 1))])
;;      (beside painter (below smaller smaller)))))

;; (paint (right-split wave 1))
;; (paint (right-split wave 2))
;; (paint (right-split wave 3))
;; (paint (right-split wave 4))

;; 2.44
;; (define (up-split painter n)
;;   (if (= n 0)
;;      painter
;;      (let ([smaller (up-split painter (- n 1))])
;;        (below painter (beside smaller smaller)))))

;; 2.45
(define (split side1 side2)
  (define (op painter n)
    (if (= n 0)
        painter
        (let ([smaller (op painter (- n 1))])
          (side1 painter (side2 smaller smaller)))))
  op)

(define right-split (split beside below))
(define up-split (split below beside))

(define (corner-split painter n)
  (if (= n 0)
      painter
      (let* ([up (up-split painter (- n 1))]
             [right (right-split painter (- n 1))]
             [top-left (beside up up)]
             [bottom-right (below right right)]
             [corner (corner-split painter (- n 1))])
        (beside (below painter top-left)
                (below bottom-right corner)))))

;; (paint (corner-split wave 1))
;; (paint (corner-split wave 2))
;; (paint (corner-split wave 4))

;; (define (square-limit painter n)
;;  (let* ([quarter (corner-split painter n)]
;;         [half (beside (flip-horiz quarter) quarter)])
;;    (below (flip-vert half) half)))

;; (paint (square-limit einstein 2))

(define (square-of-four tl tr bl br)
  (lambda (painter)
    (let ([top (beside (tl painter) (tr painter))]
          [bottom (beside (bl painter) (br painter))])
      (below bottom top))))

(define flipped-pairs (square-of-four identity flip-vert identity flip-vert))

;; (paint (flipped-pairs wave))

(define (square-limit painter n)
  (let ([combine4 (square-of-four flip-horiz identity rotate180 flip-vert)])
    (combine4 (corner-split painter n))))

;; (paint (square-limit wave 4))

;; 2.46

(define (make-vect x y)
  (cons x y))

(define (xcord-vect vect)
  (car vect))

(define (ycord-vect vect)
  (cdr vect))

(define (add-vect vec1 vec2)
  (make-vect (+ (xcord-vect vec1) (xcord-vect vec2))
             (+ (ycord-vect vec1) (ycord-vect vec2))))
;; (add-vect (make-vect 3 4) (make-vect 5 -1)) => '(8 . 3)

(define (sub-vect vec1 vec2)
  (make-vect (- (xcord-vect vec1) (xcord-vect vec2))
             (- (ycord-vect vec1) (ycord-vect vec2))))
;; (sub-vect (make-vect 3 2) (make-vect 4 5)) => (-1 . -3)

(define (scale-vect s vect)
  (make-vect (* s (xcord-vect vect)) (* s (ycord-vect vect))))
;; (scale-vect 3 (make-vect 7 3)) ;; '(21 . 9)

;; 2.47

(define (frame-coord-map frame)
  (lambda (v)
    (add-vect
     (origin-frame frame)
     (add-vect (scale-vect (xcor-vect v) (edge1-frame frame))
               (scale-vect (ycor-vect v) (edge2-frame frame))))))

