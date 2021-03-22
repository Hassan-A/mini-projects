;utility

(define (list-within lst value)
    (if (member value lst)
        #t
        #f
    )
)

(define (list-within2 lst value)
    (cond 
        ((null? lst) #f)
        ((eq? (car lst) value) #t)
        (else (list-within (cdr lst) value))
    )
)

;lisp in a box
;The board structure will be a vector of 9 slots ex: #(e,e,e,e,e,e,e,e,e)

; (condition '((3 5 7) (1 2 3) (4 5 6)))
;(victory? '#() player)

;make new board

; (player-move '#() player move) 



(define player 'X)

(define *board* '#(X X X e e e e e e))

(define winning-combos '((1 2 3) (4 5 6) (7 8 9) (1 4 7) (2 5 8) (3 6 9) (1 5 9) (3 5 7)))
                        ;  F        F      F         T       F       F      F        F

(define (compare-to-player board combo player)
    (if (and (eq? player (vector-ref board (- (list-ref combo 0) 1)))
             (eq? player (vector-ref board (- (list-ref combo 1) 1)))
             (eq? player (vector-ref board (- (list-ref combo 2) 1)))
        )
        #t
        #f
    )
)

(define (check-combos board combos player)
    (map 
        (lambda (combo)
            (if (compare-to-player board combo player)
                #t
                #f
            )
        )
        combos
    )
)

(define (check-if-player-won board player)
    (member '#t (check-combos board winning-combos player))
)
