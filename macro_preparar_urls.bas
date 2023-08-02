Attribute VB_Name = "Módulo1"
Sub preparar_urls()
'
' Javier Álvar Herrero
'
    Rows("1:1").Select
    Selection.Insert Shift:=xlDown, CopyOrigin:=xlFormatFromLeftOrAbove
    Range("A1").Select
    ActiveCell.FormulaR1C1 = "Sitios web"
    Range("A1").Select
    Selection.AutoFilter
    Columns("A:A").Select
    Selection.Replace What:="https://", Replacement:="", LookAt:=xlPart, _
        SearchOrder:=xlByRows, MatchCase:=False, SearchFormat:=False, _
        ReplaceFormat:=False
    ActiveSheet.Range("$A$1:$A$1000").AutoFilter Field:=1, Criteria1:="=*/?**", _
        Operator:=xlAnd
    Range("A1").Select
    Range(Selection, Selection.End(xlDown)).Select
    Selection.EntireRow.Delete
    ActiveSheet.Range("$A$1:$A$1000").AutoFilter Field:=1
    Range("B1").Select
    ActiveCell.FormulaR1C1 = "=CONCATENATE(""https://"",RC[-1])"
    Range("B1").Select
    Selection.AutoFill Destination:=Range("B1:B1000")
    Range("B1:B1000").Select
    Columns("B:B").Select
    Selection.Copy
    Columns("A:A").Select
    Selection.PasteSpecial Paste:=xlPasteValues, Operation:=xlNone, SkipBlanks _
        :=False, Transpose:=False
    Columns("B:B").Select
    Application.CutCopyMode = False
    Selection.Delete Shift:=xlToLeft
        Range("A1").Select
    Selection.Insert Shift:=xlDown, CopyOrigin:=xlFormatFromLeftOrAbove
    Range("A1").Select
    ActiveCell.FormulaR1C1 = "Webs"
    Range("A1").Select
    Selection.AutoFilter
    Selection.AutoFilter
    ActiveSheet.Range("$A$1:$A$1000").AutoFilter Field:=1, Criteria1:="https://"
    Range(Selection, Selection.End(xlDown)).Select
    Selection.EntireRow.Delete
    ActiveSheet.Range("$A$1:$A$1000").RemoveDuplicates Columns:=1, Header:=xlNo
    Range("A1").Select

End Sub


