//ExcelImportFromNamedRange

(NamedRangeName as text, SheetName as text) as table =>

let
    Source = Excel.CurrentWorkbook(){[Name = NamedRangeName]}[Content][Column1]{0},
    
    File = Excel.Workbook(File.Contents(Source),true,true),
    
    Sheet = File{[Name=SheetName,Kind="Sheet"]}[Data]
    
in
    Sheet