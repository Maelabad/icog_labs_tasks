; map function that applies a given function to each element of a list.

(= (square $x)
    (* $x $x)
)

(= (double $x)
    (* 2 $x)
)

; used assertions for testing square and double
! (assertEqual (square 5) 25)
! (assertEqual (double 4) 8)

(= (map $list $func)
    (if (== $list ())
        ()
        (let $head (car-atom $list)
            (let $tail (map (cdr-atom $list) $func)
                (cons-atom ($func $head) $tail)
            )
        )
    )
)

; used assertions for testing map
! (assertEqual (map (1 2 3 4) double) (2 4 6 8))
! (assertEqual (map (1 2 3) square) (1 4 9))
