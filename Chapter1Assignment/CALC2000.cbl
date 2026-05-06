       identification division.

       program-id. calc2000.
      *  Programmer.:Dominic Mattern
      *  Date.......: 2026.01.28
      *  GitHub URL.:
      *  https://github.com/Dom987554/COBOL-Chapter1-Assignment.git
      *  Description: This program colculates future values for an
      *  investment and double the investment amount twice.

       environment division.

       input-output section.

       data division.

       file section.

       working-storage section.

      *The values that are initilized at the start.
      *investment-amount: starting value put in the investment.
      *number-of-years: amount many years does the interest apply.
      *yearly-interest-rate: applied interest each year.
       01  input-values.

           05  investment-amount           pic 9999    value 1000.
           05  number-of-years             pic 99       value 10.
           05  yearly-interest-rate        pic 9v9     value 5.5.

      *The fields that only get edited during runtime.
      *future-value: Holds the current money amount through the years.
      *year-counter: Counts how many years have been calculated out.
      *display-interest-rate: used only to display the rate at the end.
      *edited-decimal-value: stores the final future value for display.
       01  work-fields.

           05  future-value                pic 9(7)v99.
           05  year-counter                pic 999.
           05  display-interest-rate       pic 9.9.
           05  edited-whole-value          pic zz,zzz,zz9.
           05  edited-decimal-value        pic zzz,zzz.99.

       procedure division.

      *Formats the start of display output then calculates the
      *investment for 3 years with the inital value being doubled
      *each time.
       000-calculate-future-values.
           display "  Calculating Future Values  ".
           perform 100-calculate-future-value
           compute investment-amount = investment-amount * 2.
           perform 100-calculate-future-value
           compute investment-amount = investment-amount * 2.
           perform 100-calculate-future-value
           display "End of session.".
           stop run.

      *calculates the amount of money there would be if left for 10 
      *years.
       100-calculate-future-value.

           move investment-amount to future-value
           move 1 to year-counter
           perform 120-calculate-next-fv
               until year-counter > number-of-years
           move future-value to edited-decimal-value
           perform 140-display-values.

      *calculates each next year until 10 years have been found then
      *returns the 10 year value.
       120-calculate-next-fv.

           compute future-value rounded =
               future-value +
                   (future-value * yearly-interest-rate / 100).
           add 1 to year-counter.

      *displays the investment amount, number of years, yearly
      *interest, and value after 10 years.
       140-display-values.
           display "- - - - - - - - - - - - - - -"
           display "Investment Amount =      " investment-amount
           display "Number of Years   =        " number-of-years
           move yearly-interest-rate to display-interest-rate.
           display "Yearly Interest   =       " display-interest-rate 
           display "Future value      =" edited-decimal-value
           display " ".

