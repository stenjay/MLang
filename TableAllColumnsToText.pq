//TableAllColumnsToText

(InputTable as table) as table =>
let

AllText = Table.TransformColumnTypes  (InputTable, List.Transform(Table.ColumnNames(InputTable),
                                                each {_, type text}))

in
    AllText