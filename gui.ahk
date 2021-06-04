#SingleInstance Force
#NoEnv
SetWorkingDir %A_ScriptDir%
SetBatchLines -1
FileName=accounts.ini
ywainip=107.23.173.143
gaherisip=107.21.60.95
port=10622
gaherisid=23
ywain1id=41
ywain2id=49
ywain3id=50
ywain4id=51
ywain5id=52
ywain6id=53
ywain7id=54
ywain8id=55
ywain9id=56
ywain10id=57
alb=1
mid=2
hib=3
daocdir=C:\Program Files (x86)\Electronic Arts\Dark Age of Camelot
Gui Add, Button, x24 y240 w79 h22, Edit
Gui Add, Button, x112 y240 w80 h23, Add
Gui Add, Button, x208 y240 w80 h23, Delete
Gui, add, listview, x16 y40 w596 h179 gMyListView vmylistview, Account|Password|Character|Class|Server|Realm
Loop Read, %FileName% ; Read the CSV file
{
	StringSplit, item, A_LoopReadLine, `, ; Split the line from the CSV and store in item1...item4. item0 = Nr of fields
	LV_Add("",item1,item2,item3,item4,item5,item6) ; Throw the items in the list
}
LV_ModifyCol()
LV_ModifyCol(6, 70)
gui, show, AutoSize Center , Teehehe's AHK MultiClient Super Program Thats Bad
Return

MyListView: ; Run this script on double clicking an item in the list
GuiControlGet, mylistview  ; Retrieve the ListBox's current data
currowid := LV_GetNext(0, "F") ; Get the current row number
LV_GetText(Account, currowid,1) ; Get the data of field 1 for this row and store in Data1
LV_GetText(Password, currowid,2)
LV_GetText(Character, currowid,3)
LV_GetText(Server, currowid,5)
LV_GetText(Realm, currowid,6)
;tooltip %Account% %Password% %Character% %Server% %Realm%
run, C:\Program Files (x86)\Electronic Arts\Dark Age of Camelot\game.dll %ywainip% %port% %ywain1id% %Account% %Password% %Character% %mid%, %daocdir%

Return


GuiEscape:
GuiClose:
    ExitApp
