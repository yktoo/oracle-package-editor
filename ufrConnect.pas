{****************************************************************
  $Id: ufrConnect.pas,v 1.1 2006-03-07 05:35:48 dale Exp $
****************************************************************}
unit ufrConnect;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ConsVarsTypes,
  StdCtrls, ExtCtrls;

type
  TfrConnect = class(TFrame)
    cbNetDirect: TCheckBox;
    ePassword: TEdit;
    ePort: TEdit;
    eServer: TEdit;
    eService: TEdit;
    eSID: TEdit;
    eUserName: TEdit;
    gbServer: TGroupBox;
    iIcon: TImage;
    lPassword: TLabel;
    lPort: TLabel;
    lServer: TLabel;
    lService: TLabel;
    lSID: TLabel;
    lUserName: TLabel;
    pMain: TPanel;
    procedure cbNetDirectClick(Sender: TObject);
  private
    procedure SetConnectParams(const Value: TDBConnectParams);
    function  GetConnectParams: TDBConnectParams;
  public
    property ConnectParams: TDBConnectParams read GetConnectParams write SetConnectParams;
  end;

implementation
{$R *.dfm}

  procedure TfrConnect.cbNetDirectClick(Sender: TObject);
  var b: Boolean;
  begin
    b := cbNetDirect.Checked;
    EnableWndCtl(eService, not b);
    EnableWndCtl(eServer,  b);
    EnableWndCtl(ePort,    b);
    EnableWndCtl(eSID,     b);
  end;

  function TfrConnect.GetConnectParams: TDBConnectParams;
  begin
    with Result do begin
      bNetDirect := cbNetDirect.Checked;
      sService   := eService.Text;
      sServer    := eServer.Text;
      sPort      := ePort.Text;
      sSID       := eSID.Text;
      sUserName  := eUserName.Text;
      sPassword  := ePassword.Text;
    end;
  end;

  procedure TfrConnect.SetConnectParams(const Value: TDBConnectParams);
  begin
    with Value do begin
      cbNetDirect.Checked := bNetDirect;
      eService.Text       := sService;
      eServer.Text        := sServer;
      ePort.Text          := sPort;
      eSID.Text           := sSID;
      eUserName.Text      := sUserName;
      ePassword.Text      := sPassword;
    end;
    cbNetDirectClick(nil);
  end;

end.
