unit ut;

interface

uses
  Classes {$IFDEF MSWINDOWS} , Windows {$ENDIF}, Messages, SysUtils, Variants, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, ComCtrls, XPMan;

type
  lup = class(TThread)
  private
    procedure SetName;
  protected
    procedure Execute; override;
  end;

implementation

{ Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure lup.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

uses
 uu;

{$IFDEF MSWINDOWS}
type
  TThreadNameInfo = record
    FType: LongWord;     // must be 0x1000
    FName: PChar;        // pointer to name (in user address space)
    FThreadID: LongWord; // thread ID (-1 indicates caller thread)
    FFlags: LongWord;    // reserved for future use, must be zero
  end;
{$ENDIF}

{ lup }

procedure lup.SetName;
{$IFDEF MSWINDOWS}
var
  ThreadNameInfo: TThreadNameInfo;
{$ENDIF}
begin
{$IFDEF MSWINDOWS}
  ThreadNameInfo.FType := $1000;
  ThreadNameInfo.FName := 'lukis';
  ThreadNameInfo.FThreadID := $FFFFFFFF;
  ThreadNameInfo.FFlags := 0;

  try
    RaiseException( $406D1388, 0, sizeof(ThreadNameInfo) div sizeof(LongWord), @ThreadNameInfo );
  except
  end;
{$ENDIF}
end;

function ColorToHtml(Color: TColor): string;
var
  COL: LongInt;
begin
  COL := ColorToRGB(Color);
  { first convert TColor to Integer to remove the higher bits }
  { erst TColor zu Integer, da die Unnötigen höheren Bit entfernt werden }
  Result := '#' + IntToHex(COL and $FF, 2) +
    IntToHex(COL shr 8 and $FF, 2) +
    IntToHex(COL shr 16 and $FF, 2);
end;

procedure totable(bmpfilename:string);
var bmp:tbitmap; x,y,i,o:integer; s:string;
begin
  bmp := tbitmap.Create;
  bmp.LoadFromFile(bmpfilename);
  i := 0;
  for y := 0 to bmp.Height-1 do
  begin
    f.m.Text := f.m.Text + '<tr>';
    s := '';
    o := bmp.Width * bmp.Height;
    for x := 0 to bmp.Width - 1 do
    begin
      inc(i);
      f.pb.Position :=  trunc((i / o)*100);
      application.ProcessMessages;
      s := s+'<td bgcolor="'+colortohtml(bmp.Canvas.Pixels[x,y])+'"></td>';
    end;
    f.m.Text := f.m.Text + s + '</tr>';
  end;
end;

procedure Jpeg2Bmp(const BmpFileName, JpgFileName: string); // helloacm.com
var
  Bmp: TBitmap;
  Jpg: TJPEGImage;
begin
  Bmp := TBitmap.Create;
  Bmp.PixelFormat := pf32bit;
  Jpg := TJPEGImage.Create;
  try
    Jpg.LoadFromFile(JpgFileName);
    //Bmp.Assign(Jpg);
    bmp.Width := (jpg.Width * strtoint(f.Edit5.Text)) div 100;
    bmp.Height := (jpg.Height * strtoint(f.Edit5.Text)) div 100;
    bmp.Canvas.StretchDraw(bmp.Canvas.ClipRect,jpg);
    case f.ComboBox1.ItemIndex of
     0 : bmp.PixelFormat := pf4bit;
     1 : bmp.PixelFormat := pf8bit;
     2 : bmp.PixelFormat := pf15bit;
     3 : bmp.PixelFormat := pf16bit;
     4 : bmp.PixelFormat := pf24bit;
     5 : bmp.PixelFormat := pf32bit;
    end;
    Bmp.SaveToFile(BmpFileName);
  finally
    Jpg.Free;
    Bmp.Free;
  end;
end;

procedure lup.Execute;
begin end;
end.
