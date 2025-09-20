⍝ 2022-1: Counting DNA Nucleotides?
⍝ https://apl.quest/2022/1/
{+/4 (1⌈≢⍵)⍴'ACGT'∘.=⍵}
⍝ TIL: ravel (`,`) forces a scalar to become a vector

⍝ 2022-2: Attack of the Mutations!
⍝ https://apl.quest/2022/2/
(+/≠)
⍝ This seemed to easy.
⍝ Could have also used the inner product: `+.≠` where parens are not necessary

⍝ 2022-3: Uniquely Qualified
⍝ https://apl.quest/2022/3/
{(⍺~⍥,⍵) ∪ ⍵~⍥,⍺}
⍝ since both sides must be different, could have used `,` instead of `∪`
⍝ TIL: can use `⍨` in a fork for symmetric args on the same fn: `((~,~⍨)⍥,)`
⍝ another approach would have been: `((∪~∩)⍥,)`

⍝ 2022-4: In the Long One...
⍝ https://apl.quest/2022/4/
{⌈/+/¨⊆⍨(≢⍴⊢)⍵}
⍝ doesn’t work on edge cases `0` or `⍬` args, cause the partition is then empty
⍝ -> a fix is to prepend 0 to the list of lengths
⍝    or even better, add `0⌈`, because prepending ist not performant
⍝ TIL: max/min reduction returns the identity element on an empty list
⍝      which is the smallest/biggest float, because it would not affect the
⍝      outcome of any other argument (there is always a bigger/smaller number)
⍝ TIL: you can directly count each without reduce by using `≢¨`

⍝ 2022-5: Stairway to Heaven
⍝ https://apl.quest/2022/5/
{⌽↑{⍵/'⎕'}¨⍳⍵}
⍝ TIL: outer products can be used to form numeric/boolean patterns
⍝ TIL: a boolean array can easily be used as an index by adding 1
⍝ TIL: if you want to replace something in APL, use an array of integers in the
⍝      desired shape as an index to select from a vector of replacements
⍝      e.g. in this case: `' ⎕'[<index-vector>]`
⍝ TIL: boolean arrays are stored as single bits in memory by APL, so adding 1
⍝      results in 8× more memory overhead, because it has to store integers now
⍝ TIL: the index origin can be set locally in a function by `{⎕IO←0 ◊ …}`
⍝      which avoids having to +1 to the boolean vector, increasing performance
⍝ TIL: the rank function (`⍤`) can be used to avoid nested arrays in mapping
⍝ TIL: in replicate (`/`), negative and positive numbers can be combined to
⍝      mix spaces with characters in one go
