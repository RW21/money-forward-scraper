#lang racket

(require html-parsing sxml threading)

(define parsed-html 
    (~>> "/home/rw21/Downloads/money.html"
        file->string
        html->xexp
    ))

(define table ((sxpath "//*[contains(@id,'js-transaction-')]/td[position() = 2 or position() = 3 or position() = 4]/div/span") parsed-html))

(define (table->csv table csv-output-port)
    (let loop ([count 0] [acc table])
      (cond
        [(empty? table) empty]
        [(or (= count 0) (= count 1)) (fprintf (csv-output-port) "~a," (second (car acc))) (loop (add1 count) (rest acc))]
        [(= count 2) (fprintf (csv-output-port) "~a\n" (third (car acc))) (loop 0 (rest acc))]
        )
        ))

(table->csv table current-output-port)
