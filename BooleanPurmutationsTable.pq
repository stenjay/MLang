
//BooleanPurmutationsTable
(columns as list)=>
let

newTbl = (columnName) => #table({"j", columnName}, List.Transform({true, false}, each {1, _})),

genTable = List.Accumulate(List.Skip(columns), [Table=newTbl(Text.From(columns{0})), i=0],
(state, current)=>[Table=Table.Join(state[Table], "j", newTbl(Text.From(current)), "j"), i=state[i] + 1])[Table],

columnTypes = List.Transform(columns, each {Text.From(_), type logical}),

out = Table.TransformColumnTypes(Table.SelectColumns(genTable, columns), columnTypes)

in
    out