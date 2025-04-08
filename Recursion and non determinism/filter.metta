
; The filter function keeps elements from a list that satisfy a condition.

(= (is-equal $x $y)
    (if (== $x $y) True False )
)

(= (is-inferior $x $y)
    (if (< $x $y) True False)
)

(= (is-superior $x $y)
    (if (> $x $y) True False)
)

(= (filter $list $condition $value)
    (if (== $list ())
        ()
        (let $head (car-atom $list)
            (let $tail (filter (cdr-atom $list) $condition $value)
                (if ($condition $head $value)
                    (cons-atom $head $tail)
                    $tail
                )
            )
        )
    )
)

; !(filter (1 2 3 4) is-equal 3)

; used assertions for testing
! (assertEqual (filter (1 2 3 4) is-superior 1) (2 3 4))
! (assertEqual (filter (1 2 3 4) is-inferior 3) (1 2))
! (assertEqual (filter (1 2 3 4) is-equal 3) (3))
