tableextension 50100 "ItemEx ERPG" extends Item
{
    fields
    {
        field(50100; MinPris; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'MinPris';

        }

        field(50101; P1; CODE[20])
        {
            TableRelation = Item."No.";
            DataClassification = ToBeClassified;
            Caption = 'P1';
        }

        field(50102; P2; CODE[20])
        {
            TableRelation = Item."No.";
            DataClassification = ToBeClassified;
            Caption = 'P2';

        }

        field(50103; StrPrKs; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'StkPrKs';

        }

        field(50104; Short; Text[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Short';

        }

        field(50105; PaySaldo; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'PaySaldo';

        }

        field(50106; NoInnoItem; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'NoInnoItem';

        }

        field(50107; UnNumber; Text[15])
        {
            DataClassification = ToBeClassified;
            Caption = 'UNNumber';

        }

        field(50108; Farlig; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Farlig';

        }
        field(50109; ItemName1; Text[100])
        {
            DataClassification = ToBeClassified;

            Caption = 'Vare navn 2';
        }
        field(50110; StkPrLag; Integer)
        {
            DataClassification = ToBeClassified;

            Caption = 'StkPrLag';
        }
        field(50111; StkPrPal; Integer)
        {
            DataClassification = ToBeClassified;

            Caption = 'StkPrPal';
        }
        field(50112; PlacCopy; Text[30])
        {
            DataClassification = ToBeClassified;

            Caption = 'Placering';
        }
        field(50113; CostPriceVAL; Decimal)
        {
            DataClassification = ToBeClassified;

            Caption = 'KostprisVAL';
        }
        field(50114; CostCurrency; Code[3])
        {
            DataClassification = ToBeClassified;

            Caption = 'KostValuta';
            TableRelation = Currency;

        }
        field(50115; ProductVariantId; Text[128])
        {
            DataClassification = ToBeClassified;

            Caption = 'ProductVariantId';

        }
        field(50116; Afgift; Decimal)
        {
            DataClassification = ToBeClassified;

            Caption = 'MineralOlie';

        }
        field(50117; Afgift2; Decimal)
        {
            DataClassification = ToBeClassified;

            Caption = 'SmøreOlie';

        }
        field(50118; Afgift3; Decimal)
        {
            DataClassification = ToBeClassified;

            Caption = 'Co2';

        }
    }
    var

}

