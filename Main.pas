{****************************************************************
  $Id: Main.pas,v 1.2 2006-11-30 10:30:41 dale Exp $
****************************************************************}
unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Registry, SynEdit, SynEditTypes, EdTS,
  ConsVarsTypes,
  SynEditRegexSearch, SynEditMiscClasses, SynEditSearch, TBXSwitcher,
  SynEditPlugins, SynMacroRecorder, Menus, TB2Item, TBX, TB2MRU,
  TBXExtItems, ImgList, DB, MemDS, DBAccess, Ora, SynEditHighlighter,
  SynHighlighterSQL, ActnList, TBXStatusBars, VirtualTrees, TBXDkPanels,
  TB2ExtItems, TB2Dock, TB2Toolbar, ComCtrls;

type
  TfMain = class(TForm, ISourceEditorNavigation, ICompileSource)
    aEditCopy: TAction;
    aEditCut: TAction;
    aEditFind: TAction;
    aEditKeyMacroPause: TAction;
    aEditKeyMacroPlay: TAction;
    aEditKeyMacroRecord: TAction;
    aEditPaste: TAction;
    aEditRedo: TAction;
    aEditReplace: TAction;
    aEditSearchAgain: TAction;
    aEditUndo: TAction;
    aFileConnect: TAction;
    aFileDisconnect: TAction;
    aFileExit: TAction;
    aFileOpen: TAction;
    aFileSave: TAction;
    aFileSaveAs: TAction;
    aHelpAbout: TAction;
    aHelpContents: TAction;
    alMain: TActionList;
    aObjectCompile: TAction;
    aObjectDrop: TAction;
    aObjectRefreshStatus: TAction;
    aObjectRetrieve: TAction;
    aViewPreferences: TAction;
    aWindowClose: TAction;
    aWindowCloseAll: TAction;
    bCompile: TTBXItem;
    bConnect: TTBXItem;
    bCopy: TTBXItem;
    bCut: TTBXItem;
    bDisconnect: TTBXItem;
    bDropObject: TTBXItem;
    bExit: TTBXItem;
    bFind: TTBXItem;
    bKeyMacroPause: TTBXItem;
    bKeyMacroPlay: TTBXItem;
    bKeyMacroRecord: TTBXItem;
    bOpen: TTBXSubmenuItem;
    bPaste: TTBXItem;
    bRedo: TTBXItem;
    bRefreshStatus: TTBXItem;
    bReplace: TTBXItem;
    bRetrieveObject: TTBXItem;
    bSave: TTBXItem;
    bSaveAs: TTBXItem;
    bsmNew: TTBXSubmenuItem;
    bUndo: TTBXItem;
    dkBottom: TTBXDock;
    dkLeft: TTBXDock;
    dkRight: TTBXDock;
    dkTop: TTBXDock;
    dpNav: TTBXDockablePanel;
    dpResults: TTBXDockablePanel;
    eObjName: TTBXEditItem;
    giWindowList: TTBGroupItem;
    iEditCopy: TTBXItem;
    iEditCut: TTBXItem;
    iEditFind: TTBXItem;
    iEditKeyMacroPause: TTBXItem;
    iEditKeyMacroPlay: TTBXItem;
    iEditKeyMacroRecord: TTBXItem;
    iEditPaste: TTBXItem;
    iEditRedo: TTBXItem;
    iEditReplace: TTBXItem;
    iEditSearchAgain: TTBXItem;
    iEditUndo: TTBXItem;
    iFileConnect: TTBXItem;
    iFileDisconnect: TTBXItem;
    iFileExit: TTBXItem;
    iFileMRU: TTBXMRUListItem;
    iFileNewFunction: TTBXItem;
    iFileNewPackage: TTBXItem;
    iFileNewProcedure: TTBXItem;
    iFileOpen: TTBXItem;
    iFileSave: TTBXItem;
    iFileSaveAs: TTBXItem;
    iHelpAbout: TTBXItem;
    iHelpContents: TTBXItem;
    ilMain: TTBImageList;
    iObjectCompile: TTBXItem;
    iObjectDrop: TTBXItem;
    iObjectRefreshStatus: TTBXItem;
    iObjectRetrieve: TTBXItem;
    iOpenMRU: TTBXMRUListItem;
    ipmTabWindowClose: TTBXItem;
    iSepEditCut: TTBXSeparatorItem;
    iSepEditFind: TTBXSeparatorItem;
    iSepEditKeyMacroRecord: TTBXSeparatorItem;
    iSepFileDisconnect: TTBXSeparatorItem;
    iSepFileExit: TTBXSeparatorItem;
    iSepFileMRU: TTBXSeparatorItem;
    iSepObjectRetrieve: TTBXSeparatorItem;
    iSepViewPreferences: TTBXSeparatorItem;
    iSepWindowList: TTBXSeparatorItem;
    iSetObjFunction: TTBItem;
    iSetObjPackage: TTBItem;
    iSetObjProcedure: TTBItem;
    iViewPreferences: TTBXItem;
    iViewToggleGeneralToolbar: TTBVisibilityToggleItem;
    iViewToggleMacroToolbar: TTBVisibilityToggleItem;
    iViewToggleNavList: TTBVisibilityToggleItem;
    iViewToggleObjPropsToolbar: TTBVisibilityToggleItem;
    iViewToggleResults: TTBVisibilityToggleItem;
    iViewToggleStatusBar: TTBVisibilityToggleItem;
    iWindowClose: TTBXItem;
    iWindowCloseAll: TTBXItem;
    osMain: TOraSession;
    pcMain: TPageControl;
    pmTabs: TTBXPopupMenu;
    pmToolbars: TTBXPopupMenu;
    qMain: TOraQuery;
    sbarMain: TTBXStatusBar;
    seRegexSearch: TSynEditRegexSearch;
    seSearch: TSynEditSearch;
    shSQL: TSynSQLSyn;
    smEdit: TTBXSubmenuItem;
    smFile: TTBXSubmenuItem;
    smFileNew: TTBXSubmenuItem;
    smHelp: TTBXSubmenuItem;
    smObject: TTBXSubmenuItem;
    smrMain: TSynMacroRecorder;
    smView: TTBXSubmenuItem;
    smWindow: TTBXSubmenuItem;
    tbgiObjName: TTBGroupItem;
    tbMacro: TTBXToolbar;
    tbMain: TTBXToolbar;
    tbMenu: TTBXToolbar;
    tbmruMain: TTBXMRUList;
    tbObject: TTBXToolbar;
    tbpmEditor: TTBXPopupMenu;
    TBSeparatorItem5: TTBXSeparatorItem;
    tbsMain1: TTBXSeparatorItem;
    tbsMain2: TTBXSeparatorItem;
    tbsMain3: TTBXSeparatorItem;
    tbsMain4: TTBXSeparatorItem;
    tbsmObjType: TTBXSubmenuItem;
    tbxsMain: TTBXSwitcher;
    tvNav: TVirtualStringTree;
    tvResults: TVirtualStringTree;
    procedure aaEditCopy(Sender: TObject);
    procedure aaEditCut(Sender: TObject);
    procedure aaEditFind(Sender: TObject);
    procedure aaEditKeyMacroPause(Sender: TObject);
    procedure aaEditKeyMacroPlay(Sender: TObject);
    procedure aaEditKeyMacroRecord(Sender: TObject);
    procedure aaEditPaste(Sender: TObject);
    procedure aaEditRedo(Sender: TObject);
    procedure aaEditReplace(Sender: TObject);
    procedure aaEditSearchAgain(Sender: TObject);
    procedure aaEditUndo(Sender: TObject);
    procedure aaFileConnect(Sender: TObject);
    procedure aaFileDisconnect(Sender: TObject);
    procedure aaFileExit(Sender: TObject);
    procedure aaFileOpen(Sender: TObject);
    procedure aaFileSave(Sender: TObject);
    procedure aaFileSaveAs(Sender: TObject);
    procedure aaHelpAbout(Sender: TObject);
    procedure aaHelpContents(Sender: TObject);
    procedure aaObjectCompile(Sender: TObject);
    procedure aaObjectDrop(Sender: TObject);
    procedure aaObjectRefreshStatus(Sender: TObject);
    procedure aaObjectRetrieve(Sender: TObject);
    procedure aaViewPreferences(Sender: TObject);
    procedure aaWindowClose(Sender: TObject);
    procedure aaWindowCloseAll(Sender: TObject);
    procedure eObjNameAcceptText(Sender: TObject; var NewText: String; var Accept: Boolean);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure NewObjectClick(Sender: TObject);
    procedure pcMainChange(Sender: TObject);
    procedure pcMainChanging(Sender: TObject; var AllowChange: Boolean);
    procedure pcMainMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure sbarMainPanelDblClick(Sender: TTBXCustomStatusBar; Panel: TTBXStatusPanel);
    procedure SetObjectTypeClick(Sender: TObject);
    procedure smrMainStateChange(Sender: TObject);
    procedure tbmruMainClick(Sender: TObject; const Filename: String);
    procedure tvNavBeforeItemErase(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: PVirtualNode; ItemRect: TRect; var ItemColor: TColor; var EraseAction: TItemEraseAction);
    procedure tvNavClick(Sender: TObject);
    procedure tvNavFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure tvNavGetHint(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; var LineBreakStyle: TVTTooltipLineBreakStyle; var HintText: WideString);
    procedure tvNavGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: Integer);
    procedure tvNavGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: WideString);
    procedure tvNavKeyAction(Sender: TBaseVirtualTree; var CharCode: Word; var Shift: TShiftState; var DoDefault: Boolean);
    procedure tvNavPaintText(Sender: TBaseVirtualTree; const TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType);
    procedure tvResultsClick(Sender: TObject);
    procedure tvResultsGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: Integer);
    procedure tvResultsGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: WideString);
    procedure tvResultsInitNode(Sender: TBaseVirtualTree; ParentNode, Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
    procedure tvResultsMeasureItem(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: PVirtualNode; var NodeHeight: Integer);
    procedure tvResultsPaintText(Sender: TBaseVirtualTree; const TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType);
  private
     // Поток для фоновой компиляции объектов
    FCompileThread: TCompileThread;
     // Prop storage
    FCompilingEditor: TEditorTabSheet;
    FScanThread: TSourceScanThread;
     // Создаёт и возвращает экземпляр нового пустого редактора для заданного типа объекта
    function  NewObject(co: TCodeObjType): TEditorTabSheet;
    function  ActiveSynEd: TSynEdit;
    procedure UpdateStatusbar;
    procedure UpdateStatusList;
    procedure DisconnectFromServer;
    procedure ConnectToServer(bAskParams: Boolean);
    procedure SetStatusInfo(const sStatus: String);
    procedure AppHint(Sender: TObject);
    procedure AppActivate(Sender: TObject);
    function  DoLoad(const sFName: TFileName): TEditorTabSheet;
    procedure UpdateSynEditStyles;
     // Updates actions' availability
    procedure EnableActions;
     // Storing/restoring preferences
    procedure SaveSettings;
    procedure LoadSettings;
     // Performs search in the active editor with the options specified
    procedure DoSearch(SrchOpts: TSynSearchOptions);
     // Устанавливает в редакторах текущий сфокусированный в tvNav объект
    procedure LocateCurrentNavObject;
     // Позиционирует редактор на текущий сфокусированный в tvResults статус
    procedure LocateCurrentResults;
     // Настраивает Навигатор согласно текущим установкам
    procedure UpdateNavStyles;
     // Настраивает вкладки согласно текущим установкам
    procedure UpdateTabStyles;
     // Событие клика на пункте выбора окна (меню Window)
    procedure WindowItemClick(Sender: TObject);
     // Отрабатывает изменение текущего активного редактора
    procedure ActiveEditorChanged;
     // ISourceEditorNavigation
    procedure EdNav_GetSource(var sMainSource, sBodySource: String);
    procedure EdNav_SetResultList(NavList: TNavList);
    procedure ISourceEditorNavigation.GetSource     = EdNav_GetSource;
    procedure ISourceEditorNavigation.SetResultList = EdNav_SetResultList;
     // ICompileSource
    function  CmpSrc_GetSession: TOraSession;
    procedure CmpSrc_GetSource(var sMainSource, sBodySource, sObjTypeMain, sObjTypeBody: String);
    procedure CmpSrc_AddResultEntry(SKind: TStatusKind; iLine, iCol: Integer; const sPart, sText: String);
    procedure CmpSrc_Complete(bSuccess: Boolean);
    function  ICompileSource.GetSession     = CmpSrc_GetSession;
    procedure ICompileSource.GetSource      = CmpSrc_GetSource;
    procedure ICompileSource.AddResultEntry = CmpSrc_AddResultEntry;
    procedure ICompileSource.Complete       = CmpSrc_Complete;
     // Message handlers
    procedure CMFocusChanged(var Msg: TMessage); message CM_FOCUSCHANGED;
    procedure WMEditorStatusChanged(var Msg: TMessage); message WM_EditorStatusChanged;
    procedure WMUpdateStatusList(var Msg: TMessage); message WM_UpdateStatusList;
    procedure WMWindowListChanged(var Msg: TMessage); message WM_WindowListChanged;
    procedure WMActiveWindowChanged(var Msg: TMessage); message WM_ActiveWindowChanged;    
     // Prop handlers
    function  GetActiveEditor: TEditorTabSheet;
    function  GetObjectType: TCodeObjType;
    procedure SetActiveEditor(Value: TEditorTabSheet);
    procedure SetCompilingEditor(Value: TEditorTabSheet);
    procedure SetObjectType(Value: TCodeObjType);
  protected
    procedure DoCreate; override;
    procedure DoDestroy; override;
    procedure DoShow; override;
  public
    function  OpenSQL(const sSQL: String; const aParams: Array of const): TOraQuery;
    procedure ParseFile(out co: TCodeObjType; const sFileName: String; out sObjName, sMain, sBody: String; out dtFile: TDateTime);
     // Создаёт новый редактор
    function  NewEditor(co: TCodeObjType; bIsDefaultPage: Boolean; const sFileName, sObjName, sText, sBodyText: String; const dtFileDate: TDateTime): TEditorTabSheet;
     // Обновляет текст в панели статуса, ответственной за позицию курсора
    procedure UpdateCaretText;
     // Открывает файлы из списка 
    procedure OpenFilesFromList(AFiles: TStrings);
     // Вызов сообщений
    procedure PostWindowListChanged;
    procedure PostActiveWindowChanged;
     // Props
     // -- Текущий активный редактор
    property ActiveEditor: TEditorTabSheet read GetActiveEditor write SetActiveEditor;
     // -- Объект, компилируемый на сервере. nil, если в данный момент нет компилируемого объекта
    property CompilingEditor: TEditorTabSheet read FCompilingEditor write SetCompilingEditor;
     // -- Тип текущего редактируемого объекта
    property ObjectType: TCodeObjType read GetObjectType write SetObjectType;
     // -- Поток, сканирующий исходники
    property ScanThread: TSourceScanThread read FScanThread;
  end;

var
  fMain: TfMain;
  bChangingPages: Boolean = False;

implementation
{$R *.DFM}
uses
  Math, ClipBrd, CommCtrl, XPMan,
  RxStrUtils, SynEditKeyCmds, TBXOfficeXPTheme, TBXStripesTheme,
  udPreferences, udConnect, udAbout, udSearch, udRetrieveObject;

   //===================================================================================================================
   // TfMain
   //===================================================================================================================

  procedure TfMain.aaEditCopy(Sender: TObject);
  begin
    ActiveSynEd.CopyToClipboard;
  end;

  procedure TfMain.aaEditCut(Sender: TObject);
  begin
    ActiveSynEd.CutToClipboard;
  end;

  procedure TfMain.aaEditFind(Sender: TObject);
  begin
    if ShowSearchDlg(False, ActiveSynEd.SelAvail) then DoSearch(TxSrchOptions);
  end;

  procedure TfMain.aaEditKeyMacroPause(Sender: TObject);
  begin
    smrMain.Pause;
  end;

  procedure TfMain.aaEditKeyMacroPlay(Sender: TObject);
  begin
    if ActiveControl is TSynEdit then smrMain.PlaybackMacro(TSynEdit(ActiveControl));
  end;

  procedure TfMain.aaEditKeyMacroRecord(Sender: TObject);
  begin
    if ActiveControl is TSynEdit then
      with smrMain do
        case State of
          msStopped: RecordMacro(TSynEdit(ActiveControl));
          msRecording: Stop;
        end;
  end;

  procedure TfMain.aaEditPaste(Sender: TObject);
  begin
    ActiveSynEd.PasteFromClipboard;
  end;

  procedure TfMain.aaEditRedo(Sender: TObject);
  begin
    ActiveSynEd.Redo;
  end;

  procedure TfMain.aaEditReplace(Sender: TObject);
  var i: Integer;
  begin
    if ShowSearchDlg(True, ActiveSynEd.SelAvail) then begin
      ActiveSynEd.SearchEngine := TSynEditSearchCustom(iif(bRegexSearch, seRegexSearch, seSearch));
      i := ActiveSynEd.SearchReplace(sTxSearch, sTxReplace, TxSrchOptions);
      if i=0 then Info(Format(SMsg_SearchStringNotFound, [sTxSearch])) else Info(Format(SMsg_ReplaceSummary, [i, sTxSearch]));
    end;
  end;

  procedure TfMain.aaEditSearchAgain(Sender: TObject);
  begin
    if sTxSearch='' then aEditFind.Execute else DoSearch(TxSrchOptions-[ssoEntireScope, ssoSelectedOnly, ssoReplace]);
  end;

  procedure TfMain.aaEditUndo(Sender: TObject);
  begin
    ActiveSynEd.Undo;
  end;

  procedure TfMain.aaFileConnect(Sender: TObject);
  begin
    ConnectToServer(True);
    SetStatusInfo('');
  end;

  procedure TfMain.aaFileDisconnect(Sender: TObject);
  begin
    DisconnectFromServer;
    SetStatusInfo('');
  end;

  procedure TfMain.aaFileExit(Sender: TObject);
  begin
    Close;
  end;

  procedure TfMain.aaFileOpen(Sender: TObject);
  begin
    with TOpenDialog.Create(Self) do
      try
        DefaultExt := SDefaultFileExt;
        Filter     := SDefaultFileFilter;
        Options    := [ofAllowMultiSelect, ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing];
        Title      := SDlgTitle_OpenFile;
        if Execute then OpenFilesFromList(Files);
      finally
        Free;
      end;
  end;

  procedure TfMain.aaFileSave(Sender: TObject);
  begin
    ActiveEditor.SaveObject;
  end;

  procedure TfMain.aaFileSaveAs(Sender: TObject);
  begin
    ActiveEditor.SaveObjectAs;
  end;

  procedure TfMain.aaHelpAbout(Sender: TObject);
  begin
    ShowAbout(True);
  end;

  procedure TfMain.aaHelpContents(Sender: TObject);
  begin
    Application.MessageBox('Help currently is not available.', 'Error', MB_ICONERROR or MB_OK);
  end;

  procedure TfMain.aaObjectCompile(Sender: TObject);
  begin
    ActiveEditor.Execute;
  end;

  procedure TfMain.aaObjectDrop(Sender: TObject);
  begin
    with ActiveEditor do
      if MessageBox(Self.Handle, PChar(Format(SMsgConfirm_DropObject, [GetObjName])), PChar(SDlgTitle_Confirm), MB_OKCANCEL or MB_ICONEXCLAMATION)=IDOK then DropObject;
  end;

  procedure TfMain.aaObjectRefreshStatus(Sender: TObject);
  begin
    ActiveEditor.LoadResults(True);
  end;

  procedure TfMain.aaObjectRetrieve(Sender: TObject);
  begin
    RetrieveObject;
  end;

  procedure TfMain.aaViewPreferences(Sender: TObject);
  begin
    if EditPreferences then begin
      UpdateSynEditStyles;
      UpdateNavStyles;
      UpdateTabStyles;
    end;
  end;

  procedure TfMain.aaWindowClose(Sender: TObject);
  begin
    if ActiveEditor.CheckSave then begin
      ActiveEditor.Free;
      ActiveEditorChanged;
      PostWindowListChanged;
    end;
  end;

  procedure TfMain.aaWindowCloseAll(Sender: TObject);
  var i: Integer;
  begin
    for i := pcMain.PageCount-1 downto 0 do pcMain.Pages[i].Free;
    ActiveEditorChanged;
    PostWindowListChanged;
  end;

  procedure TfMain.ActiveEditorChanged;
  var ets: TEditorTabSheet;
  begin
    pcMain.Visible := pcMain.PageCount>0;
    EnableActions;
    ets := ActiveEditor;
    if ets<>nil then begin
      ObjectType    := ets.ObjType;
      eObjName.Text := ets.ObjectName;
      ets.EditorActivate;
    end;
    UpdateStatusList;
     // Пишем сообщение 'Scanning source...' в tvNav
    tvNav.Clear;
    tvNav.AddChild(nil);
     // Запускаем сканирующий поток
    FScanThread.SetModified(10);
    PostActiveWindowChanged;
    bChangingPages := False;
  end;

  function TfMain.ActiveSynEd: TSynEdit;
  begin
    if ActiveControl is TSynEdit then Result := TSynEdit(ActiveControl) else raise EAbort.Create('');
  end;

  procedure TfMain.AppActivate(Sender: TObject);
  var i: Integer;
  begin
    for i := 0 to pcMain.PageCount-1 do TEditorTabSheet(pcMain.Pages[i]).CheckDiskFileChange;
  end;

  procedure TfMain.AppHint(Sender: TObject);
  begin
    sbarMain.Panels[2].Caption := Application.Hint;
  end;

  procedure TfMain.CMFocusChanged(var Msg: TMessage);
  begin
    EnableActions;
  end;

  procedure TfMain.CmpSrc_AddResultEntry(SKind: TStatusKind; iLine, iCol: Integer; const sPart, sText: String);
  begin
    CompilingEditor.AddStatusEntry(SKind, iLine, iCol, sPart, sText);
  end;

  procedure TfMain.CmpSrc_Complete(bSuccess: Boolean);
  begin
    if bSuccess then CompilingEditor.LoadResults(False); 
    CompilingEditor := nil;
  end;

  function TfMain.CmpSrc_GetSession: TOraSession;
  begin
    Result := osMain;
  end;

  procedure TfMain.CmpSrc_GetSource(var sMainSource, sBodySource, sObjTypeMain, sObjTypeBody: String);

    function GetSrc(SynEd: TSynEdit): String;
    const aSep: Array[Boolean] of String[1] = (#10, '');
    var i: Integer;
    begin
      Result := 'CREATE OR REPLACE ';
       // Переписываем строки, разделяя их кодами 0AH
      for i := 0 to SynEd.Lines.Count-1 do Result := Result+aSep[i=0]+SynEd.Lines[i];
    end;

  begin
    sMainSource  := GetSrc(CompilingEditor.SynEdMain);
    sObjTypeMain := aCOT[CompilingEditor.ObjType].sName;
    if CompilingEditor.ObjType=coPackage then begin
      sObjTypeBody := 'PACKAGE BODY';
      sBodySource  := GetSrc(CompilingEditor.SynEdBody);
    end else begin
      sObjTypeBody := '';
      sBodySource  := '';
    end;
  end;

  procedure TfMain.ConnectToServer(bAskParams: Boolean);
  begin
    with ActiveConParams do
      if (bAskParams or
          ((bNetDirect and ((sServer='') or (sPort='') or (sSID=''))) or (not bNetDirect and (sService=''))) or
          (sUserName='') or
          (sPassword='')) and
        not AskConnectParams then Exit;
    try
      DisconnectFromServer;
      with ActiveConParams, osMain do begin
        Options.Net := bNetDirect;
        if bNetDirect then Server := Format('%s:%s:%s', [sServer, sPort, sSID]) else Server := sService;
        Username := sUserName;
        Password := sPassword;
        SetStatusInfo(Format(SMsg_ConnectingToServer, [Server]));
        Open;
      end;
    finally
      UpdateStatusbar;
    end;
  end;

  procedure TfMain.DisconnectFromServer;
  begin
    with osMain do
      if Connected then Close;
    UpdateStatusbar;
  end;

  procedure TfMain.DoCreate;
  begin
    inherited DoCreate;
    try
       // Загружаем SQL-курсор
      Screen.Cursors[crSQLWait] := LoadCursor(HInstance, 'CUR_SQLWAIT');
       // Настраиваем Application
      Application.OnHint     := AppHint;
      Application.OnActivate := AppActivate;
       // Инициализируем tvNav
      tvNav.NodeDataSize := SizeOf(TNavRecord);
       // Создаём поток сканирования исходников
      FScanThread := TSourceScanThread.Create(Self);
       // Создаём поток компиляции
      FCompileThread := TCompileThread.Create(Self);
      LoadSettings;
    finally
      SetStatusInfo('');
    end;
  end;

  procedure TfMain.DoDestroy;
  begin
    SaveSettings;
    FScanThread.Shutdown;
    FCompileThread.Shutdown;
    fMain := nil;
    inherited DoDestroy;
  end;

  function TfMain.DoLoad(const sFName: TFileName): TEditorTabSheet;
  var
    i: Integer;
    sMain, sBody, sObjName: String;
    co: TCodeObjType;
    dt: TDateTime;
  begin
     // Ищем такой файл среди открытых
    for i := 0 to pcMain.PageCount-1 do begin
      Result := TEditorTabSheet(pcMain.Pages[i]);
      if SameFileName(Result.FileName, sFName) then begin
        ActiveEditor := Result;
        Exit;
      end;
    end;
     // Если не нашли - разбираем файл
    ParseFile(co, sFName, sObjName, sMain, sBody, dt);
     // Создаём новый редактор
    Result := NewEditor(co, False, sFName, sObjName, sMain, sBody, dt);
  end;

  procedure TfMain.DoSearch(SrchOpts: TSynSearchOptions);
  begin
    ActiveSynEd.SearchEngine := TSynEditSearchCustom(iif(bRegexSearch, seRegexSearch, seSearch));
    if ActiveSynEd.SearchReplace(sTxSearch, '', SrchOpts)=0 then Info(Format(SMsg_SearchStringNotFound, [sTxSearch]));
  end;

  procedure TfMain.DoShow;
  begin
    inherited DoShow;
    ActiveEditorChanged;
    PostWindowListChanged;
  end;

  procedure TfMain.EdNav_GetSource(var sMainSource, sBodySource: String);
  var ets: TEditorTabSheet;
  begin
    sMainSource := '';
    sBodySource := '';
    ets := ActiveEditor;
    if ets<>nil then begin
      sMainSource := ets.SynEdMain.Text;
      if ets.SynEdBody<>nil then sBodySource := ets.SynEdBody.Text;
    end;
  end;

  procedure TfMain.EdNav_SetResultList(NavList: TNavList);
  var
    n: PVirtualNode;
    p: PNavRecord;
    pSaveOffset: TPoint;
  begin
    tvNav.BeginUpdate;
    try
       // Сохраняем положение прокрутки списка
      pSaveOffset := tvNav.OffsetXY;
       // Стираем список
      tvNav.Clear;
       // Копируем список NavList в узлы дерева
      tvNav.RootNodeCount := NavList.Count;
      n := tvNav.GetFirst;
      while n<>nil do begin
        p := tvNav.GetNodeData(n);
        with NavList[n.Index]^ do begin
          p^.NavObjType := NavObjType;
          p^.sName      := sName;
          p^.sArgs      := sArgs;
          p^.iRowMain   := iRowMain;
          p^.iRowBody   := iRowBody;
          p^.iOrd       := iOrd;
        end;
        n := tvNav.GetNextSibling(n);
      end;
       // Восстанавливаем положение прокрутки списка
      tvNav.OffsetXY := pSaveOffset;
    finally
      tvNav.EndUpdate;
    end;
  end;

  procedure TfMain.EnableActions;
  var
    bConnected, bNotCompiling, bOpenFiles, bObjDef, bModified, bSEActive, bHasSel, bCanUndo, bCanRedo, bCanPaste, bCanCompile: Boolean;
    ets: TEditorTabSheet;
    se: TSynEdit;
    sms: TSynMacroState;
  begin
    ets := ActiveEditor;
    bConnected         := osMain.Connected;
    bNotCompiling := FCompilingEditor=nil;
    bOpenFiles    := ets<>nil;
    bModified     := False;
    bCanPaste     := False;
    bHasSel       := False;
    bCanUndo      := False;
    bCanRedo      := False;
    bObjDef       := False;
    bCanCompile   := False;
    bSEActive     := ActiveControl is TSynEdit;
    sms := smrMain.State;
    if bOpenFiles then begin
      bModified := ets.Modified;
      bObjDef := (eObjName.Text<>'') and bConnected;
      bCanCompile := (ets.SynEdMain.Lines.Count>0) and bConnected;
      if bSEActive then begin
        se := TSynEdit(ActiveControl);
        bHasSel   := se.SelAvail;
        bCanUndo  := se.UndoList.CanUndo;
        bCanRedo  := se.RedoList.CanUndo;
        bCanPaste := Clipboard.HasFormat(CF_TEXT);
      end;
    end;
     // File
    aFileSave.Enabled            := bModified;
    aFileSaveAs.Enabled          := bOpenFiles;
    aFileDisconnect.Enabled      := bConnected and bNotCompiling;
    aFileConnect.Enabled         := not bConnected and bNotCompiling;
     // Edit
    aEditUndo.Enabled            := bCanUndo;
    aEditRedo.Enabled            := bCanRedo;
    aEditCut.Enabled             := bHasSel;
    aEditCopy.Enabled            := bHasSel;
    aEditPaste.Enabled           := bCanPaste;
    aEditFind.Enabled            := bOpenFiles and bSEActive;
    aEditReplace.Enabled         := bOpenFiles and bSEActive;
    aEditSearchAgain.Enabled     := bOpenFiles and bSEActive;
    aEditKeyMacroRecord.Enabled  := bSEActive and (sms in [msStopped, msRecording]);
    aEditKeyMacroRecord.Checked  := sms=msRecording;
    aEditKeyMacroPause.Enabled   := sms in [msRecording, msPaused];
    aEditKeyMacroPlay.Enabled    := bSEActive and (sms=msStopped) and (smrMain.EventCount>0);
     // Window
    aWindowClose.Enabled         := bNotCompiling and bOpenFiles;
    aWindowCloseAll.Enabled      := bNotCompiling and bOpenFiles;
     // Object
    aObjectCompile.Enabled       := bNotCompiling and bCanCompile;
    aObjectRefreshStatus.Enabled := bNotCompiling and bObjDef;
    aObjectDrop.Enabled          := bNotCompiling and bObjDef;
    aObjectRetrieve.Enabled      := bNotCompiling and bConnected;
  end;

  procedure TfMain.eObjNameAcceptText(Sender: TObject; var NewText: String; var Accept: Boolean);
  begin
    if Pos('.', NewText)=0 then NewText := ActiveConParams.sUserName+'.'+NewText;
    ActiveEditor.ObjectName := NewText;
  end;

  procedure TfMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  var i: Integer;
  begin
    for i := 0 to pcMain.PageCount-1 do
      if not TEditorTabSheet(pcMain.Pages[i]).CheckSave then begin
        CanClose := False;
        Break;
      end;
  end;

  function TfMain.GetActiveEditor: TEditorTabSheet;
  begin
    Result := TEditorTabSheet(pcMain.ActivePage);
  end;

  function TfMain.GetObjectType: TCodeObjType;
  begin
    if ActiveEditor=nil then Result := coNone else Result := ActiveEditor.ObjType;
  end;

  procedure TfMain.LoadSettings;
  var
    rif: TRegIniFile;
    i: Integer;
    s, sActiveFile, sAttrSect: String;

    procedure ChkOpt(const sOptName: String; opt: TSynEditorOption);
    begin
      if rif.ReadBool(SRegEditor, sOptName, True) then Include(SynEditOpts, opt);
    end;

     // Считывает привязки клавиш
    procedure ReadKeyBindings;
    var
      SL: TStringList;
      i, iCmd: Integer;
      s: String;
      sc1, sc2: TShortCut;
    begin
      SL := TStringList.Create;
      try
        rif.ReadSectionValues(SRegKeyBindings, SL);
        if SL.Count>0 then begin
          SynEditKeyStrokes.Clear;
          for i := 0 to SL.Count-1 do begin
            s := SL.ValueFromIndex[i];
            if IdentToEditorCommand(ExtractWord(1, s, [',']), iCmd) then begin
              sc1 := StrToIntDef(ExtractWord(2, s, [',']), 0);
              sc2 := StrToIntDef(ExtractWord(3, s, [',']), $ffff);
              if (sc1<>0) and (sc2<>$ffff) then
                with SynEditKeyStrokes.Add do begin
                  Command   := iCmd;
                  ShortCut  := sc1;
                  ShortCut2 := sc2;
                end;
            end;
          end;
        end;
      finally
        SL.Free;
      end;
    end;

     // Открывает файл, отображая прогресс. Возвращает редактор файла
    function StartupLoadFile(const sFileName: String): TEditorTabSheet;
    begin
      SetStatusInfo(Format(SMsg_LoadingFile, [sFileName]));
      Result := DoLoad(sFileName);
    end;

     // Восстанавливает последние открытые окошки
    procedure RestoreDesktop;
    var
      i, iMainSynEdHeight, idxActivePage, iMainLine, iMainCol, iBodyLine, iBodyCol: Integer;
      Editor: TEditorTabSheet;
      SL: TStringList;
      s: String;

      function StripInt(var s: String; iDefault: Integer): Integer;
      var i: Integer;
      begin
        i := Pos(',', s);
        if i=0 then i := Length(s)+1;
        Result := StrToIntDef(Copy(s, 1, i-1), iDefault);
        Delete(s, 1, i);
      end;

    begin
      idxActivePage := 0;
       // Перебираем все записи, загруженные из реестра
      SL := TStringList.Create;
      try
        rif.ReadSectionValues(SRegOpenFiles, SL);
        sActiveFile := SL.Values[''];
        for i := 0 to SL.Count-1 do
           // Пропускаем запись активного файла
          if SL.Names[i]<>'' then begin
            s := SL.ValueFromIndex[i];
             // Извлекаем разделённые запятыми числа
            iMainCol         := StripInt(s, 1);
            iMainLine        := StripInt(s, 1);
            iBodyCol         := StripInt(s, 1);
            iBodyLine        := StripInt(s, 1);
            iMainSynEdHeight := StripInt(s, 0);
             // Последним в строке идёт имя файла
            if FileExists(s) then begin
              Editor := StartupLoadFile(s);
              if iMainSynEdHeight>0 then Editor.SynEdMain.Height := iMainSynEdHeight;
              Editor.LocateEditors(iMainLine, iMainCol, iBodyLine, iBodyCol, False, False);
              if AnsiSameText(s, sActiveFile) then idxActivePage := Editor.PageIndex;
            end;
          end;
      finally
        SL.Free;
      end;
      if idxActivePage<pcMain.PageCount then ActiveEditor := TEditorTabSheet(pcMain.Pages[idxActivePage]);
    end;

    procedure ProcessCommandLine;
    var i: Integer;
    begin
      for i := 1 to ParamCount do
        try
          StartupLoadFile(ParamStr(i));
        except
          Application.HandleException(Self);
        end;
    end;

  begin
     // Load toolbars
    TBRegLoadPositions(Self, HKEY_CURRENT_USER, SRegToolbarsKey);
     // Create reginifile instance
    rif := TRegIniFile.Create(SRegBaseKey);
    try
       // Load open files MRU
      tbmruMain.LoadFromRegIni(rif, SRegOpenMRU);
      with rif do begin
         // Read main window params
        s := ReadString (SRegMainWindow,  'Position',  '');
        if s<>'' then
          SetBounds(
            StrToIntDef(ExtractWord(1, s, [',']), Left),
            StrToIntDef(ExtractWord(2, s, [',']), Top),
            StrToIntDef(ExtractWord(3, s, [',']), Width),
            StrToIntDef(ExtractWord(4, s, [',']), Height));
        WindowState := TWindowState(
                               ReadInteger(SRegMainWindow,  'State',              Integer(WindowState)));
        tbxsMain.Theme :=      ReadString (SRegMainWindow,  'Theme',              'Default');
         // Read Login settings
        with DefConParams do begin
          bNetDirect        := ReadBool   (SRegLogin,       'NetDirect',          True);
          sService          := ReadString (SRegLogin,       'Service',            'oracle.world');
          sServer           := ReadString (SRegLogin,       'Server',             '0.0.0.0');
          sPort             := ReadString (SRegLogin,       'Port',               '1521');
          sSID              := ReadString (SRegLogin,       'SID',                'ORCL');
          sUserName         := ReadString (SRegLogin,       'UserName',           '');
          sPassword         := Decrypt(
                               ReadString (SRegLogin,       'Password',           Encrypt('')));
        end;
        bAutoLogin          := ReadBool   (SRegLogin,       'AutoLogin',          False);
        bAutoSave           := ReadBool   (SRegEditor,      'AutoSave',           False);
        bRestoreDesktop     := ReadBool   (SRegEditor,      'RestoreDesktop',     False);
        bAutoloadStatus     := ReadBool   (SRegEditor,      'AutoloadStatus',     True);
        bShowNavHints       := ReadBool   (SRegEditor,      'ShowNavHints',       True);
        UpdateNavStyles;
        bMultilineTabs      := ReadBool   (SRegEditor,      'MultilineTabs',      True);
        UpdateTabStyles;
        // Read Editor settings
        bUpperKwds          := ReadBool   (SRegEditor,      'UpperKwds',          False);
        sEdFontName         := ReadString (SRegEditor,      'EdFontName',         'Courier New');
        iEdFontSize         := ReadInteger(SRegEditor,      'EdFontSize',         10);
        iMaxUndo            := ReadInteger(SRegEditor,      'MaxUndo',            1024);
        iRightEdge          := ReadInteger(SRegEditor,      'RightEdge',          80);
        iTabWidth           := ReadInteger(SRegEditor,      'TabWidth',           8);
        bShowGutter         := ReadBool   (SRegEditor,      'ShowGutter',         True);
        bLineNums           := ReadBool   (SRegEditor,      'LineNums',           True);
        SynEditOpts := [eoDropFiles, eoScrollPastEol, eoScrollHintFollows, eoSmartTabDelete];
        ChkOpt('AutoIndent',         eoAutoIndent);
        ChkOpt('DragDropEditing',    eoDragDropEditing);
        ChkOpt('ShowScrollHint',     eoShowScrollHint);
        ChkOpt('SmartTabs',          eoSmartTabs);
        ChkOpt('TabsToSpaces',       eoTabsToSpaces);
        ChkOpt('TrimTrailingSpaces', eoTrimTrailingSpaces);
        ChkOpt('SmartTabDelete',     eoSmartTabDelete);
        ChkOpt('EnhanceHomeKey',     eoEnhanceHomeKey);
        ChkOpt('GroupUndo',          eoGroupUndo);
        bWantTabs           := ReadBool   (SRegEditor,      'WantTabs',           False);
        UpdateSynEditStyles;
         // Read Highlight settings
        with shSQL do begin
          Enabled           := ReadBool   (SRegHighlight,   'UseHighlight',       True);
          for i := 0 to AttrCount-1 do
            with Attribute[i] do begin
              sAttrSect := SRegHighlight+'\'+Name;
              Foreground    := ReadInteger(sAttrSect,     'FgColor',            Foreground);
              Background    := ReadInteger(sAttrSect,     'BgColor',            Background);
              Style         := TFontStyles(Byte(
                               ReadInteger(sAttrSect,     'Style',              Byte(Style))));
            end;
        end;
         // Read key bindings
        ReadKeyBindings; 
         // Read other settings
        sbarMain.Visible    := ReadBool   (SRegPreferences, 'ShowStatusbar',      True);
        sHistTxSrch         := ReadString (SRegPreferences, 'SearchHistory',      '');
        sHistTxRepl         := ReadString (SRegPreferences, 'ReplaceHistory',     '');
        TxSrchOptions       := TSynSearchOptions(Byte(
                               ReadInteger(SRegPreferences, 'SearchOptions',      0)));
        bRegexSearch        := ReadBool   (SRegPreferences, 'RegexSearch',        False);
         // Восстанавливаем последние открытые файлы
        if bRestoreDesktop then RestoreDesktop;
         // Открываем файлы, переданные в командной строке
        ProcessCommandLine;
      end;
    finally
      rif.Free;
    end;
    ActiveConParams := DefConParams;
     // Если включен autologin, пытаемся подключиться к серверу
    if bAutoLogin then begin
      ConnectToServer(False);
       // Если включена автозагрузка статуса, считываем статус каждого объекта
      if osMain.Connected and bRestoreDesktop and bAutoloadStatus then
        for i := 0 to pcMain.PageCount-1 do TEditorTabSheet(pcMain.Pages[i]).LoadResults(True);
    end else
      UpdateStatusbar;
  end;

  procedure TfMain.LocateCurrentNavObject;
  var
    ets: TEditorTabSheet;
    n: PVirtualNode;
    p: PNavRecord;
  begin
    ets := ActiveEditor;
    n   := tvNav.FocusedNode;
    if (ets<>nil) and (n<>nil) then begin
      p := tvNav.GetNodeData(n);
      if p.NavObjType<>notNone then ets.LocateEditors(p.iRowMain, 1, p.iRowBody, 1, True, True);
    end;
  end;

  procedure TfMain.LocateCurrentResults;
  var
    n: PVirtualNode;
    p: PStatusEntry;
    bBody: Boolean;
  begin
    n := tvResults.FocusedNode;
    if n<>nil then begin
      p := ActiveEditor.StatusEntries[n.Index];
      case p.SKind of
        skUnknown: aObjectRefreshStatus.Execute;
        skError: begin
          bBody := p.sPart='PACKAGE BODY';
          ActiveEditor.LocateEditors(
            iif(bBody, 0,       p.iLine),
            iif(bBody, 0,       p.iCol),
            iif(bBody, p.iLine, 0),
            iif(bBody, p.iCol,  0),
            True,
            True);
        end;
      end;
    end;
  end;

  function TfMain.NewEditor(co: TCodeObjType; bIsDefaultPage: Boolean; const sFileName, sObjName, sText, sBodyText: String; const dtFileDate: TDateTime): TEditorTabSheet;
  var ActEd: TEditorTabSheet;
  begin
     // Если текущая страница - новая пустая страница, уничтожаем её
    ActEd := ActiveEditor;
    if (ActEd<>nil) and ActEd.DefaultPage and not ActEd.Modified then ActEd.Free;
     // Создаём страницу
    Result := TEditorTabSheet.Create(pcMain, bIsDefaultPage, co, sFileName, sObjName, sText, sBodyText, dtFileDate);
     // Активизируем её
    ActiveEditor := Result;
    PostWindowListChanged;
  end;

  function TfMain.NewObject(co: TCodeObjType): TEditorTabSheet;
  begin
    Result := NewEditor(
      co,
      True,
      '',
      '',
      StringReplace(ConvertKwd(aCOT[co].pcTemplate), '%', '<noname>', [rfReplaceAll]),
      ConvertKwd('PACKAGE BODY ')+'<noname>'+ConvertKwd(' IS'#13'  ...'#13'END;'),
      0);
  end;

  procedure TfMain.NewObjectClick(Sender: TObject);
  begin
    NewObject(TCodeObjType(TComponent(Sender).Tag));
  end;

  procedure TfMain.OpenFilesFromList(AFiles: TStrings);
  var i: Integer;
  begin
    for i := 0 to AFiles.Count-1 do DoLoad(AFiles[i]);
  end;

  function TfMain.OpenSQL(const sSQL: String; const aParams: array of const): TOraQuery;
  begin
    Result := qMain;
    with Result do begin
      SQL.Text := Format(sSQL, aParams);
      Open;
    end;
  end;

  procedure TfMain.ParseFile(out co: TCodeObjType; const sFileName: String; out sObjName, sMain, sBody: String; out dtFile: TDateTime);
  var i: Integer;

     // Removes the first occurence of «CREATE OR REPLACE» or «CREATE» clause from s until the end;
     // Returns the rest of the string (after clause)
    function StripNearestCREATE(const s: String): String;
    var
      sUpper: String;
      i: Integer;
    begin
      sUpper := AnsiUpperCase(s);
      i := AnsiPos('CREATE OR REPLACE ', sUpper);
      if i>0 then
        Result := Copy(s, i+18, MaxInt)
      else begin
        i := Pos('CREATE ', sUpper);
        if i>0 then Result := Copy(s, i+7, MaxInt) else Result := s;
      end;
      Result := Trim(Result);
    end;

  begin
     // Read file
    with TFileStream.Create(sFileName, fmOpenRead or fmShareDenyWrite) do
      try
        SetLength(sMain, Size);
        Read(sMain[1], Size);
        dtFile := FileDateToDateTime(FileGetDate(Handle));
      finally
        Free;
      end;
     // Remove first «CREATE OR REPLACE» or «CREATE» clause
    sMain := StripNearestCREATE(AdjustLineBreaks(sMain, tlbsCRLF));
     // Determine object type for loaded file
    co := ObjTypeByName(ExtractWord(1, sMain, [' ', #13, #9]));
    if co=coNone then co := coFunction;
    sBody := '';
     // If object is PACKAGE
    if co=coPackage then begin
      i := Pos(#13#10'/'#13#10, sMain);
      if i>0 then begin
        sBody := StripNearestCREATE(StringReplace(Copy(sMain, i+5, MaxInt), #13#10'/'#13#10, #13#10, [rfReplaceAll]));
        sMain := Trim(Copy(sMain, 1, i-1));
         // If body is finished with '/', remove it
        if (sBody<>'') and (sBody[Length(sBody)]='/') then Delete(sBody, Length(sBody), 1);
      end;
    end;
    sObjName := ExtractWord(2, sMain, [' ', #13, #9, '(']);
  end;

  procedure TfMain.pcMainChange(Sender: TObject);
  begin
    ActiveEditorChanged;
  end;

  procedure TfMain.pcMainChanging(Sender: TObject; var AllowChange: Boolean);
  begin
    bChangingPages := True;
  end;

  procedure TfMain.pcMainMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  var iTabIndex: Integer;
  begin
    iTabIndex := pcMain.IndexOfTabAt(x, y);
    if iTabIndex>=0 then begin
      ActiveEditor := TEditorTabSheet(pcMain.Pages[iTabIndex]);
      if Button=mbMiddle then aWindowClose.Execute;
    end;
  end;

  procedure TfMain.PostActiveWindowChanged;
  begin
    PostMessage(Handle, WM_ActiveWindowChanged, 0, 0);
  end;

  procedure TfMain.PostWindowListChanged;
  begin
    PostMessage(Handle, WM_WindowListChanged, 0, 0);
  end;

  procedure TfMain.SaveSettings;
  var rif: TRegIniFile;

    function SynEdCaret(se: TSynEdit): String;
    begin
      if se=nil then Result := '0,0' else Result := Format('%d,%d', [se.CaretX, se.CaretY]);
    end;

     // Сохраняет настройки подсветки
    procedure StoreHighlightSettings;
    var
      i: Integer;
      sAttrSect: String;
    begin
      with shSQL do begin
        rif.WriteBool(SRegHighlight, 'UseHighlight', Enabled);
        for i := 0 to AttrCount-1 do
          with Attribute[i] do begin
            sAttrSect := SRegHighlight+'\'+Name;
            rif.WriteInteger(sAttrSect, 'FgColor', Foreground);
            rif.WriteInteger(sAttrSect, 'BgColor', Background);
            rif.WriteInteger(sAttrSect, 'Style',   Byte(Style));
          end;
      end;
    end;

     // Сохраняет привязки клавиш
    procedure StoreKeyBindings;
    var
      i: Integer;
      s: String;
    begin
      rif.EraseSection(SRegKeyBindings);
      for i := 0 to SynEditKeyStrokes.Count-1 do
        with SynEditKeyStrokes[i] do
          if EditorCommandToIdent(Command, s) then
            rif.WriteString(SRegKeyBindings, IntToStr(i), Format('%s,%d,%d', [s, ShortCut, ShortCut2]));
    end;

     // Сохраняет список открытых файлов и активный файл
    procedure StoreDesktop;
    var
      ets: TEditorTabSheet;
      i: Integer;
    begin
      rif.EraseSection(SRegOpenFiles);
      ets := ActiveEditor;
      if (ets<>nil) and (ets.FileName<>'') then rif.WriteString(SRegOpenFiles, '', ets.FileName);
      for i := 0 to pcMain.PageCount-1 do begin
        ets := TEditorTabSheet(pcMain.Pages[i]);
        if ets.FileName<>'' then
          rif.WriteString(
            SRegOpenFiles,
            'File'+IntToStr(i),
            Format('%s,%s,%d,%s', [SynEdCaret(ets.SynEdMain), SynEdCaret(ets.SynEdBody), ets.SynEdMain.Height, ets.FileName]));
      end;
    end;

  begin
     // Save toolbars
    TBRegSavePositions(Self, HKEY_CURRENT_USER, SRegToolbarsKey);
     // Create reginifile instance
    rif := TRegIniFile.Create(SRegBaseKey);
    try
         // Save open files MRU
      tbmruMain.SaveToRegIni(rif, SRegOpenMRU);
      with rif do begin
         // Write main window params
        WriteString (SRegMainWindow,  'Position',           Format('%d,%d,%d,%d', [Left, Top, Width, Height]));
        WriteInteger(SRegMainWindow,  'State',              Integer(WindowState));
        WriteString (SRegMainWindow,  'Theme',              tbxsMain.Theme);
         // Write Login settings
        with DefConParams do begin
          WriteBool   (SRegLogin,     'NetDirect',          bNetDirect);
          WriteString (SRegLogin,     'Service',            sService);
          WriteString (SRegLogin,     'Server',             sServer);
          WriteString (SRegLogin,     'Port',               sPort);
          WriteString (SRegLogin,     'SID',                sSID);
          WriteString (SRegLogin,     'UserName',           sUserName);
          WriteString (SRegLogin,     'Password',           Encrypt(sPassword));
        end;
        WriteBool   (SRegLogin,       'AutoLogin',          bAutoLogin);
        WriteBool   (SRegEditor,      'AutoSave',           bAutoSave);
        WriteBool   (SRegEditor,      'RestoreDesktop',     bRestoreDesktop);
        WriteBool   (SRegEditor,      'AutoloadStatus',     bAutoloadStatus);
        WriteBool   (SRegEditor,      'ShowNavHints',       bShowNavHints);
        WriteBool   (SRegEditor,      'MultilineTabs',      bMultilineTabs);
         // Write Editor settings
        WriteBool   (SRegEditor,      'UpperKwds',          bUpperKwds);
        WriteString (SRegEditor,      'EdFontName',         sEdFontName);
        WriteInteger(SRegEditor,      'EdFontSize',         iEdFontSize);
        WriteInteger(SRegEditor,      'MaxUndo',            iMaxUndo);
        WriteInteger(SRegEditor,      'RightEdge',          iRightEdge);
        WriteInteger(SRegEditor,      'TabWidth',           iTabWidth);
        WriteBool   (SRegEditor,      'ShowGutter',         bShowGutter);
        WriteBool   (SRegEditor,      'LineNums',           bLineNums);
        WriteBool   (SRegEditor,      'EditorOpts',         eoAutoIndent         in SynEditOpts);
        WriteBool   (SRegEditor,      'DragDropEditing',    eoDragDropEditing    in SynEditOpts);
        WriteBool   (SRegEditor,      'ShowScrollHint',     eoShowScrollHint     in SynEditOpts);
        WriteBool   (SRegEditor,      'SmartTabs',          eoSmartTabs          in SynEditOpts);
        WriteBool   (SRegEditor,      'TabsToSpaces',       eoTabsToSpaces       in SynEditOpts);
        WriteBool   (SRegEditor,      'TrimTrailingSpaces', eoTrimTrailingSpaces in SynEditOpts);
        WriteBool   (SRegEditor,      'SmartTabDelete',     eoSmartTabDelete     in SynEditOpts);
        WriteBool   (SRegEditor,      'EnhanceHomeKey',     eoEnhanceHomeKey     in SynEditOpts);
        WriteBool   (SRegEditor,      'GroupUndo',          eoGroupUndo          in SynEditOpts);
        WriteBool   (SRegEditor,      'WantTabs',           bWantTabs);
         // Прочие настройки
        WriteBool   (SRegPreferences, 'ShowStatusbar',      sbarMain.Visible);
        WriteString (SRegPreferences, 'SearchHistory',      sHistTxSrch);
        WriteString (SRegPreferences, 'ReplaceHistory',     sHistTxRepl);
        WriteInteger(SRegPreferences, 'SearchOptions',      Byte(TxSrchOptions));
        WriteBool   (SRegPreferences, 'RegexSearch',        bRegexSearch);
      end;
       // Сохраняем настройки подсветки
      StoreHighlightSettings;
       // Сохраняем привязки клавиш
      StoreKeyBindings;
       // Сохраняем список открытых файлов и активный файл
      if bRestoreDesktop then StoreDesktop;
    finally
      rif.Free;
    end;
  end;

  procedure TfMain.sbarMainPanelDblClick(Sender: TTBXCustomStatusBar; Panel: TTBXStatusPanel);
  begin
    if Panel.Index=0 then
      if osMain.Connected then aFileDisconnect.Execute else aFileConnect.Execute;
  end;

  procedure TfMain.SetActiveEditor(Value: TEditorTabSheet);
  begin
    pcMain.ActivePage := Value;
    if Visible then ActiveEditorChanged;
  end;

  procedure TfMain.SetCompilingEditor(Value: TEditorTabSheet);
  begin
    if FCompilingEditor<>Value then begin
      FCompilingEditor := Value;
      Screen.Cursor := iif(Value=nil, crDefault, crAppStart);
      UpdateStatusList;
      EnableActions;
      tvResults.Color := iif(Value=nil, clWindow, CResultList_BackWorking);
       // Запускаем компиляцию
      if Value<>nil then FCompileThread.StartCompiling; 
    end;
  end;

  procedure TfMain.SetObjectType(Value: TCodeObjType);
  begin
    if Value=coNone then raise Exception.Create('Invalid code object type in SetObjectType()');
    tbsmObjType.Caption    := aCOT[Value].sName;
    tbsmObjType.ImageIndex := aCOT[Value].ii;
    if (Value<>GetObjectType) and (ActiveEditor<>nil) then ActiveEditor.ObjType := Value;
  end;

  procedure TfMain.SetObjectTypeClick(Sender: TObject);
  begin
    ObjectType := TCodeObjType(TTBItem(Sender).Tag);
  end;

  procedure TfMain.SetStatusInfo(const sStatus: String);
  begin
    sbarMain.Panels[2].Caption := sStatus;
    AboutProgress(sStatus);
    Application.ProcessMessages;
  end;

  procedure TfMain.smrMainStateChange(Sender: TObject);
  begin
    EnableActions;
    UpdateCaretText;
  end;

  procedure TfMain.tbmruMainClick(Sender: TObject; const Filename: String);
  begin
    DoLoad(Filename);
  end;

  procedure TfMain.tvNavBeforeItemErase(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: PVirtualNode; ItemRect: TRect; var ItemColor: TColor; var EraseAction: TItemEraseAction);
  var p: PNavRecord;
  begin
    p := Sender.GetNodeData(Node);
     // Процедуры/функции, отсутствующие в теле пакета, красим красным
    if (p.NavObjType<>notNone) and (p.iRowBody=0) then begin
      ItemColor   := CNavList_BackErroneous;
      EraseAction := eaColor;
    end;
  end;

  procedure TfMain.tvNavClick(Sender: TObject);
  begin
    LocateCurrentNavObject;
  end;

  procedure TfMain.tvNavFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
  begin
    Finalize(PNavRecord(Sender.GetNodeData(Node))^);
  end;

  procedure TfMain.tvNavGetHint(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; var LineBreakStyle: TVTTooltipLineBreakStyle; var HintText: WideString);
  var p: PNavRecord;
  begin
    p := Sender.GetNodeData(Node);
    HintText := Format('%s(%s)', [p.sName, p.sArgs]);
  end;

  procedure TfMain.tvNavGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: Integer);
  begin
    ImageIndex := aiiNavObjTypes[PNavRecord(Sender.GetNodeData(Node)).NavObjType];
  end;

  procedure TfMain.tvNavGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: WideString);
  const asStaticFormat: Array[Boolean, Boolean] of String = ((''{n/a}, '%1:d'), ('%0:d', '%d/%d'));
  var p: PNavRecord;
  begin
    p := Sender.GetNodeData(Node);
    if p.NavObjType=notNone then begin
      if TextType=ttNormal then CellText := SMsg_ScanningSource;
    end else
      case TextType of
        ttNormal: CellText := p.sName;
        ttStatic: CellText := Format(asStaticFormat[p.iRowMain>0, p.iRowBody>0], [p.iRowMain, p.iRowBody]);
      end;
  end;

  procedure TfMain.tvNavKeyAction(Sender: TBaseVirtualTree; var CharCode: Word; var Shift: TShiftState; var DoDefault: Boolean);
  begin
    if (Shift*[ssCtrl,ssShift,ssAlt]=[]) and (CharCode=VK_RETURN) then begin
      LocateCurrentNavObject;
      DoDefault := False;
    end;
  end;

  procedure TfMain.tvNavPaintText(Sender: TBaseVirtualTree; const TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType);
  var
    p: PNavRecord;
    c: TColor;

    function GetColor(cErroneous, cPrivate, cPublic: TColor): TColor;
    begin
       // Если отсутствует в теле пакета
      if (ActiveEditor.ObjType=coPackage) and (p.iRowBody=0) then Result := cErroneous
       // Если отсутствует в заголовке пакета
      else if p.iRowMain=0 then Result := cPrivate
       // Public-процедура/функция
      else Result := cPublic;
    end;

  begin
    c := 0;
    case TextType of
       // Normal text
      ttNormal: begin
        p := Sender.GetNodeData(Node);
        case p.NavObjType of
           // -- Сообщение 'Scanning source...'
          notNone:      c := CNavList_FontScanning;
           // -- Процедура
          notProcedure: c := GetColor(CNavList_FontErroneous, CNavList_FontPrivateProc, CNavList_FontPublicProc);
           // -- Функция
          notFunction:  c := GetColor(CNavList_FontErroneous, CNavList_FontPrivateFunc, CNavList_FontPublicFunc);
        end;
      end;
       // Static text
      ttStatic: c := CNavList_FontStatic;
    end;
    TargetCanvas.Font.Color := c;
  end;

  procedure TfMain.tvResultsClick(Sender: TObject);
  begin
    LocateCurrentResults;
  end;

  procedure TfMain.tvResultsGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: Integer);
  begin
    if Column=0 then
      if FCompilingEditor<>nil then
        ImageIndex := iiWait
      else
        case ActiveEditor.StatusEntries[Node.Index].SKind of
          skUnknown: ImageIndex := iiUnknown;
          skOK:      ImageIndex := iiOK;
          skError:   ImageIndex := iiError;
        end;
  end;

  procedure TfMain.tvResultsGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: WideString);
  var p: PStatusEntry;
  begin
    if FCompilingEditor<>nil then begin
      if Column=0 then CellText := Format('Running script on server %s...', [osMain.Server]);
    end else begin
      p := ActiveEditor.StatusEntries[Node.Index];
      case Column of
        0: CellText := p.sPart;
        1: if (p.iLine>0) or (p.iCol>0) then CellText := Format('%d/%d', [p.iLine, p.iCol]) else CellText := p.sText;
        2: if (p.iLine>0) or (p.iCol>0) then CellText := p.sText;
      end;
    end;
  end;

  procedure TfMain.tvResultsInitNode(Sender: TBaseVirtualTree; ParentNode, Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
  begin
    Include(InitialStates, ivsMultiline);
  end;

  procedure TfMain.tvResultsMeasureItem(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: PVirtualNode; var NodeHeight: Integer);
  var
    i: Integer;
    r: TRect;
    p: PStatusEntry;
  begin
    NodeHeight := tvResults.DefaultNodeHeight;
    if FCompilingEditor=nil then begin
      p := ActiveEditor.StatusEntries[Node.Index];
       // Если есть Row/Col, то текст находится в третьем столбце, иначе - во втором
      if (p.iCol=0) and (p.iLine=0) then i := 1 else i := 2;
      r := Sender.GetDisplayRect(Node, i, True);
      r.Right := Sender.ClientWidth;
      DrawText(TargetCanvas.Handle, PChar(String(tvResults.Text[Node, i])), -1, r, DT_LEFT or DT_WORDBREAK or DT_NOPREFIX or DT_CALCRECT);
      if r.Bottom-r.Top>NodeHeight then NodeHeight := r.Bottom-r.Top;
    end;
  end;

  procedure TfMain.tvResultsPaintText(Sender: TBaseVirtualTree; const TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType);
  begin
      with TargetCanvas.Font do
        if FCompilingEditor<>nil then begin
          Color := CResultList_FontWorking;
          Style := [fsBold];
        end else
          case ActiveEditor.StatusEntries[Node.Index].SKind of
            skUnknown: begin
              Color := CResultList_FontUnknown;
              Style := [fsBold];
            end;
            skOK: begin
              Color := CResultList_FontOK;
              Style := [fsBold];
            end;
            skError: begin
              Color := CResultList_FontError;
              Style := [];
            end;
          end;
  end;

  procedure TfMain.UpdateCaretText;
  const asMacroState: Array[TSynMacroState] of String = ('', 'Recording', 'Playing', 'Paused');
  var
    c: TWinControl;
    s: String;
  begin
    if smrMain.State in [msRecording, msPlaying, msPaused] then
      s := asMacroState[smrMain.State]
    else begin
      c := ActiveControl;
      if c is TSynEdit then s := Format(SMsg_LineColIndicator, [TSynEdit(c).CaretY, TSynEdit(c).CaretX]) else s := '';
    end;
    sbarMain.Panels[1].Caption := s;
  end;

  procedure TfMain.UpdateNavStyles;
  begin
    tvNav.ShowHint := bShowNavHints;
  end;

  procedure TfMain.UpdateStatusbar;
  begin
    with sbarMain.Panels[0] do
      if osMain.Connected then begin
        Caption    := Format('%s@%s', [osMain.UserName, osMain.Server]);
        ImageIndex := iiConnect;
      end else begin
        Caption    := SMsg_NoConnection;
        ImageIndex := iiDisconnect;
      end;
    EnableActions;
  end;

  procedure TfMain.UpdateStatusList;
  begin
    tvResults.BeginUpdate;
    try
      tvResults.Clear;
      if FCompilingEditor<>nil then tvResults.RootNodeCount := 1
      else if ActiveEditor<>nil then tvResults.RootNodeCount := ActiveEditor.StatusEntryCount;
    finally
      tvResults.EndUpdate;
    end;
  end;

  procedure TfMain.UpdateSynEditStyles;
  var i: Integer;
  begin
    for i := 0 to pcMain.PageCount-1 do TEditorTabSheet(pcMain.Pages[i]).UpdateSynEditStyles;
  end;

  procedure TfMain.UpdateTabStyles;
  begin
    pcMain.MultiLine := bMultilineTabs;
  end;

  procedure TfMain.WindowItemClick(Sender: TObject);
  begin
    ActiveEditor := TEditorTabSheet((Sender as TComponent).Tag);
  end;

  procedure TfMain.WMActiveWindowChanged(var Msg: TMessage);
  var
    i: Integer;
    tbi: TTBCustomItem;
    sCaption, sActiveEditorCaption: String;
  begin
     // Проставляем активность окна
    for i := 0 to giWindowList.Count-1 do begin
      tbi := giWindowList[i];
       // В Tag пункта лежит ссылка на страницу-редактор
      tbi.Checked := tbi.Tag=Integer(pcMain.ActivePage);
    end;
     // Обновляем заголовок
    if ActiveEditor=nil then sActiveEditorCaption := '' else sActiveEditorCaption := ActiveEditor.Caption;
    sCaption := Format(iif(sActiveEditorCaption='', '%1:s', '[%0:s] - %1:s'), [sActiveEditorCaption, SApp_FullName]);
    Caption           := sCaption;
    Application.Title := sCaption;
  end;

  procedure TfMain.WMEditorStatusChanged(var Msg: TMessage);
  begin
    EnableActions;
    PostWindowListChanged; // По идее, здесь только нужно отрабатывать изменение заголовка редактора (Modified) 
  end;

  procedure TfMain.WMUpdateStatusList(var Msg: TMessage);
  begin
    UpdateStatusList;
  end;

  procedure TfMain.WMWindowListChanged(var Msg: TMessage);
  var
    i: Integer;
    EdTS: TEditorTabSheet;
    tbi: TTBCustomItem;
    SLFiles: TStringList;
  begin
     // Обновляем вкладки, создаём сортированный список файлов
    SLFiles := TStringList.Create;
    try
      SLFiles.Sorted     := True;
      SLFiles.Duplicates := dupAccept;
      for i := 0 to pcMain.PageCount-1 do begin
        EdTS := TEditorTabSheet(pcMain.Pages[i]);
        EdTS.UpdateTabName;
        SLFiles.AddObject(EdTS.Caption, EdTS);
      end;
       // Обновляем меню Window
      giWindowList.Clear;
      for i := 0 to SLFiles.Count-1 do begin
        EdTS := TEditorTabSheet(SLFiles.Objects[i]);
         // Добавляем пункт в меню Window
        tbi := TTBXItem.Create(Self);
        tbi.Caption    := SLFiles[i];
        tbi.Hint       := EdTS.FileName;
        tbi.ImageIndex := EdTS.ImageIndex;
        tbi.Tag        := Integer(EdTS);
        tbi.OnClick    := WindowItemClick;
        tbi.RadioItem  := True;
        giWindowList.Add(tbi);
      end;
    finally
      SLFiles.Free;
    end;
     // Обновляем активность окна
    PostActiveWindowChanged;
  end;

end.

