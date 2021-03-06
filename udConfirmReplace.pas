{****************************************************************
  $Id: udConfirmReplace.pas,v 1.2 2006-11-30 10:30:41 dale Exp $
****************************************************************}
unit udConfirmReplace;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls;

type
  TdConfirmReplace = class(TForm)
    btnCancel: TButton;
    btnReplace: TButton;
    btnReplaceAll: TButton;
    btnSkip: TButton;
    iIcon: TImage;
    lMain: TLabel;
  protected
    procedure DoDestroy; override;
  end;

  function AskConfirmReplace(AEditorRect: TRect; X, Y1, Y2: Integer; const AReplaceText: String): Integer;

implementation
{$R *.DFM}

var
  dConfirmReplace: TdConfirmReplace = nil;

  function AskConfirmReplace(AEditorRect: TRect; X, Y1, Y2: Integer; const AReplaceText: String): Integer;
  var iW, iH: integer;
  begin
    if dConfirmReplace=nil then begin
      dConfirmReplace := TdConfirmReplace.Create(Application);
      dConfirmReplace.iIcon.Picture.Icon.Handle := LoadIcon(0, IDI_QUESTION);
    end;
    with dConfirmReplace do begin
      lMain.Caption := Format('Replace this occurence of "%s"?', [AReplaceText]);
      iW := AEditorRect.Right-AEditorRect.Left;
      iH := AEditorRect.Bottom-AEditorRect.Top;
      if iW <= Width then X := AEditorRect.Left - (Width-iW) div 2
      else if X+Width>AEditorRect.Right then X := AEditorRect.Right-Width;
      if Y2>AEditorRect.Top+MulDiv(iH, 2, 3) then Y2 := Y1-Height-4 else Inc(Y2, 4);
      SetBounds(X, Y2, Width, Height);
      Result := ShowModal;
    end;
  end;

   //===================================================================================================================
   // TdConfirmReplace
   //===================================================================================================================

  procedure TdConfirmReplace.DoDestroy;
  begin
    dConfirmReplace := nil;
    inherited DoDestroy;
  end;

end.

