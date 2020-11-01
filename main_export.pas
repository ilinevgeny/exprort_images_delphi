unit main_export;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  StdCtrls, Buttons, ExtCtrls, DBCtrls, ImgList, Dialogs;

type
  TForm1 = class(TForm)
    Button1: TButton;
    //BitBtn1: TBitBtn;
    //ImageList1: TImageList;
    //ImageListHard: TImageList;
    ImageListSoft: TImageList;
    ImageListHard: TImageList;
    //procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DebugMsg(const Msg: String);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
procedure TForm1.DebugMsg(const Msg: String);

begin
    OutputDebugString(PChar(Msg))
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  i: Integer;
  w: Integer;
  b: TBitmap;
  ic: TIcon;
  ActiveBitmap : TBitMap;
begin
  ImageListSoft.DrawingStyle := dsTransparent;
   //for i := 0 to ImageListSoft.Count - 1 do
   for i := 0 to ImageListHard.Count - 1 do
   begin
    b := TBitmap.Create;
    ic := TIcon.Create;

    ActiveBitmap := TBitMap.Create;
    //ActiveBitmap.Mask(255);
    ActiveBitmap.Transparent := true;
    ActiveBitmap.TransparentMode := tmAuto;
    ActiveBitmap.TransparentColor := RGB(255,255,255);
    //ImageListSoft.GetBitmap(i, b);
    //ImageListSoft.GetIcon(i, ic);
    //ImageListSoft.GetBitmap(i, ActiveBitmap);
    ImageListHard.GetIcon(i, ic);
    ImageListHard.GetBitmap(i, ActiveBitmap);
    b.Transparent := true;
    b.TransparentMode := tmAuto;
    b.TransparentColor := RGB(255,255,255);
    b.Height      := 32;
    b.Width       := ActiveBitmap.Width;
    //if
    b.Canvas.Draw (0, 8, ActiveBitmap);
    //b.Height := 32;
    //b.Width := 32;

    b.SaveToFile('z:\abd_images\icons\hard_new\icon_abd_' + IntToStr(i) + '.bmp');
    //ic.SaveToFile('z:\abd_images\icons\soft\icon_abd_' + IntToStr(i) + '.png');
    b.Free;
    ic.Free;
    DebugMsg(IntToStr(i));
   end;
   //DebugMsg(IntToStr(ImageListHard.Height));
end;

end.
