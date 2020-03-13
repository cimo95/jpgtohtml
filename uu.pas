unit uu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, ComCtrls, XPMan, shellapi;

type
  T_0 = class(TForm)
    _1: TButton;
    _2: TGroupbox;
    _3: TEdit;
    _4: TEdit;
    _5: TEdit;
    _6: TLabel;
    _7: TLabel;
    _8: TLabel;
    _9: TGroupbox;
    _A: TComboBox;
    _B: TEdit;
    _C: TEdit;
    _D: TEdit;
    _E: TLabel;
    _F: TLabel;
    _10: TLabel;
    _11: TLabel;
    _12: TMemo;
    _13: TProgressBar;
    procedure _1Click(Sender: TObject);
    procedure _3KeyPress(Sender: TObject; var Key: Char);
    procedure _3Change(Sender: TObject);
    procedure _5KeyPress(Sender: TObject; var Key: Char);
    procedure _4KeyPress(Sender: TObject; var Key: Char);
    procedure _DKeyPress(Sender: TObject; var Key: Char);
    procedure _5Change(Sender: TObject);
    procedure _4Change(Sender: TObject);
    procedure _DChange(Sender: TObject);
    procedure _BClick(Sender: TObject);
    procedure _CClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  c0 =['0'..'9', #8];

var
  _0: T_0;

implementation

{$R *.dfm}
function f0(v1: TColor): string;
var
  v0: LongInt;
begin
  v0 := ColorToRGB(v1);
  Result := '#' + IntToHex(v0 and $FF, 2) + IntToHex(v0 shr 8 and $FF, 2) + IntToHex(v0 shr 16 and $FF, 2);
end;

procedure f1(v6: string);
var
  v0: tbitmap;
  v1, v2, v3, v4: integer;
  v5: string;
begin
  v0 := tbitmap.Create;
  v0.LoadFromFile(v6);
  v3 := 0;
  for v2 := 0 to v0.Height - 1 do
  begin
    _0._12.Text := _0._12.Text + '<tr>';
    v5 := '';
    v4 := v0.Width * v0.Height;
    for v1 := 0 to v0.Width - 1 do
    begin
      inc(v3);
      _0._13.Position := trunc((v3 / v4) * 100);
      application.ProcessMessages;
      v5 := v5 + '<td bgcolor="' + f0(v0.Canvas.Pixels[v1, v2]) + '"></td>';
    end;
    _0._12.Text := _0._12.Text + v5 + '</tr>';
  end;
end;

procedure f2(const v2, v3: string);
var
  v0: TBitmap;
  v1: TJPEGImage;
begin
  v0 := TBitmap.Create;
  v0.PixelFormat := pf32bit;
  v1 := TJPEGImage.Create;
  try
    v1.LoadFromFile(v3);
    v0.Width := (v1.Width * strtoint(_0._D.Text)) div 100;
    v0.Height := (v1.Height * strtoint(_0._D.Text)) div 100;
    v0.Canvas.StretchDraw(v0.Canvas.ClipRect, v1);
    case _0._A.ItemIndex of
      0:
        v0.PixelFormat := pf4bit;
      1:
        v0.PixelFormat := pf8bit;
      2:
        v0.PixelFormat := pf15bit;
      3:
        v0.PixelFormat := pf16bit;
      4:
        v0.PixelFormat := pf24bit;
      5:
        v0.PixelFormat := pf32bit;
    end;
    v0.SaveToFile(v2);
  finally
    v1.Free;
    v0.Free;
  end;
end;

procedure T_0._1Click(Sender: TObject);
var
  v0: string;
begin
  if _1.Caption = 'RESET' then
  begin
    shellexecute(handle, 'open', pchar(application.exename), nil, nil, sw_show);
    application.Terminate;
    exit;
  end;
  with _0 do
  begin
    if _D.Text = '0' then
      _D.Text := '80';
    if _5.Text = '0' then
      _5.Text := '2';
    if _4.Text = '0' then
      _4.Text := '1';
    _1.Enabled := false;
    try
      v0 := '<style>table{border-spacing: ' + _3.Text + 'px; table-layout: fixed;}; ' + 'th,td{padding:0px; border: ' + _4.Text + 'px; width: ' + _5.Text + 'px; overflow: hidden;}</style>';
      if (not fileexists(_B.Text)) or (not directoryexists(extractfilepath(_C.Text))) then
      begin
        raise Exception.Create('Pilih file sumber dan hasil yang benar !');
        exit;
      end;
      f2(changefileext(_B.Text, '.bmp'), _B.Text);
      f1(changefileext(_B.Text, '.bmp'));
      deletefile(changefileext(_B.Text, '.bmp'));
      _0._12.Text := v0 + '<table>' + _0._12.Text + '</table>';
      _0._12.Lines.SaveToFile(_C.Text);
      _0._12.Clear;
      raise Exception.Create('prosess selesai');
      _13.Position := 0;
    finally
    end;
    _1.Caption := 'RESET';
    _1.Enabled := true;
  end;
end;

procedure T_0._3Change(Sender: TObject);
begin
  if _3.Text = '' then
    _3.Text := '0';
end;

procedure T_0._4Change(Sender: TObject);
begin
  if _4.Text = '' then
    _4.Text := '0';
end;

procedure T_0._4KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in c0) then
    Key := #0;
end;

procedure T_0._5Change(Sender: TObject);
begin
  if _5.Text = '' then
    _5.Text := '0';
end;

procedure T_0._5KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in c0) then
    Key := #0;
end;

procedure T_0._BClick(Sender: TObject);
var
  v0: topendialog;
begin
  v0 := topendialog.Create(nil);
  v0.Filter := 'JPEG Image (*.jpg)|*.jpg';
  v0.Title := 'Input Gambar';
  if v0.Execute then
    _B.Text := v0.FileName;
  v0.Free;
end;

procedure T_0._CClick(Sender: TObject);
var
  v0: tsavedialog;
begin
  v0 := tsavedialog.Create(nil);
  v0.Filter := 'HTML File (*.html)|*.html';
  v0.Title := 'Simpan Hasil Gambar';
  if v0.Execute then
    _C.Text := changefileext(v0.FileName, '.html');
  v0.Free;
end;

procedure T_0._DChange(Sender: TObject);
begin
  if _3.Text = '' then
    _3.Text := '1';
end;

procedure T_0._DKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in c0) then
    Key := #0;
end;

procedure T_0._3KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in c0) then
    Key := #0;
end;

end.

