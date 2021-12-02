table 50113 "LA_Exchange_File"
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
        field(2; ExType; option)
        {
            OptionMembers = " ","Consignor","ConsPakke","Sales","Purchase";
            DataClassification = ToBeClassified;
            Caption = 'Udvekslingstype';

            trigger OnValidate()
            var

            begin

            End;
        }
        field(3; Number; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Nummer';

        }
        field(4; Txt01; Text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Debitor/Kreditor';
        }

        field(5; Txt02; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = '';
        }

        field(6; Txt03; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = '';
        }
        field(7; Txt04; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = '';
        }
        field(8; Txt05; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = '';
        }
        field(9; Txt06; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = '';
        }
        field(10; Txt07; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = '';
        }
        field(11; Txt08; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = '';
        }
        field(12; Txt09; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = '';
        }
        field(13; Txt10; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = '';
        }
        field(14; Txt11; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = '';
        }
        field(15; Txt12; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = '';
        }
        field(16; Txt13; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = '';
        }
        field(17; Txt14; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = '';
        }
        field(18; Txt15; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = '';
        }
        field(19; Txt16; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = '';
        }
        field(20; Txt17; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = '';
        }
        field(21; Txt18; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = '';
        }
        field(22; Txt19; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = '';
        }
        field(23; Txt20; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = '';
        }
        field(24; Dec01; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = '';
        }
        field(25; Dec02; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = '';
        }
        field(26; Dec03; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = '';
        }
        field(27; Dec04; Decimal)
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
        key(ExType; ExType, Number)
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