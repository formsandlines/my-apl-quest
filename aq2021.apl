⍝ 2021-1: Are You a Bacteria?
⍝ https://apl.quest/2021/1/
{100×(+/⍵∊'GC')÷≢⍵}

⍝ 2021-2: Index-Of Modified
⍝ https://apl.quest/2021/2/
{(≢⍺) {⍵×⍵≤⍺} ⍺⍳⍵}

⍝ 2021-3: Multiplicity
⍝ https://apl.quest/2021/3/
{t←(≢⍺) (≢⍵) ⋄ ⍺((∊¨↓) (t⍴∘.⊢) (/¨)⍨ t⍴0=∘.|)⍵}

⍝ 2021-4: Square Peg, Round Hole
⍝ https://apl.quest/2021/4/
{(○2*⍨⍵÷2)-(⍵*2)÷2}

⍝ 2021-5: Rect-ify
⍝ https://apl.quest/2021/5/
⍝ (doesn’t work for `¨999999 1000000`)
{mat ← {⍵∊⍨(∘.×⍨)⍳⍵}⍵ ⋄ res←((,⍳⍴mat) /⍨ ,⍵ {(⍺ = ⍵[1] × ⍵[2]) ∧ ⍵[1] ≤ ⍵[2]}¨ ⍳⍴mat) ⋄ diffs←({⍵[2] - ⍵[1]}¨ res) ⋄ ⊃((diffs = ⌊/diffs) / res)}

⍝ 2021-6: Fischer Random Chess
⍝ https://apl.quest/2021/6/
{(1= +/⍵[⍸2|⍳8]∊'B') ∧ 2= +/</2 2⍴((⌽⍵)⍳'RK'),⍵⍳'RK'}

⍝ 2021-7: Can You Feel the Magic?
⍝ https://apl.quest/2021/7/
{(⊃∧.=⊢)(+/1 1⍉⌽⍵),(+/1 1⍉⍵),(+⌿⍵),(+/⍵)}

⍝ 2021-8: Time to Make a Difference
⍝ https://apl.quest/2021/8/
(|-)⍥(⊢⊥⍨(-≢)↑{⊢356 24 60})
⍝ could have done padding on the input (via ↑) instead of count and take
⍝ TIL: `⍥` can be used to preprocess left/right args seperately before dyadic fn
⍝ for `⊥`, I could have set `0` instead of `365` for “no upper limit”

⍝ 2021-9: In the Long Run
⍝ https://apl.quest/2021/9/
{⌈/⊃,/(+/¨⊢⊆⊢)¨⊂[2]⊃,/2{3 1⍴(⍺<⍵),(⍺=⍵),⍺>⍵}/⍵}
⍝ could have taken the sign of the pairwise difference between the numbers
⍝ and then pairwise `≠` with `⍸` to capture the distances between changes
⍝ TIL: `⍨` can be used to apply a single arg. to both sides of a dyadic fn
⍝ TIL: `⍸` (mon.) finds indices of all 1's in a boolean array
⍝ TIL: flat arrays are much more performant than nested ones in Dyalog APL

⍝ 2021-10: On the Right Side
⍝ https://apl.quest/2021/10/
{↑(-⍺)↑¨⊆⍵}
⍝ Coincidentally, this is the exact same code as the first in the solution video
⍝ TIL: `⊆` nests flat vectors but ignores already nested ones, contrary to `⊂`
⍝      however, it doesn’t work for scalars, but that doesn’t matter for `¨`
⍝ TIL: reversing (`⌽`) makes it easier to right-align data that was de-nested
⍝      with mix (mon. `↑`)
