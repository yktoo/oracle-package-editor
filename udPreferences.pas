{****************************************************************
  $Id: udPreferences.pas,v 1.2 2006-11-30 10:30:41 dale Exp $
****************************************************************}
unit udPreferences;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Mask, ToolEdit, RXSpin, SynEdit,
  SynEditHighlighter, SynHighlighterSQL, SynEditKeyCmds, ufrConnect;

type
  TdPreferences = class(TForm)
    bApply: TButton;
    bCancel: TButton;
    bKeyAdd: TButton;
    bKeyDelete: TButton;
    bKeyEdit: TButton;
    bKeyResetDefaults: TButton;
    bOK: TButton;
    cbAutoIndent: TCheckBox;
    cbAutoloadStatus: TCheckBox;
    cbAutoLogin: TCheckBox;
    cbAutoSave: TCheckBox;
    cbBgColor: TColorBox;
    cbDragDropEditing: TCheckBox;
    cbEnhanceHomeKey: TCheckBox;
    cbFgColor: TColorBox;
    cbFSBold: TCheckBox;
    cbFSItalic: TCheckBox;
    cbFSStrikeout: TCheckBox;
    cbFSUnderline: TCheckBox;
    cbGroupUndo: TCheckBox;
    cbHighlight: TCheckBox;
    cbLineNums: TCheckBox;
    cbRestoreDesktop: TCheckBox;
    cbShowGutter: TCheckBox;
    cbShowNavHints: TCheckBox;
    cbShowScrollHint: TCheckBox;
    cbSmartTabDelete: TCheckBox;
    cbSmartTabs: TCheckBox;
    cbTabsToSpaces: TCheckBox;
    cbTheme: TComboBox;
    cbTrimTrailingSpaces: TCheckBox;
    cbWantTabs: TCheckBox;
    eEditorFont: TComboEdit;
    eMaxUndo: TRxSpinEdit;
    eRightEdge: TRxSpinEdit;
    eTabWidth: TRxSpinEdit;
    frConnect: TfrConnect;
    gbEdOptions: TGroupBox;
    gbFontStyles: TGroupBox;
    lbCommands: TListBox;
    lbElement: TListBox;
    lBgColor: TLabel;
    lbKeys: TListBox;
    lEditorFont: TLabel;
    lElement: TLabel;
    lFgColor: TLabel;
    lKeyCommands: TLabel;
    lKeys: TLabel;
    lMaxUndo: TLabel;
    lRightEdge: TLabel;
    lSecureWarning: TLabel;
    lTabWidth: TLabel;
    lTheme: TLabel;
    pcMain: TPageControl;
    rgKwCase: TRadioGroup;
    shSQL: TSynSQLSyn;
    tsEditor: TTabSheet;
    tsGeneral: TTabSheet;
    tsHighlight: TTabSheet;
    tsKeys: TTabSheet;
    tsLogin: TTabSheet;
    cbMultilineTabs: TCheckBox;
    procedure AdjustOKCancel(Sender: TObject);
    procedure bKeyAddClick(Sender: TObject);
    procedure bKeyDeleteClick(Sender: TObject);
    procedure bKeyEditClick(Sender: TObject);
    procedure bKeyResetDefaultsClick(Sender: TObject);
    procedure cbHighlightClick(Sender: TObject);
    procedure cbRestoreDesktopClick(Sender: TObject);
    procedure cbShowGutterClick(Sender: TObject);
    procedure ConnectParamsChange(Sender: TObject);
    procedure eEditorFontButtonClick(Sender: TObject);
    procedure lbCommandsClick(Sender: TObject);
    procedure lbCommandsDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
    procedure lbElementClick(Sender: TObject);
    procedure lbElementDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
    procedure lbKeysClick(Sender: TObject);
    procedure UpdateSynElement(Sender: TObject);
    procedure zzApply(Sender: TObject);
  private
    bConnParChanged, bUpdatingSynElement: Boolean;
    FKeys: TSynEditKeyStrokes;
     // Callback procedure to enumerate SynEdit commands
    procedure GetSynEdCommands(const s: String);
    function  KeyGetCurCommand: TSynEditorCommand;
    procedure RefreshKeys;
  protected
    procedure DoCreate; override;
    procedure DoDestroy; override;
  end;

  function EditPreferences: Boolean;

implementation
{$R *.DFM}
uses Main, CommCtrl, EdTS, Menus, udKeyBinding, ConsVarsTypes;

  function EditPreferences: Boolean;
  begin
    with TdPreferences.Create(Application) do
      try
        Result := ShowModal=mrOK;
      finally
        Free;
      end;
  end;

   //===================================================================================================================
   // TdPreferences
   //===================================================================================================================

  procedure TdPreferences.AdjustOKCancel(Sender: TObject);
  begin
    if Visible then begin
      bOK.Enabled := True;
      bCancel.Caption := 'Cancel';
    end;
  end;

  procedure TdPreferences.bKeyAddClick(Sender: TObject);
  var sc1, sc2: TShortCut;
  begin
    sc1 := 0;
    sc2 := 0;
    if EditKeyBinding(sc1, sc2) then begin
      with FKeys.Add do begin
        Command   := KeyGetCurCommand;
        ShortCut  := sc1;
        ShortCut2 := sc2;
      end;
      RefreshKeys;
      AdjustOKCancel(nil);
    end;
  end;

  procedure TdPreferences.bKeyDeleteClick(Sender: TObject);
  begin
    TSynEditKeyStroke(lbKeys.Items.Objects[lbKeys.ItemIndex]).Free;
    RefreshKeys;
    AdjustOKCancel(nil);
  end;

  procedure TdPreferences.bKeyEditClick(Sender: TObject);
  var
    sek: TSynEditKeyStroke;
    sc1, sc2: TShortCut;
  begin
    sek := TSynEditKeyStroke(lbKeys.Items.Objects[lbKeys.ItemIndex]);
    sc1 := sek.ShortCut;
    sc2 := sek.ShortCut2;
    if EditKeyBinding(sc1, sc2) then begin
      sek.ShortCut  := sc1;
      sek.ShortCut2 := sc2;
      RefreshKeys;
      AdjustOKCancel(nil);
    end;
  end;

  procedure TdPreferences.bKeyResetDefaultsClick(Sender: TObject);
  begin
    FKeys.ResetDefaults;
    lbCommands.Invalidate;
  end;

  procedure TdPreferences.cbHighlightClick(Sender: TObject);
  begin
    shSQL.Enabled := cbHighlight.Checked;
    AdjustOKCancel(nil);
  end;

  procedure TdPreferences.cbRestoreDesktopClick(Sender: TObject);
  begin
    cbAutoloadStatus.Enabled := cbRestoreDesktop.Checked;
    AdjustOKCancel(nil);
  end;

  procedure TdPreferences.cbShowGutterClick(Sender: TObject);
  begin
    cbLineNums.Enabled := cbShowGutter.Checked;
    AdjustOKCancel(nil);
  end;

  procedure TdPreferences.ConnectParamsChange(Sender: TObject);
  begin
    bConnParChanged := True;
  end;

  procedure TdPreferences.DoCreate;
  var i: Integer;
  begin
    inherited DoCreate;
    for i := 0 to fMain.tbxsMain.ThemeCount-1 do cbTheme.Items.Add(fMain.tbxsMain.Themes[i]);
     // Adjust Login tab
    frConnect.ConnectParams      := DefConParams;
     // Adjust General tab
    cbAutoLogin.Checked          := bAutoLogin;
    cbAutoSave.Checked           := bAutoSave;
    cbRestoreDesktop.Checked     := bRestoreDesktop;
    cbAutoloadStatus.Checked     := bAutoloadStatus;
    cbTheme.ItemIndex            := cbTheme.Items.IndexOf(fMain.tbxsMain.Theme);
    cbRestoreDesktopClick(nil);
    cbShowNavHints.Checked       := bShowNavHints;
    cbMultilineTabs.Checked      := bMultilineTabs;          
     // Adjust Editor page
    rgKwCase.ItemIndex           := Byte(bUpperKwds);
    with eEditorFont do begin
      Font.Name                  := sEdFontName;
      Font.Size                  := iEdFontSize;
      Text                       := Format('%s %d', [sEdFontName, iEdFontSize]);
    end;
    eMaxUndo.AsInteger           := iMaxUndo;
    eRightEdge.AsInteger         := iRightEdge;
    eTabWidth.AsInteger          := iTabWidth;
    cbShowGutter.Checked         := bShowGutter;
    cbShowGutterClick(nil);
    cbLineNums.Checked           := bLineNums;
    cbAutoIndent.Checked         := eoAutoIndent         in SynEditOpts;
    cbDragDropEditing.Checked    := eoDragDropEditing    in SynEditOpts;
    cbShowScrollHint.Checked     := eoShowScrollHint     in SynEditOpts;
    cbSmartTabs.Checked          := eoSmartTabs          in SynEditOpts;
    cbTabsToSpaces.Checked       := eoTabsToSpaces       in SynEditOpts;
    cbTrimTrailingSpaces.Checked := eoTrimTrailingSpaces in SynEditOpts;
    cbSmartTabDelete.Checked     := eoSmartTabDelete     in SynEditOpts;
    cbEnhanceHomeKey.Checked     := eoEnhanceHomeKey     in SynEditOpts;
    cbGroupUndo.Checked          := eoGroupUndo          in SynEditOpts;
    cbWantTabs.Checked           := bWantTabs;
     // Adjust Highlight tab
    shSQL.Assign(fMain.shSQL);
    with shSQL do begin
      cbHighlight.Checked        := Enabled;
      for i := 0 to AttrCount-1 do lbElement.Items.AddObject(Attribute[i].Name, Attribute[i]);
    end;
    lbElement.ItemIndex := 0;
    lbElementClick(nil);
     // Adjust Key bindings tab
    GetEditorCommandValues(GetSynEdCommands);
    FKeys := TSynEditKeyStrokes.Create(nil);
    FKeys.Assign(SynEditKeyStrokes);
    lbCommandsClick(nil);
     // Select the first page
    pcMain.ActivePageIndex := 0;
  end;

  procedure TdPreferences.DoDestroy;
  begin
    FKeys.Free;
    inherited DoDestroy;
  end;

  procedure TdPreferences.eEditorFontButtonClick(Sender: TObject);
  begin
    with TFontDialog.Create(Self) do
      try
        Options := [fdAnsiOnly, fdFixedPitchOnly, fdForceFontExist, fdNoOEMFonts, fdNoSimulations];
        Font.Assign(eEditorFont.Font);
        if Execute then begin
          eEditorFont.Font.Assign(Font);
          eEditorFont.Text := Format('%s %d', [Font.Name, Font.Size]);
          AdjustOKCancel(nil);
        end;
      finally
        Free;
      end;
  end;

  procedure TdPreferences.GetSynEdCommands(const s: String);
  var cmd: TSynEditorCommand;
  begin
    cmd := ConvertCodeStringToCommand(s);
    if cmd<>0 then lbCommands.AddItem(ConvertCodeStringToExtended(s), Pointer(cmd)); // Skip ecNone
  end;

  function TdPreferences.KeyGetCurCommand: TSynEditorCommand;
  var i: Integer;
  begin
    i := lbCommands.ItemIndex;
    if i>=0 then Result := TSynEditorCommand(lbCommands.Items.Objects[i]) else Result := 0;
  end;

  procedure TdPreferences.lbCommandsClick(Sender: TObject);
  var
    i, idx: Integer;
    cmd: TSynEditorCommand;
    s: String;
  begin
    lbKeys.Items.BeginUpdate;
    try
      lbKeys.Items.Clear;
      idx := lbCommands.ItemIndex;
      if idx>=0 then begin
        cmd := TSynEditorCommand(lbCommands.Items.Objects[idx]);
        for i := 0 to FKeys.Count-1 do
          with FKeys[i] do
            if Command=cmd then begin
              s := ShortCutToText(ShortCut);
              if ShortCut2<>0 then s := s+', '+ShortCutToText(ShortCut2);
              lbKeys.AddItem(s, FKeys[i]);
            end;
        lbKeys.Enabled := True;
        lbKeys.Color := clWindow;
      end else begin
        lbKeys.Enabled := False;
        lbKeys.Color := clBtnFace;
      end;
      lbKeysClick(nil);
    finally
      lbKeys.Items.EndUpdate;
    end;
  end;

  procedure TdPreferences.lbCommandsDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
  begin
    with lbCommands.Canvas do begin
      FillRect(Rect);
      if FKeys.FindCommand(TSynEditorCommand(lbCommands.Items.Objects[Index]))>=0 then
        ImageList_Draw(fMain.ilMain.Handle, iiOK, Handle, Rect.Left, Rect.Top, ILD_NORMAL);
      Inc(Rect.Left, 18);
      DrawText(Handle, PChar(lbCommands.Items[Index]), -1, Rect, DT_LEFT or DT_SINGLELINE or DT_NOPREFIX or DT_VCENTER);
    end;
  end;

  procedure TdPreferences.lbElementClick(Sender: TObject);
  var i: Integer;
  begin
    bUpdatingSynElement := True;
    try
      i := lbElement.ItemIndex;
      if i>=0 then
        with TSynHighlighterAttributes(lbElement.Items.Objects[i]) do begin
          cbFgColor.Selected    := Foreground;
          cbBgColor.Selected    := Background;
          cbFSBold.Checked      := fsBold      in Style;
          cbFSItalic.Checked    := fsItalic    in Style;
          cbFSUnderline.Checked := fsUnderline in Style;
          cbFSStrikeout.Checked := fsStrikeOut in Style;
        end;
    finally
      bUpdatingSynElement := False;
    end;
  end;

  procedure TdPreferences.lbElementDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
  var sha: TSynHighlighterAttributes;

    function CIfDef(c, cDef: TColor): TColor;
    begin
      if c=clNone then Result := cDef else Result := c;
    end;

  begin
    sha := TSynHighlighterAttributes(lbElement.Items.Objects[Index]);
    with lbElement.Canvas do begin
      if not (odSelected in State) then begin
        Font.Color  := CIfDef(sha.Foreground, clWindowText);
        Brush.Color := CIfDef(sha.Background, clWindow);
      end;
      FillRect(Rect);
      Font.Style := sha.Style;
      DrawText(Handle, PChar(lbElement.Items[Index]), -1, Rect, DT_LEFT or DT_SINGLELINE or DT_NOPREFIX or DT_VCENTER);
    end;
  end;

  procedure TdPreferences.lbKeysClick(Sender: TObject);
  var bEn, bSel: Boolean;
  begin
    bEn := lbKeys.Enabled;
    bSel := bEn and (lbKeys.ItemIndex>=0);
    bKeyAdd.Enabled    := bEn;
    bKeyDelete.Enabled := bSel;
    bKeyEdit.Enabled   := bSel;
  end;

  procedure TdPreferences.RefreshKeys;
  begin
    lbCommands.Invalidate;
    lbCommandsClick(nil);
  end;

  procedure TdPreferences.UpdateSynElement(Sender: TObject);
  var
    i: Integer;
    fs: TFontStyles;
    r: TRect;
  begin
    if bUpdatingSynElement then Exit;
    i := lbElement.ItemIndex;
    if i>=0 then begin
      fs := [];
      if cbFSBold.Checked      then Include(fs, fsBold);
      if cbFSItalic.Checked    then Include(fs, fsItalic);
      if cbFSUnderline.Checked then Include(fs, fsUnderline);
      if cbFSStrikeout.Checked then Include(fs, fsStrikeOut);
      with TSynHighlighterAttributes(lbElement.Items.Objects[i]) do begin
        Foreground := cbFgColor.Selected;
        Background := cbBgColor.Selected;
        Style      := fs;
      end;
      with lbElement do begin
        r := ItemRect(i);
        InvalidateRect(Handle, @r, False);
      end;
      AdjustOKCancel(nil);
    end;
  end;

  procedure TdPreferences.zzApply(Sender: TObject);
  begin
     // Get settings for Login tab
    DefConParams         := frConnect.ConnectParams;
    ActiveConParams      := DefConParams;
     // Get settings for General tab
    bAutoLogin           := cbAutoLogin.Checked;
    bAutoSave            := cbAutoSave.Checked;
    bRestoreDesktop      := cbRestoreDesktop.Checked;
    bAutoloadStatus      := cbAutoloadStatus.Checked;
    bShowNavHints        := cbShowNavHints.Checked;
    bMultilineTabs       := cbMultilineTabs.Checked;
    fMain.tbxsMain.Theme := cbTheme.Text;
     // Get settings for Editor tab
    bUpperKwds           := Boolean(rgKwCase.ItemIndex);
    with eEditorFont do begin
      sEdFontName        := Font.Name;
      iEdFontSize        := Font.Size;
    end;
    iMaxUndo             := eMaxUndo.AsInteger;
    iRightEdge           := eRightEdge.AsInteger;
    iTabWidth            := eTabWidth.AsInteger;
    bShowGutter          := cbShowGutter.Checked;
    bLineNums            := cbLineNums.Checked;
    SynEditOpts := [eoDropFiles, eoScrollPastEol, eoScrollHintFollows, eoSmartTabDelete];
    if cbAutoIndent.Checked         then Include(SynEditOpts, eoAutoIndent);
    if cbDragDropEditing.Checked    then Include(SynEditOpts, eoDragDropEditing);
    if cbShowScrollHint.Checked     then Include(SynEditOpts, eoShowScrollHint);
    if cbSmartTabs.Checked          then Include(SynEditOpts, eoSmartTabs);
    if cbTabsToSpaces.Checked       then Include(SynEditOpts, eoTabsToSpaces);
    if cbTrimTrailingSpaces.Checked then Include(SynEditOpts, eoTrimTrailingSpaces);
    if cbSmartTabDelete.Checked     then Include(SynEditOpts, eoSmartTabDelete);
    if cbEnhanceHomeKey.Checked     then Include(SynEditOpts, eoEnhanceHomeKey);
    if cbGroupUndo.Checked          then Include(SynEditOpts, eoGroupUndo);
    bWantTabs            := cbWantTabs.Checked;
     // Get settings for Highlight tab
    fMain.shSQL.Assign(shSQL);
     // Get settings for Key bindings tab
    SynEditKeyStrokes.Assign(FKeys);
  end;

initialization
  SynEditKeyStrokes := TSynEditKeyStrokes.Create(nil);
  SynEditKeyStrokes.ResetDefaults;
finalization
  SynEditKeyStrokes.Free;
end.

