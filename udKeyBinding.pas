{****************************************************************
  $Id: udKeyBinding.pas,v 1.2 2006-11-30 10:30:41 dale Exp $
****************************************************************}
unit udKeyBinding;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls;

type
  TdKeyBinding = class(TForm)
    pMain: TPanel;
    bOK: TButton;
    bCancel: TButton;
    lKey1: TLabel;
    eKey1: THotKey;
    lKey2: TLabel;
    eKey2: THotKey;
    procedure AdjustOKCancel(Sender: TObject);
  end;

  function EditKeyBinding(var sc1, sc2: TShortCut): Boolean;

implementation
{$R *.DFM}

  function EditKeyBinding(var sc1, sc2: TShortCut): Boolean;
  begin
    with TdKeyBinding.Create(Application) do
      try
        eKey1.HotKey := sc1;
        eKey2.HotKey := sc2;
        Result := ShowModal=mrOK;
        if Result then begin
          sc1 := eKey1.HotKey;
          sc2 := eKey2.HotKey;
        end;
      finally
        Free;
      end;
  end;

   //===================================================================================================================
   // TdKeyBinding
   //===================================================================================================================

  procedure TdKeyBinding.AdjustOKCancel(Sender: TObject);
  begin
    if Visible then begin
      bOK.Enabled := eKey1.HotKey<>0;
      bCancel.Caption := 'Cancel';
    end;
  end;

end.

