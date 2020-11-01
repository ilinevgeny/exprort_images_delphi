program export_images_delphi7;

uses
  Forms,
  main_export in 'main_export.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
