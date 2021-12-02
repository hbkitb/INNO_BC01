xmlport 50121 "Consignor Import ERPG"
{
    Caption = 'Consingnor Import';
    Description = 'Consingnor Import';
    FieldSeparator = ';';
    Format = VariableText;
    FieldDelimiter = '';
    //FileName = 'VARER.txt';
    Direction = Import;
    TextEncoding = UTF8;
    UseRequestPage = false;

    schema
    {

        tableelement("Sales Header"; "Sales Header")
        {
            AutoReplace = false;
            AutoSave = false;
            AutoUpdate = false;
            XmlName = 'GenLine';

            textelement(Name) { }
            textelement(OrderNo) { }
            textelement(CustomerNo) { }
            textelement(TrackNo) { }

            trigger OnBeforeInsertRecord()
            var
            begin
                // Brilliant code right here
            end;

            trigger OnBeforeModifyRecord()
            var

            begin
                /*ss.SetRange("Bill-to Customer No.", CustomerNo);
                ss.SetRange("Order No.", OrderNo);

                if ss.FindSet() then begin
                    ss."Package Tracking No." := TrackNo;
                    ss.Modify(true);

                end;*/

                sa.SetRange("Bill-to Customer No.", CustomerNo);
                sa.SetRange("No.", OrderNo);

                if sa.FindSet() then begin
                    sa."Package Tracking No." := TrackNo;
                    sa.Modify(true);

                end;
            end;


        }

    }



    var
        sa: Record "Sales Header";
        ss: Record "Sales Shipment Header";



    procedure SetParameters(rec: Record "Sales Header")
    var

    begin

        sa := rec;


    end;
}