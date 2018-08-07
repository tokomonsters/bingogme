unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Effects, FMX.Filter.Effects, FMX.Ani,Math;

type
  TDynIntegerArray = array of integer;


  TForm1 = class(TForm)
    PathAnimation1: TPathAnimation;
    SwipeTransitionEffect1: TSwipeTransitionEffect;
    Button1: TButton;
    Panel1: TPanel;
    LN2: TLabel;
    LN3: TLabel;
    LN4: TLabel;
    LN1: TLabel;
    LN5: TLabel;
    LN6: TLabel;
    LN7: TLabel;
    LN8: TLabel;
    LN9: TLabel;
    LN10: TLabel;
    Button2: TButton;
    LN11: TLabel;
    LN12: TLabel;
    LN13: TLabel;
    LN14: TLabel;
    LN15: TLabel;
    Panel2: TPanel;
    LN62: TLabel;
    LN63: TLabel;
    LN64: TLabel;
    LN61: TLabel;
    LN65: TLabel;
    LN66: TLabel;
    LN67: TLabel;
    LN68: TLabel;
    LN69: TLabel;
    LN70: TLabel;
    LN71: TLabel;
    LN72: TLabel;
    LN74: TLabel;
    LN75: TLabel;
    LN73: TLabel;
    Panel3: TPanel;
    LN47: TLabel;
    LN48: TLabel;
    LN49: TLabel;
    LN46: TLabel;
    LN50: TLabel;
    LN51: TLabel;
    LN52: TLabel;
    LN53: TLabel;
    LN54: TLabel;
    LN55: TLabel;
    LN56: TLabel;
    LN57: TLabel;
    LN59: TLabel;
    LN60: TLabel;
    LN58: TLabel;
    Panel4: TPanel;
    LN32: TLabel;
    LN33: TLabel;
    LN34: TLabel;
    LN31: TLabel;
    LN35: TLabel;
    LN36: TLabel;
    LN37: TLabel;
    LN38: TLabel;
    LN39: TLabel;
    LN40: TLabel;
    LN41: TLabel;
    LN42: TLabel;
    LN44: TLabel;
    LN45: TLabel;
    LN43: TLabel;
    Panel5: TPanel;
    LN17: TLabel;
    LN18: TLabel;
    LN19: TLabel;
    LN16: TLabel;
    LN20: TLabel;
    LN21: TLabel;
    LN22: TLabel;
    LN23: TLabel;
    LN24: TLabel;
    LN25: TLabel;
    LN26: TLabel;
    LN27: TLabel;
    LN29: TLabel;
    LN30: TLabel;
    LN28: TLabel;
    MainL: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  NowIndex:integer;
  IA:TDynIntegerArray;

implementation

{$R *.fmx}
procedure FastPermuteArray(A: TDynIntegerArray);
  procedure Swap(n, m: integer);
  var
    tmp: integer;
  begin
    tmp := A[n];
    A[n] := A[m];
    A[m] := tmp;
  end;
var
  i: Integer;
begin
  for i := High(A) downto 1 do
    Swap(i, RandomRange(0, i));
end;



procedure TForm1.Button1Click(Sender: TObject);
var
  LN:TLabel;
begin
   if NowIndex> 74 then exit;
   if NowIndex > 0 then begin
     LN := TLabel(Self.FindComponent('LN'+Inttostr(NowIndex)));
     LN.TextSettings.FontColor := TAlphaColorRec.Black;
   end;
   LN := TLabel(Self.FindComponent('LN'+Inttostr(NowIndex+1)));
   LN.Text    :=   format ('%0.2d', [IA[NowIndex]] );
   LN.TextSettings.FontColor := TAlphaColorRec.Red;




   MainL.Text := format ('%0.2d', [IA[NowIndex]] );
   NowIndex := NowIndex + 1;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
 ii:integer;
 LN:TLabel;
begin
 //·s§½
  NowIndex := 0;
  SetLength(IA,75);
  for ii := 0 to 74 do begin
   IA[ii] := ii+1;
  end;
  FastPermuteArray(IA);
  for ii := 0 to 74 do begin
    LN := TLabel(Self.FindComponent('LN'+Inttostr(ii+1)));
    LN.Text :=  '--';
    LN.StyledSettings := LN.StyledSettings - [TStyledSetting.ssFontColor];
    LN.TextSettings.FontColor := TAlphaColorRec.Black;
  end;
  MainL.Text := '--';
 // MainL.TextSettings.FontColor := TAlphaColorRec.Red;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   Button2Click(nil);
end;

end.
