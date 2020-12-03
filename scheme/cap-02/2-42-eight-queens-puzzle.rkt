#lang racket

(require "./seq-funcs.rkt")

(define empty-board '())

(define (get-column position) (car (cdr position)))

(define (get-row position) (car position))

(define (is-position-safe? new-position existing-position)
  (let* ([new-row (get-row new-position)]
        [new-column (get-column new-position)]
        [existing-row (get-row existing-position)]
        [existing-column (get-column existing-position)]
        [dif (- new-column existing-column)])
    (and (not (= new-row existing-row))
         (not (= (- new-row dif) existing-row))
         (not (= (+ new-row dif) existing-row)))))

(define (safe? _ positions)
  (define (validate-positions new-position positions-to-validate)
    (if (null? positions-to-validate)
      true
      (and (is-position-safe? new-position (first positions-to-validate))
           (validate-positions new-position (cdr positions-to-validate)))))
  (validate-positions (car positions) (cdr positions)))

(define (adjoin-position row column rest-of-queens)
  (cons (cons row (list column)) rest-of-queens))

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
      (list empty-board)
      (filter
        (lambda (positions) (safe? k positions))
        (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
              (adjoin-position
                new-row k rest-of-queens))
                (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
(queen-cols board-size))

(queens 4)
