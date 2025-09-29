⍝ 2022-1: Counting DNA Nucleotides?
⍝ https://apl.quest/2022/1/
{+/4 (1⌈≢⍵)⍴'ACGT'∘.=⍵}
⍝ TIL: ravel (`,`) forces a scalar to become a vector

⍝ 2022-2: Attack of the Mutations!
⍝ https://apl.quest/2022/2/
(+/≠)
⍝ this seemed too easy
⍝ could have also used the inner product: `+.≠` where parens are not necessary

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
⍝ TIL: outer products can be used to form numeric/boolean matrix patterns
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

⍝ 2022-6: Pyramid Scheme
⍝ https://apl.quest/2022/6/
⍝ first approach:
{{⍵,[1]1↓⊖⍵}{⍵,1↓[2]⌽⍵}(∘.⌊⍥⍳⍨)⍵}
⍝ refined approach:
(∘.⌊⍨⍤,∘(1↓⌽)⍨⍳)
⍝ was pretty much as intended, but `(∘.⌊⍨⊢,1↓⌽)⍳` would have been even simpler

⍝ 2022-7: Just Golfing Around
⍝ https://apl.quest/2022/7/
⍝ 1. approach with key (`⌸`):
{⊃,/(⊢{⊂(≢⍵)/(+/÷≢)⍵}⌸⍳∘≢)(≢⍵)⍴⍵}
⍝ 2. approach with partition (`⊆`):
{∊{(≢⍵)/(+/÷≢)⍵}¨(⊢⊆⍳∘≢)⍵}
⍝ TIL: use enlist (`∊`) instead of `⊃,/` to unnest nested vectors
⍝ could have used `≢⍴` instead of replicate, which works better in tacid fns
⍝ TIL: if left arg. is not specified in `⌺`, it takes the right arg. as the
⍝      keys vector and its indices (`⍳≢`) as the vals
⍝ TIL: ravel (`,`) turns scalars into vectors
⍝ TIL: grade down (`⍒`) sorts indices of equal numbers in ascending order,
⍝      just like grade up (`⍋`) - when transposed (`⌽`), this can be used to
⍝      combine the lowest and highest index (in this case, to get the average)
⍝ TIL: `X⍳X` gives the indices of each first occurrence in `X`; and
⍝      interval index / “slot” (`⍸`) returns the indices where numbers would
⍝      fit in a vector, so `X⍸X` gives indices of each last occurrence in `X`;
⍝      both can be combined just like with the grading functions

⍝ 2022-8: Let's Split!
⍝ https://apl.quest/2022/8/
⍝ 1. approach, handles all edge-cases:
{(,⍺){⍵{(⍵↑⍺) (⍵↓⍺)} ¯1+⌊/⍵ ⍳ ⍺},⍵}
⍝ tacid version:
(((¯1+⌊/⍤⍳⍨)(↑,⍥⊂↓)⊢)⍥,)
⍝ 2. approach, which doesn’t work for edge-cases:
{⍵⊂⍨1,<\1↓⍵ ∊ ⍺}

⍝ 2022-9: An Average Window (or a Windowed Average)
⍝ https://apl.quest/2022/9/
{(+⌿÷≢)¨(1+⍺×2),/⍺{(⍺⍴1↑⍵),⍵,(⍺⍴¯1↑⍵)}⍵}
⍝ could have reduced with `+` instead of catenating and reducing again on each
⍝ tacid form: `((1+2×⊣)(+/÷⊣)⍴∘⊃,⊢,⍴∘⊃∘⌽)`
⍝ post-processing in tacid form after reduction can be done in the fork’s center
⍝ TIL: get first is `⊃`, get last is `⊃∘⌽` (would `¯1↑v` be more performant?)
⍝ TIL: n-wise reduction with n>2 still inserts the function between arg. pairs
⍝      but does so n-1 times, e.g. `(a F b F c) (b F c F d) …` for n=3
⍝      note: beware application order right->left for non-commutative functions

⍝ 2022-10: Separation Anxiety
⍝ https://apl.quest/2022/10/
⍝ 1. approach with reshape (`⍴`), which works:
{(1+{(3-⍵)×⍵>0}3|≢⍵)↓⌽,⍺,⍨(⌈3÷⍨≢⍵) 3⍴⌽⍵}
⍝ 2. approach with `@`, which fails at removing unwanted leading dots:
{⍺(⌽∘∊(⊣,⍨⊢)¨@((0=⊢)3|⍳⍤≢)),⌽⍵}
⍝ TIL: partitioned enclose (dya. `⊂`) can be used to break up a vector into
⍝      parts according to a given boolean vector
⍝ TIL: '⎕R' does a regex match & replace, in this case: `{⌽'...(?!$)'⎕R'&'⍺⌽⍵}`
⍝ TIL: modulus (`|`) can have a negative right argument to get the inverse rem.
