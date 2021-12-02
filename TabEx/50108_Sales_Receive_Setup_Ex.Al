tableextension 50108 "SalesReceiveSetup Inno ERPG" extends "Sales & Receivables Setup"
{
    fields
    {
        field(50100; PctImpNOK; Decimal)
        {
            Caption = 'Procent NOK Import';

        }

        field(50101; PctImpSVE; Decimal)
        {
            Caption = 'Procent SVE Import';

        }

        // her under to stier/placeringer(FTP) til import af ordrer fra NOK+SVE
        //Disse dannes i NOK og SVE regnskaberne og IMP i DK.
        field(50102; NOKImp; Text[50])
        {
            Caption = 'Sti NOK import';

        }

        field(50103; SVEImp; Text[50])
        {
            Caption = 'Sti SVE Import';

        }

        //Så kommer de tilsvarende to til export fra NOK og SVE i disse regnskaber 
        field(50104; NOKExp; Text[50])
        {
            Caption = 'Sti NOK Export';

        }

        field(50105; SVEExp; Text[50])
        {
            Caption = 'Sti SVE Export';

        }

        field(50106; NOKOmkPct; Decimal)
        {
            Caption = 'Omk. Pct. NOK';

        }

        field(50107; NOKProvPct; Decimal)
        {
            Caption = 'Prov. Pct. NOK';

        }

        field(50108; SVEOmkPct; Decimal)
        {
            Caption = 'Omk. Pct. SVE';

        }

        field(50109; SVEProvPct; Decimal)
        {
            Caption = 'Prov. Pct. SVE';

        }

        field(50110; NordicDate; Date)
        {
            Caption = 'Nordic Date';

        }



        field(50112; Country; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Land imp/exp';
            TableRelation = "Country/Region";
        }
        field(50113; SVComp; Code[100])
        {
            Caption = 'Sverige skabelon';
            DataClassification = ToBeClassified;
            TableRelation = Customer."No.";
        }
        field(50114; NoComp; Code[100])
        {
            Caption = 'Norge skabelon';
            DataClassification = ToBeClassified;
            TableRelation = Customer."No.";
        }

        field(50115; eCustStd; Code[100])
        {
            Caption = 'eOrd std. Deb.';
            DataClassification = ToBeClassified;
            TableRelation = Customer."No.";
        }
        field(50116; ShipProfile; Code[100])
        {
            Caption = 'Flg. afsend profil';
            DataClassification = ToBeClassified;
            TableRelation = "Document Sending Profile";
        }
    }

    var

}