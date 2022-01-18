table 50114 "LA_Exc_File_Pakke"
{
    DataClassification = ToBeClassified;
    fields
    {

        field(1; LAID; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
            Caption = 'LAid';
        }
        field(2; Txt01; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = '';
        }


        field(3; Txt02; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = '';
        }

        field(4; Txt03; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = '';
        }
        field(5; Txt04; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = '';
        }
        field(6; Txt05; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = '';
        }
        field(7; Txt06; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = '';
        }


        field(28; Used; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Er posten brugt';
        }
        field(100; ID; Guid)
        {
            DataClassification = ToBeClassified;
            Caption = 'ID';
        }


    }

    keys
    {



        key(PK; LAID)
        {
            Clustered = true;//
        }
        key(Txt; txt01)
        {

        }
    }

    var


    trigger OnInsert()

    var
        Cust: Text[30];
        Sales: Text[30];
        Pakke: Text[30];
        Pos: Integer;
        SalesPakke: Record "Sales Header";
        SalesInvPakke: Record "Sales Invoice Header";  //HBK / ITB - 180122

    begin
        ID := CreateGuid();   //SystemId;  //CreateGuid();
        //230421->
        cust := '';
        Sales := '';
        Pakke := '';  //Txt02;
        Pos := 0;

        Pos := StrPos(Txt02, ';');
        Txt03 := CopyStr(Txt02, Pos + 1, 100);

        Pos := StrPos(Txt03, ';');
        Sales := CopyStr(Txt03, 1, Pos - 1);
        Txt03 := CopyStr(Txt03, Pos + 1, 100);

        Pos := StrPos(Txt03, ';');
        Cust := CopyStr(Txt03, 1, Pos - 1);
        Txt03 := CopyStr(Txt03, Pos + 1, 100);

        Pakke := Txt03;

        Txt04 := Sales;
        Txt05 := Cust;
        Txt06 := Pakke;

        SalesPakke.Reset;
        SalesPakke.SetRange("No.", Sales);
        SalesPakke.SetRange("Sell-to Customer No.", Cust);
        IF SalesPakke.FindSet then begin
            SalesPakke."Package Tracking No." := Pakke;
            SalesPakke.PakkeNo := Pakke;
            SalesPakke.Modify;
        end;

        //HBK / ITB - 180122 også på evt. opdateret faktura
        SalesInvPakke.Reset;
        SalesInvPakke.SetRange("Order No.", Sales);
        SalesInvPakke.SetRange("Sell-to Customer No.", Cust);
        IF SalesInvPakke.FindSet then begin
            if SalesInvPakke."Package Tracking No." = '' then begin
                SalesInvPakke."Package Tracking No." := Pakke;
                SalesInvPakke.PakkeNo := Pakke;
                SalesInvPakke.Modify;
            end;
        end;
        //HBK / ITB - 180122


    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;


}
