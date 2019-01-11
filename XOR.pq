//XOR
(First as logical, Second as logical)=>
let
    Source = (not First and Second) or (First and not Second)
in
    Source
