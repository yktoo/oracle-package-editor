{****************************************************************
  $Id: udAbout.pas,v 1.2 2006-11-30 10:30:41 dale Exp $
****************************************************************}
unit udAbout;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls;

type
  TdAbout = class(TForm)
    Timer: TTimer;
    lStatus: TLabel;
    lVersion: TLabel;
    iLogo: TImage;
    lWebLink: TLabel;
    iCaption: TImage;
    lCloseLink: TLabel;
    procedure TimerTimer(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure lWebLinkClick(Sender: TObject);
    procedure lCloseLinkClick(Sender: TObject);
  private
    FUserHideable: Boolean;
    procedure WMNCHitTest(var Msg: TWMNCHitTest); message WM_NCHITTEST;
     // Отображает окно
    procedure DoActivateDlg;
     // Prop handlers
    function  GetStatus: String;
    procedure SetStatus(const Value: String);
  protected
    procedure DoCreate; override;
    procedure DoDestroy; override;
  public
     // Props
     // -- Текущий отображаемый статус
    property Status: String read GetStatus write SetStatus;
     // -- Если True, то окно может быть скрыто пользователем, иначе оно отображает процесс загрузки
    property UserHideable: Boolean read FUserHideable write FUserHideable;
  end;

  procedure ShowAbout(bUserHideable: Boolean);
  procedure AboutProgress(const s: String);

implementation
{$R *.DFM}
uses ShellAPI, ConsVarsTypes;

var
  dAbout: TdAbout = nil;

  procedure ShowAbout(bUserHideable: Boolean);
  begin
    if dAbout=nil then
      with TdAbout.Create(Application) do begin
        UserHideable := bUserHideable;
        DoActivateDlg;
      end;
  end;

  procedure AboutProgress(const s: String);
  begin
    if dAbout<>nil then dAbout.Status := s;
  end;

   //===================================================================================================================
   // TdAbout
   //===================================================================================================================

  procedure TdAbout.DoActivateDlg;
  var ms: TMemoryStatus;
  begin
    if FUserHideable then
      try
        ms.dwLength := SizeOf(ms);
        GlobalMemoryStatus(ms);
        Status := Format(SMsg_MemoryStatus, [ms.dwMemoryLoad]);
        ShowModal;
      finally
        Free;
      end
    else begin
      iCaption.Hide;
      Show;
      Update;
    end;
  end;

  procedure TdAbout.DoCreate;
  begin
    inherited DoCreate;
    dAbout := Self;
    lVersion.Caption := SApp_Version;
  end;

  procedure TdAbout.DoDestroy;
  begin
    dAbout := nil;
    inherited DoDestroy;
  end;

  procedure TdAbout.FormKeyPress(Sender: TObject; var Key: Char);
  begin
    if Key in [#13, #27] then Close;
  end;

  function TdAbout.GetStatus: String;
  begin
    Result := lStatus.Caption;
  end;

  procedure TdAbout.lCloseLinkClick(Sender: TObject);
  begin
    Close;
  end;

  procedure TdAbout.lWebLinkClick(Sender: TObject);
  begin
    ShellExecute(Handle, nil, PChar(SWebUrl), nil, nil, SW_SHOWNORMAL);
  end;

  procedure TdAbout.SetStatus(const Value: String);
  begin
    lStatus.Caption := iif(Value='', sMsg_Done, Value);
    Update;
    if Value='' then Timer.Enabled := True;
  end;

  procedure TdAbout.TimerTimer(Sender: TObject);
  begin
    Release;
  end;

  procedure TdAbout.WMNCHitTest(var Msg: TWMNCHitTest);
  begin
    with ScreenToClient(Point(Msg.XPos, Msg.YPos)) do
      if (y<=23) and (x<278) then Msg.Result := HTCAPTION else inherited;
  end;

initialization
  ShowAbout(False);
end.
