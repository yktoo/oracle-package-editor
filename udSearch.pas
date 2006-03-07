{****************************************************************
  $Id: udSearch.pas,v 1.1 2006-03-07 05:35:48 dale Exp $
****************************************************************}
unit udSearch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls, SynEdit, SynEditTypes;

type
  TdSearch = class(TForm)
    bOK: TButton;
    bCancel: TButton;
    pMain: TPanel;
    lSearchText: TLabel;
    cbSearchText: TComboBox;
    gbOptions: TGroupBox;
    cbCaseSensitive: TCheckBox;
    cbWholeWords: TCheckBox;
    cbSelectedOnly: TCheckBox;
    rgDirection: TRadioGroup;
    lReplaceText: TLabel;
    cbReplaceText: TComboBox;
    iIcon: TImage;
    cbReplaceAll: TCheckBox;
    rgScope: TRadioGroup;
    cbPromptForReplace: TCheckBox;
    cbRegexSearch: TCheckBox;
    procedure bOKClick(Sender: TObject);
  private
    FReplace: Boolean;
  end;

  function ShowSearchDlg(bReplace, bSelection: Boolean): Boolean;

implementation
{$R *.DFM}
uses ConsVarsTypes;

  function ShowSearchDlg(bReplace, bSelection: Boolean): Boolean;
  begin
    with TdSearch.Create(Application) do
      try
        FReplace := bReplace;
        cbSearchText.Items.Text := sHistTxSrch;
        cbSearchText.Text := sTxSearch;
        if bReplace then begin
          cbReplaceText.Items.Text := sHistTxRepl;
          cbReplaceText.Text := sTxReplace;
        end else begin
          lReplaceText.Enabled       := False;
          cbReplaceText.Enabled      := False;
          cbReplaceText.Color        := clBtnFace;
          cbReplaceAll.Enabled       := False;
          cbPromptForReplace.Enabled := False;
        end;
        cbCaseSensitive.Checked    := ssoMatchCase    in TxSrchOptions;
        cbWholeWords.Checked       := ssoWholeWord    in TxSrchOptions;
        rgDirection.ItemIndex      := Byte(
                                      ssoBackwards    in TxSrchOptions);
        rgScope.ItemIndex          := Byte(
                                      ssoEntireScope  in TxSrchOptions);
        cbSelectedOnly.Enabled     := bSelection;
        cbSelectedOnly.Checked     := bSelection and (ssoSelectedOnly in TxSrchOptions);
        cbReplaceAll.Checked       := ssoReplaceAll   in TxSrchOptions;
        cbPromptForReplace.Checked := ssoPrompt       in TxSrchOptions;
        cbRegexSearch.Checked      := bRegexSearch;
        Result := ShowModal=mrOK;
      finally
        Free;
      end;
  end;

  procedure TdSearch.bOKClick(Sender: TObject);

    procedure ProcessCBHistory(cb: TComboBox);
    var i: Integer;
    begin
      with cb do
        if Text<>'' then begin
          i := Items.IndexOf(Text);
          if i<0 then Items.Insert(0, Text) else Items.Move(i, 0);
          while Items.Count>30 do Items.Delete(30);
        end;
    end;

  begin
    sTxSearch   := cbSearchText.Text;
    sHistTxSrch := cbSearchText.Items.Text;
    if FReplace then begin
      sTxReplace  := cbReplaceText.Text;
      sHistTxRepl := cbReplaceText.Items.Text;
    end;
    TxSrchOptions := [];
    if cbCaseSensitive.Checked           then Include(TxSrchOptions, ssoMatchCase);
    if cbWholeWords.Checked              then Include(TxSrchOptions, ssoWholeWord);
    if rgDirection.ItemIndex=1           then Include(TxSrchOptions, ssoBackwards);
    if rgScope.ItemIndex=1               then Include(TxSrchOptions, ssoEntireScope);
    if cbSelectedOnly.Checked            then Include(TxSrchOptions, ssoSelectedOnly);
    if FReplace                          then Include(TxSrchOptions, ssoReplace);
    if FReplace and cbReplaceAll.Checked then Include(TxSrchOptions, ssoReplaceAll);
    if cbPromptForReplace.Checked        then Include(TxSrchOptions, ssoPrompt);
    bRegexSearch := cbRegexSearch.Checked;
     // Сохраняем историю
    ProcessCBHistory(cbSearchText);
    if cbReplaceText.Enabled then ProcessCBHistory(cbReplaceText);
  end;

end.

