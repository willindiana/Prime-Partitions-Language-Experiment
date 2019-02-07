#!/usr/bin/racket
#lang racket

(define (isPrimeRec a b)
    (cond
        [(= a 1) false]
        [(= a 2) true]
        [(< b 2) true]
        [(= (modulo a b) 0) false]
        [else (isPrimeRec a (- b 1))]
    )
)

(define (isPrime n)
    (isPrimeRec n (ceiling (sqrt n)))
)

(define (primes a b lst)
    (cond
        [(> a b) lst]
        [else (cond
            [(isPrime b) (primes a (- b 1) (cons b lst))]
            [else (primes a (- b 1) lst)]
        )]
    )
)

(define (printList lst)
    (cond
        [(equal? (rest lst) empty) (display (first lst)) (newline)]
        [else 
            (display (first lst))
            (display " + ")
            (printList (rest lst))]
    )
)

(define (primePartitions n k lst)
    (cond
        [(= n 0) (printList (sort lst <))]
        [(> n k) (for-each (lambda (p)
            (primePartitions (- n p) p (cons p lst))
        ) (primes (+ k 1) n empty))]
    )
)

(define (inputLoop)
    (display "Please enter a number (enter non-number to exit): ")
    (define number (read))
    (cond
        [(not (number? number)) (exit)]
    )
    (primePartitions number 1 empty)
    (newline)
    (inputLoop)
)

(inputLoop)

