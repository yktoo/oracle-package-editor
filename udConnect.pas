{****************************************************************
  $Id: udConnect.pas,v 1.1 2006-03-07 05:35:48 dale Exp $
****************************************************************}
unit udConnect;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ufrConnect, StdCtrls;

type
  TdConnect = class(TForm)
    bOK: TButton;
    bCancel: TButton;
    cbSetDefault: TCheckBox;
    frConnect: TfrConnect;
  end;

  function AskConnectParams: Boolean;

implementation
{$R *.DFM}
uses ConsVarsTypes;

  function AskConnectParams: Boolean;
  begin
    with TdConnect.Create(Application) do
      try
        frConnect.ConnectParams := ActiveConParams;
        Result := ShowModal=mrOK;
        if Result then begin
          ActiveConParams := frConnect.ConnectParams;
          if cbSetDefault.Checked then DefConParams := frConnect.ConnectParams;
        end;
      finally
        Free;
      end;
  end;
end.

