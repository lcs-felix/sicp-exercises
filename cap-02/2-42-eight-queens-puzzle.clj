(ns clojure-tests.eight-queens)

(def empty-board '())

(defn is-position-safe? [new-position existing-position]
  (let [[new-row new-column] new-position
        [existing-row existing-column] existing-position
        dif (- new-column existing-column)]
    (and (not= new-row existing-row)
         (not= (- new-row dif) existing-row)
         (not= (+ new-row dif) existing-row))))

(defn safe? [_ [new-position & existing-positions]]
  (loop [not-validated-positions existing-positions]
    (if (empty? not-validated-positions)
      true
      (and (is-position-safe? new-position (first not-validated-positions))
           (recur (rest not-validated-positions))))))

(defn adjoin-position [row column rest-of-queens]
  (cons (cons row (list column)) rest-of-queens))

(defn queens [board-size]
  (defn queen-cols [k]
    (if (= k 0)
      (list empty-board)
      (filter
        (fn [positions] (safe? k positions))
        (mapcat
          (fn [rest-of-queens]
            (map (fn [new-row]
                   (adjoin-position new-row k rest-of-queens))
                 (range 1 (inc board-size))))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

(comment
  (queens 0)
  (queens 1)
  (queens 2)
  (queens 3)
  (queens 4) ;; '(((3 4) (1 3) (4 2) (2 1)) ((2 4) (4 3) (1 2) (3 1)))
  )
