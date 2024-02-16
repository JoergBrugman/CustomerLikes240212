codeunit 50201 "BSCL Book Type eBook Impl." implements "BSB Book Type Process"
{
    procedure StartDeployBook();
    begin
        Message('Upload ins Portal');
    end;

    procedure StartDeliverBook();
    begin
        Message('E-Mail an den Kunden');
    end;
}