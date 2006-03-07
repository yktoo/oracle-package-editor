{****************************************************************
  $Id: EdTS.pas,v 1.1 2006-03-07 05:35:48 dale Exp $
****************************************************************}
unit EdTS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ConsVarsTypes,
  SynEdit, StdCtrls, ExtCtrls, ComCtrls;

type
  TEditorTabSheet = class(TTabSheet)
  private
     // Номера подсвеченной строки в основном тексте и в теле пакета, -1 если нет
    FHilitedLine: Integer;
    FHilitedLineBody: Integer;
     // True в процессе принудительного позиционирования курсора в редакторах
    FLocatingPos: Boolean;
     // Разделитель между редакторами (SynEdit-ами)
    FSplitter: TSplitter;
     // Флаг загрузки редакторов из файла
    FLoading: Boolean;
     // True, если в последний раз имел фокус SynEdMain
    FMainEditorFocused: Boolean;
     // Prop storage
    FStatusList: TStatusList;
    FObjType: TCodeObjType;
    FObjectName: String;
    FFileName: TFileName;
    FFileDate: TDateTime;
    FDefaultPage: Boolean;
    FSynEdMain: TSynEdit;
    FSynEdBody: TSynEdit;
     // Создаёт и возвращает новый настроенный экземпляр TSynEdit
    function  NewSynEdit: TSynEdit;
     // Записывает объект в заданный файл
    procedure DoSave(const sFName: TFileName);
     // Заменяет первую строку в редакторах на соответствующие шаблоны
    procedure SynchronizeObjToSynEd;
     // Обновляет позицию курсора в строке состояния fMain
    procedure UpdateCaretPos;
     // Выделяет из имени текущего объекта имя владельца и собственно имя объекта в схеме
    procedure UnpackObjectName(out sOwner, sName: String);
     // Настраивает свойства SynEdit-а
    procedure UpdateSynEdit(SynEdit: TSynEdit);
     // Позиционирует заданный редактор
    procedure LocateSynEdit(SynEdit: TSynEdit; iLine, iCol: Integer; bSetFocus, bHilite: Boolean);
     // Снимает подсветку строки с редакторов
    procedure UnhiliteSynEds;
     // События редакторов
    procedure SynEdsChange(Sender: TObject);
    procedure SynEdsEnter(Sender: TObject);
    procedure SynEdsStatusChange(Sender: TObject; Changes: TSynStatusChanges);
    procedure SynEdsReplaceText(Sender: TObject; const ASearch, AReplace: String; Line, Column: Integer; var Action: TSynReplaceAction);
    procedure SynEdSpecialLineColors(Sender: TObject; Line: Integer; var Special: Boolean; var FG, BG: TColor);
     // Prop handlers
    function  GetModified: Boolean;
    function  GetStatusEntries(Index: Integer): PStatusEntry;
    function  GetStatusEntryCount: Integer;
    function  GetTabName: String;
    procedure SetFileName(const Value: TFileName);
    procedure SetModified(Value: Boolean);
    procedure SetObjectName(const Value: String);
    procedure SetObjType(Value: TCodeObjType);
  public
    constructor Create(APageControl: TPageControl; bIsDefaultPage: Boolean; AObjType: TCodeObjType; const sFileName, sObjName, sText, sBodyText: String; const dtFileDate: TDateTime); reintroduce;
    destructor Destroy; override;
    procedure UpdateTabName;
     // Сохраняет объект в текущий файл. Возвращает True, если успешно
    function  SaveObject: Boolean;
     // Сохраняет объект в выбираемый пользователем файл. Возвращает True, если успешно
    function  SaveObjectAs: Boolean;
     // Компилирует объект на сервере
    procedure Execute;
     // Загружает с сервера результаты компиляции
    procedure LoadResults(bClear: Boolean);
     // Выдаёт при необходимости запрос на сохранение объекта. Возвращает True, если сохранение сделано или не требуется
    function  CheckSave: Boolean;
     // Возвращает !!!
    function  GetObjName: String;
    procedure CreateSynEd2(bDoCreate: Boolean; const sText: String; bSQL: Boolean);
     // Стирает все записи статуса
    procedure ClearStatus;
     // Добавляет запись статуса. Возвращает индекс свежедобавленной записи в списке
    function  AddStatusEntry(SKind: TStatusKind; iLine, iCol: Integer; const sPart, sText: String): Integer;
     // Позиционирует оба редактора
    procedure LocateEditors(iMainLine, iMainCol, iBodyLine, iBodyCol: Integer; bSetFocus, bHilite: Boolean);
     // Извлекает текст текущего объекта из БД
    procedure RetrieveObject;
     // Удаляет текущий объект
    procedure DropObject;
     // Применяет текущие настройки к редакторам
    procedure UpdateSynEditStyles;
     // Проверяет, не сменилась ли дата файла, и, если сменилась выдаёт запрос на перегрузку файла
    procedure CheckDiskFileChange;
     // Должна активизировать [последний имевший фокус] редактор
    procedure EditorActivate;
     // Props
     // -- True, если это страница, созданная автоматически при входе в программу
    property DefaultPage: Boolean read FDefaultPage;
     // -- Дата файла, загруженного из файла
    property FileDate: TDateTime read FFileDate write FFileDate;
     // -- Имя файла, содержащего объект
    property FileName: TFileName read FFileName write SetFileName;
     // -- True, если код объекта изменён
    property Modified: Boolean read GetModified write SetModified;
     // -- Имя объекта БД
    property ObjectName: String read FObjectName write SetObjectName;
     // -- Тип объекта БД
    property ObjType: TCodeObjType read FObjType write SetObjType;
     // -- Записи статуса объекта
    property StatusEntries[Index: Integer]: PStatusEntry read GetStatusEntries;
     // -- Количество записей в списке статуса
    property StatusEntryCount: Integer read GetStatusEntryCount;
     // -- Редактор текста пакета (в случае, когда объект является пакетом, иначе nil)
    property SynEdBody: TSynEdit read FSynEdBody;
     // -- Редактор основного текста объекта
    property SynEdMain: TSynEdit read FSynEdMain;
     // -- Надпись на закладке редактора кода, соответствующей объекту
    property TabName: String read GetTabName;
  end;

implementation
uses Main, RxStrUtils, DB, OraError, udConfirmReplace, SynMacroRecorder, SynEditTypes;

  function TEditorTabSheet.AddStatusEntry(SKind: TStatusKind; iLine, iCol: Integer; const sPart, sText: String): Integer;
  begin
    Result := FStatusList.Add(SKind, iLine, iCol, sPart, sText);
  end;

  procedure TEditorTabSheet.CheckDiskFileChange;
  var
    ifd: Integer;
    sMain, sBody, sObjName: String;
    co: TCodeObjType;
    dt: TDateTime;
  begin
    if (FFileName<>'') and (FFileDate>0) then begin
      ifd := FileAge(FFileName);
      if (ifd<>-1) and (FileDateToDateTime(ifd)<>FFileDate) then
        if Confirm(Format(SMsgConfirm_ReloadFile, [FFileName])) and CheckSave then begin
          fMain.ParseFile(co, FFileName, sObjName, sMain, sBody, dt);
          FLoading := True;
          try
            FSynEdMain.Lines.Text := sMain;
            CreateSynEd2(co=coPackage, sBody, True);
            FFileDate := dt;
            Modified := False;
            SetObjType(co);
            SetObjectName(sObjName);
          finally
            FLoading := False;
          end;
        end else
          FFileDate := FileDateToDateTime(ifd);
    end;
  end;

  function TEditorTabSheet.CheckSave: Boolean;
  begin
    Result := not Modified;
    if not Result then begin
      Result := True;
      case MessageBox(Handle, PChar(Format(SMsgConfirm_FileNotSaved, [aCOT[ObjType].sName, GetObjName])), PChar(SDlgTitle_Confirm), MB_YESNOCANCEL or MB_ICONEXCLAMATION) of
        IDYES: SaveObject;
        IDNO: {nothing};
        else Result := False;
      end;
    end;
  end;

  procedure TEditorTabSheet.ClearStatus;
  begin
    FStatusList.Clear;
  end;

  constructor TEditorTabSheet.Create(APageControl: TPageControl; bIsDefaultPage: Boolean; AObjType: TCodeObjType; const sFileName, sObjName, sText, sBodyText: String; const dtFileDate: TDateTime);
  begin
    inherited Create(APageControl);
    PageControl      := APageControl;              
    FStatusList      := TStatusList.Create;
    FDefaultPage     := bIsDefaultPage;
    FHilitedLine     := -1;
    FHilitedLineBody := -1;
     // Создаём основной редактор
    FSynEdMain := NewSynEdit;
    FMainEditorFocused := True;
     // Загружаем данные
    FLoading := True;
    try
      SetObjType(AObjType);
      FObjectName           := sObjName;
      FFileName             := sFileName;
      FFileDate             := dtFileDate;
      FSynEdMain.Lines.Text := sText;
      CreateSynEd2(AObjType=coPackage, sBodyText, True);
      Modified := False;
    finally
      FLoading := False;
    end;
     // Заносим дефолтовую запись о неизвестности статуса
    FStatusList.Add(skUnknown, 0, 0, SMsg_StatusUnknown, '');
  end;

  procedure TEditorTabSheet.CreateSynEd2(bDoCreate: Boolean; const sText: String; bSQL: Boolean);
  begin
    if bDoCreate then begin
      if FSynEdBody=nil then begin
        FSynEdMain.Align := alTop;
        FSynEdMain.Height := Height div 2;
         // Create splitter
        FSplitter := TSplitter.Create(Self);
        with FSplitter do begin
          Align := alTop;
          Height := 5;
          Cursor := crSizeNS;
          MinSize := 1;
          ResizeStyle := rsUpdate;
          Parent := Self;
          Top := 16383;
        end;
        FSynEdBody := NewSynEdit;
      end;
      FSynEdBody.Lines.Text := sText;
    end else if FSynEdBody<>nil then begin
      FSplitter.Free;
      FSynEdBody.Free;
      FSynEdBody := nil;
      FSynEdMain.Align := alClient;
    end;
  end;

  destructor TEditorTabSheet.Destroy;
  begin
    FStatusList.Free;
    inherited Destroy;
  end;

  procedure TEditorTabSheet.DoSave(const sFName: TFileName);
  var s: String;
  begin
    s := 'CREATE OR REPLACE '+FSynEdMain.Lines.Text;
    if ObjType=coPackage then s := s+#13#10'/'#13#10'CREATE OR REPLACE '+FSynEdBody.Lines.Text;
    with TFileStream.Create(sFName, fmCreate) do
      try
        Write(s[1], Length(s));
        FFileDate := FileDateToDateTime(FileGetDate(Handle));
      finally
        Free;
      end;
    FileName := sFName;
    Modified := False;
  end;

  procedure TEditorTabSheet.DropObject;
  var sOwner, sName, sType: String;
  begin
    UnpackObjectName(sOwner, sName);
    sType := aCOT[ObjType].sName;
    ClearStatus;
    with fMain.qMain do begin
      SQL.Text := Format('DROP %s %s.%s', [sType, sOwner, sName]);
      try
        ExecSQL;
        FStatusList.Add(skOK, 0, 0, Format(SMsg_StatusDroppedOK, [sType]), '');
      except
        on e: Exception do begin
          FStatusList.Add(skOK, 0, 0, Format(SMsg_StatusCannotDrop, [sType, e.Message]), '');
          Abort;
        end;
      end;
    end;
  end;

  procedure TEditorTabSheet.EditorActivate;
  begin
    if FMainEditorFocused or (FSynEdBody=nil) then fMain.ActiveControl := SynEdMain else fMain.ActiveControl := SynEdBody;
  end;

  procedure TEditorTabSheet.Execute;
  begin
    if bAutoSave and Modified and not SaveObject then Exit;
    ClearStatus;
    fMain.CompilingEditor := Self;
  end;

  function TEditorTabSheet.GetModified: Boolean;
  begin
    Result := FSynEdMain.Modified or ((FSynEdBody<>nil) and FSynEdBody.Modified);
  end;

  function TEditorTabSheet.GetObjName: String;
  begin
    Result := ObjectName;
    if Result='' then Result := '<noname>';
  end;

  function TEditorTabSheet.GetStatusEntries(Index: Integer): PStatusEntry;
  begin
    Result := FStatusList[Index];
  end;

  function TEditorTabSheet.GetStatusEntryCount: Integer;
  begin
    Result := FStatusList.Count;
  end;

  function TEditorTabSheet.GetTabName: String;
  begin
    Result := Copy(Caption, 10, MaxInt);
  end;

  procedure TEditorTabSheet.LoadResults(bClear: Boolean);
  var sOwner, sName: String;

    procedure LoadErrors(const sType: String);
    begin
      with fMain.OpenSQL(
            'select line,position,text from sys.all_errors where owner=''%s'' and name=''%s'' and type=''%s'' order by sequence',
            [sOwner, sName, sType]) do begin
        if Eof then begin
          SQL.Text := Format(
            'select status from sys.all_objects where owner=''%s'' and object_name=''%s'' and object_type=''%s''',
            [sOwner, sName, sType]);
          Open;
          if Eof then FStatusList.Add(skError, 0, 0, sType, Format(SMsg_StatusDoesntExist, [sType, sName]))
          else if FieldByName('status').AsString='VALID' then FStatusList.Add(skOK, 0, 0, Format(SMsg_StatusOK, [sType]), '')
          else FStatusList.Add(skUnknown, 0, 0, Format(SMsg_StatusNoStatusFound, [sType, sName]), '');
        end else
          while not Eof do begin
            FStatusList.Add(
              skError,
              FieldByName('line').AsInteger,
              FieldByName('position').AsInteger,
              sType,
              StringReplace(AdjustLineBreaks(Trim(FieldByName('text').AsString)), #13#10#13#10, #13#10, [rfReplaceAll]));
            Next;
          end;
        Close;
      end;
    end;

  begin
    UnpackObjectName(sOwner, sName);
    if bClear then ClearStatus;
    LoadErrors(aCOT[ObjType].sName);
    if ObjType=coPackage then LoadErrors('PACKAGE BODY');
    fMain.Perform(WM_UPDATESTATUSLIST, 0, 0);
  end;

  procedure TEditorTabSheet.LocateEditors(iMainLine, iMainCol, iBodyLine, iBodyCol: Integer; bSetFocus, bHilite: Boolean);
  var bPosBody: Boolean;
  begin
    UnhiliteSynEds;
    bPosBody := (FSynEdBody<>nil) and (iBodyLine>0);
    if iMainLine>0 then LocateSynEdit(FSynEdMain, iMainLine, iMainCol, bSetFocus and not bPosBody, bHilite);
    if bPosBody    then LocateSynEdit(FSynEdBody, iBodyLine, iBodyCol, bSetFocus,                  bHilite);
  end;

  procedure TEditorTabSheet.LocateSynEdit(SynEdit: TSynEdit; iLine, iCol: Integer; bSetFocus, bHilite: Boolean);
  begin
    if SynEdit<>nil then begin
      FLocatingPos := True;
      try
        if bHilite then
          if SynEdit=FSynEdMain then FHilitedLine := iLine else FHilitedLineBody := iLine;
        SynEdit.CaretXY  := TBufferCoord(Point(iCol, iLine));
        SynEdit.TopLine  := iLine-iif(SynEdit.LinesInWindow<6, 0, 3);
        SynEdit.LeftChar := 1;
        SynEdit.InvalidateLine(iLine);
        if bSetFocus then SynEdit.SetFocus;
      finally
        FLocatingPos := False;
      end;
    end;
  end;

  function TEditorTabSheet.NewSynEdit: TSynEdit;
  begin
    Result := TSynEdit.Create(Self);
    with Result do begin
      Align               := alClient;
      Font.Charset        := RUSSIAN_CHARSET;
      Gutter.Font.Assign(Self.Font);
      Gutter.LeftOffset   := 2;
      Modified            := False;
      PopupMenu           := fMain.tbpmEditor;
      TabOrder            := 0;
      OnChange            := SynEdsChange;
      OnEnter             := SynEdsEnter;
      OnReplaceText       := SynEdsReplaceText;
      OnStatusChange      := SynEdsStatusChange;
      OnSpecialLineColors := SynEdSpecialLineColors;
      Highlighter         := fMain.shSQL;
      Parent              := Self;
    end;
    UpdateSynEdit(Result);
  end;

  procedure TEditorTabSheet.RetrieveObject;
  var
    sName, sOwner, sType: String;
    i: Integer;

    function RetrieveText(const sType: String; SynEd: TSynEdit): Boolean;
    var
      s: String;
      iPos: Integer;
    begin
      Result := False;
      s := '';
      with fMain.OpenSQL('select text from sys.all_source where owner=''%s'' and name=''%s'' and type=''%s'' order by line', [sOwner, sName, sType]) do begin
        if Eof then
          Error(Format('%s «%s» does not exist or is wrapped.', [sType, sName]))
        else begin
          while not Eof do begin
            s := s+FieldByName('text').AsString;
            Next;
          end;
          Result := True;
        end;
        Close;
      end;
       // Добавляем имя OWNERа к заголовку объекта
      iPos := Pos(AnsiUpperCase(sName), AnsiUpperCase(s));
      if (iPos>1) and (s[iPos-1]<>'.') then s := Trim(Copy(s, 1, iPos-1))+' '+sOwner+'.'+Copy(s, iPos, MaxInt);
       // Загружаем текст в SyntaxSynEd
      SynEd.Lines.Text := Trim(s);
    end;

  begin
    if not CheckSave then Exit;
    sName := AnsiUpperCase(GetObjName);
    sType := aCOT[ObjType].sName;
    i := Pos('.', sName);
    if i=0 then
      sOwner := AnsiUpperCase(ActiveConParams.sUserName)
    else begin
      sOwner := Copy(sName, 1, i-1);
      Delete(sName, 1, i);
    end;
    if RetrieveText(aCOT[ObjType].sName, FSynEdMain) and (ObjType=coPackage) then RetrieveText('PACKAGE BODY', FSynEdBody);
    LoadResults(True);
    FSynEdMain.SetFocus;
  end;

  function TEditorTabSheet.SaveObject: Boolean;
  begin
    if FFileName='' then
      Result := SaveObjectAs
    else begin
      DoSave(FFileName);
      Result := True;
    end;
  end;

  function TEditorTabSheet.SaveObjectAs: Boolean;
  begin
    with TSaveDialog.Create(Self) do
      try
        DefaultExt := SDefaultFileExt;
        Filter     := SDefaultFileFilter;
        Options    := [ofOverwritePrompt, ofHideReadOnly, ofPathMustExist, ofEnableSizing];
        Title      := SDlgTitle_SaveFileAs;
        Result := Execute;
        if Result then DoSave(FileName);
      finally
        Free;
      end;
  end;

  procedure TEditorTabSheet.SetFileName(const Value: TFileName);
  begin
    FFileName := Value;
    if Value<>'' then fMain.tbmruMain.Add(Value);
    fMain.Perform(WM_UPDATETABNAMES, 0, 0);
  end;

  procedure TEditorTabSheet.SetModified(Value: Boolean);
  begin
    FSynEdMain.Modified := Value;
    if FSynEdBody<>nil then FSynEdBody.Modified := Value;
    fMain.Perform(WM_UPDATETABNAMES, 0, 0);
  end;

  procedure TEditorTabSheet.SetObjectName(const Value: String);
  begin
    FObjectName := Value;
    if FLoading then Exit;
    SynchronizeObjToSynEd;
  end;

  procedure TEditorTabSheet.SetObjType(Value: TCodeObjType);
  var s: String;
  begin
    FObjType := Value;
    ImageIndex := aCOT[Value].ii;
    if FLoading then Exit;
    if Value=coPackage then s := ConvertKwd('PACKAGE BODY ')+GetObjName+ConvertKwd(' IS'#13'  NULL;'#13'END;') else s := '';
    CreateSynEd2(Value=coPackage, s, True);
    SynchronizeObjToSynEd;
  end;

  procedure TEditorTabSheet.SynchronizeObjToSynEd;
  var
    s1stLine, s0, s0up, sOldName: String;
    i, iL: Integer;
    bOldModified: Boolean;
  begin
    bOldModified := Modified;
    s1stLine := ConvertKwd(aCOT[ObjType].sName)+' '+GetObjName+ConvertKwd(' IS');
    with FSynEdMain.Lines do
       // Пустое SynEd
      if Count=0 then begin
        Append(s1stLine);
        Append(ConvertKwd('  NULL;'));
        Append(ConvertKwd('END;'))
      end else begin
        s0 := Strings[0];
        s0up := AnsiUpperCase(s0);
         // Первая строка начинается на <TYPE>
        if ObjTypeByName(ExtractWord(1, s0up, [' ', #13]))>coNone then begin
          sOldName := ExtractWordPos(2, s0up, [' ', #13, '('], i);
           // Имя не было введено
          if (sOldName='IS') or (sOldName='AS') then
            Dec(i)
          else begin
            iL := Length(sOldName);
            i := i+iL; // i указывает на первый символ после имени объекта
          end;
          Strings[0] := ConvertKwd(aCOT[ObjType].sName)+' '+GetObjName+Copy(s0, i, MaxInt);
          // Первая строка начинается на что-то другое
        end else
          Insert(0, s1stLine);
      end;
     // Если PACKAGE
    if ObjType=coPackage then begin
      s1stLine := ConvertKwd('PACKAGE BODY ')+GetObjName+ConvertKwd(' IS');
      with FSynEdBody.Lines do
         // Пустое SynEd
        if Count=0 then begin
          Append(s1stLine);
          Append(ConvertKwd('  NULL;'));
          Append(ConvertKwd('END;'))
        end else begin
          s0 := Strings[0];
          s0up := AnsiUpperCase(s0);
          i := Pos(' IS', s0up);
          if i=0 then i := Pos(' AS', s0up);
          if (Copy(s0up, 1, 12)='PACKAGE BODY') and (i>0) then
            Strings[0] := ConvertKwd('PACKAGE BODY')+' '+GetObjName+Copy(s0, i, MaxInt)
          else
            Insert(0, s1stLine);
        end;
    end;
    Modified := bOldModified;
  end;

  procedure TEditorTabSheet.SynEdsChange(Sender: TObject);
  begin
    fMain.ScanThread.SetModified(1000);
  end;

  procedure TEditorTabSheet.SynEdsEnter(Sender: TObject);
  begin
    if not bChangingPages then FMainEditorFocused := Sender=FSynEdMain;
    with fMain.smrMain do begin
      if State<>msStopped then Stop;
      Editor := TSynEdit(Sender);
    end;
    UpdateCaretPos;
  end;

  procedure TEditorTabSheet.SynEdSpecialLineColors(Sender: TObject; Line: Integer; var Special: Boolean; var FG, BG: TColor);
  begin
    if Sender=FSynEdMain then Special := Line=FHilitedLine else Special := Line=FHilitedLineBody;
    BG := clYellow;
  end;

  procedure TEditorTabSheet.SynEdsReplaceText(Sender: TObject; const ASearch, AReplace: String; Line, Column: Integer; var Action: TSynReplaceAction);
  var
    APos: TPoint;
    EditRect: TRect;
    SynEd: TSynEdit absolute Sender;
  begin
    if ASearch=AReplace then
      Action := raSkip
    else begin
      APos := Point(Column, Line);
      APos := SynEd.ClientToScreen(SynEd.RowColumnToPixels(TDisplayCoord(APos)));
      EditRect := ClientRect;
      EditRect.TopLeft := ClientToScreen(EditRect.TopLeft);
      EditRect.BottomRight := ClientToScreen(EditRect.BottomRight);
      case AskConfirmReplace(EditRect, APos.X, APos.Y, APos.Y+SynEd.LineHeight, ASearch) of
        mrYes:      Action := raReplace;
        mrYesToAll: Action := raReplaceAll;
        mrNo:       Action := raSkip;
        else        Action := raCancel;
      end;
    end;
  end;

  procedure TEditorTabSheet.SynEdsStatusChange(Sender: TObject; Changes: TSynStatusChanges);
  begin
    if scSelection in Changes then begin
      UpdateCaretPos;
      UnhiliteSynEds;
    end;
    if scModified in Changes then begin
      FDefaultPage := False;
      UpdateTabName;
      fMain.Perform(WM_UPDATECAPTION, 0, 0);
    end;
    fMain.Perform(WM_ENABLEACTIONS, 0, 0);
  end;

  procedure TEditorTabSheet.UnhiliteSynEds;

    procedure SetHiliteVar(se: TSynEdit; var iLine: Integer);
    begin
      if iLine>=0 then begin
        if se<>nil then se.InvalidateLine(iLine);
        iLine := -1;
      end;
    end;

  begin
    if FLocatingPos then Exit;
    SetHiliteVar(FSynEdMain, FHilitedLine);
    SetHiliteVar(FSynEdBody, FHilitedLineBody);
  end;

  procedure TEditorTabSheet.UnpackObjectName(out sOwner, sName: String);
  var i: Integer;
  begin
    if ObjectName='' then raise Exception.Create('Object name is not specified.');
    sName := AnsiUpperCase(ObjectName);
    i := Pos('.', sName);
    if i=0 then
      sOwner := AnsiUpperCase(ActiveConParams.sUserName)
    else begin
      sOwner := Copy(sName, 1, i-1);
      Delete(sName, 1, i);
    end;
  end;

  procedure TEditorTabSheet.UpdateCaretPos;
  begin
    fMain.UpdateCaretText;
  end;

  procedure TEditorTabSheet.UpdateSynEdit(SynEdit: TSynEdit);
  begin
    with SynEdit do begin
      Font.Name              := sEdFontName;
      Font.Size              := iEdFontSize;
      MaxUndo                := iMaxUndo;
      RightEdge              := iRightEdge;
      TabWidth               := iTabWidth;
      Gutter.Visible         := bShowGutter;
      Gutter.ShowLineNumbers := bLineNums;
      Options                := SynEditOpts;
      WantTabs               := bWantTabs;
      Keystrokes.Assign(SynEditKeyStrokes);
    end;
  end;

  procedure TEditorTabSheet.UpdateSynEditStyles;
  begin
    UpdateSynEdit(FSynEdMain);
    if FSynEdBody<>nil then UpdateSynEdit(FSynEdBody);
  end;

  procedure TEditorTabSheet.UpdateTabName;
  const asMod: Array[Boolean] of String[1] = ('', '*');
  var
    i, iFN: Integer;
    sFN: String;
  begin
    sFN := ExtractFileName(FFileName);
     // Count identical file names in fMain's tabsheet
    iFN := 0;
    for i :=  0 to PageIndex-1 do
      if AnsiCompareText(ExtractFileName(TEditorTabSheet(fMain.pcMain.Pages[i]).FileName), sFN)=0 then Inc(iFN);
     // Update tab name
    if sFN='' then sFN := '<no name>';
    Caption := Format(iif(iFN>0, '%s%s (%d)', '%s%s'), [sFN, asMod[Modified], iFN+1]);
  end;

end.
