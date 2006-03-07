{****************************************************************
  $Id: ConsVarsTypes.pas,v 1.1 2006-03-07 05:35:48 dale Exp $
****************************************************************}
unit ConsVarsTypes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, SynEdit, SynEditTypes, SynEditKeyCmds, SynHighlighterSQL,
  Ora;

type
   // Exception
  EPackageEditorError = class(Exception);

   // Параметры подключения к БД
  TDBConnectParams = record
    bNetDirect: Boolean;
    sService:   String;
    sServer:    String;
    sPort:      String;
    sSID:       String;
    sUserName:  String;
    sPassword:  String;
  end;

   // Тип объекта редактора кода
  TCodeObjType = (coNone, coFunction, coPackage, coProcedure);

   //-------------------------------------------------------------------------------------------------------------------
   // Список записей статуса объекта
   //-------------------------------------------------------------------------------------------------------------------

   // Вид записи о статусе объекта
  TStatusKind  = (skUnknown, skOK, skError);

   // Запись статуса объекта
  PStatusEntry = ^TStatusEntry;
  TStatusEntry = record
    SKind: TStatusKind; // Вид записи
    iLine: Integer;     // Номер строки в коде, к которой относится запись
    iCol:  Integer;     // Номер столбца в коде, к которой относится запись
    sPart: String;      // Часть кода, к которой относится запись ('FUNCTION', 'PACKAGE BODY', ...)
    sText: String;      // Текст записи
  end;

  TStatusList = class(TList)
  private
     // Prop handlers
    function GetItems(Index: Integer): PStatusEntry;
  protected
    procedure Notify(Ptr: Pointer; Action: TListNotification); override;
  public
    function  Add(SKind: TStatusKind; iLine, iCol: Integer; const sPart, sText: String): Integer;
     // Props
    property Items[Index: Integer]: PStatusEntry read GetItems; default;
  end;

   //-------------------------------------------------------------------------------------------------------------------
   // Список объектов для навигации
   //-------------------------------------------------------------------------------------------------------------------

   // Тип объекта, по которому осуществляется навигация
  TNavObjType = (notNone, notProcedure, notFunction);

   // Запись данных узла tvNav
  PNavRecord = ^TNavRecord;
  TNavRecord = record
    NavObjType: TNavObjType; // Тип объекта
    sName:      String;      // Наименование объекта
    sArgs:      String;      // Аргументы объекта
    iRowMain:   Integer;     // Номер строки с процедурой/функцией в основном тексте (спецификации пакета)
    iRowBody:   Integer;     // Номер строки с процедурой/функцией в теле пакета
    iOrd:       Integer;     // Порядковый номер для overloaded-объектов (0..n)
  end;

  TNavList = class(TList)
  private
     // Сравнивает объект с индексом idx с данными sName, NavObjType
    function CompareObj(idx: Integer; const sName: String; NavObjType: TNavObjType): Integer;
     // Prop handlers
    function GetItems(Index: Integer): PNavRecord;
  protected
    procedure Notify(Ptr: Pointer; Action: TListNotification); override;
  public
    function  Add(_NavObjType: TNavObjType; const _sName, _sArgs: String; _iRowMain, _iRowBody: Integer): Integer;
     // Находит место для вставки элемента и возвращает его индекс в Index, а порядковый номер в iOrd
    procedure FindInsIndex(NavObjType: TNavObjType; const sName: String; var Index, iOrd: Integer);
     // Возвращает индекс заданного объекта, или -1, если нет такого. Если iOrd=-1, то ищет первый объект с заданными
     //   типом и именем, у которого iRowBody=0
    function  IndexOf(NavObjType: TNavObjType; const sName: String; iOrd: Integer): Integer;
     // Props
    property Items[Index: Integer]: PNavRecord read GetItems; default;
  end;

   //-------------------------------------------------------------------------------------------------------------------
   // Интерфейс объекта-пользователя списка навигации
   //-------------------------------------------------------------------------------------------------------------------

  ISourceEditorNavigation = interface(IInterface)
     // Должна заполнять sMainSource и sBodySource данными основного текста и тела пакета соответственно
    procedure GetSource(var sMainSource, sBodySource: String);
     // Должна обновлять свой навигатор данными списка NavList
    procedure SetResultList(NavList: TNavList);
  end;

   //-------------------------------------------------------------------------------------------------------------------
   // Поток сканирования исходного текста
   //-------------------------------------------------------------------------------------------------------------------

  TSourceScanThread = class(TThread)
  private
     // Интерфейс объекта, предоставляющего исходники и отображающего навигатор
    FEditorNavIntf: ISourceEditorNavigation;
     // Время, ожидаемое потоком перед сканированием, после изменения исходников
    FWaitTime: Cardinal;
     // Syntax highlighter для парсинга исходников
    FSynSQL: TSynSQLSyn;
     // Локальный список разобранных объектов
    FNavList: TNavList;
     // Событие изменения исходников
    FHScanEvent: THandle;
     // Разбираемые тексты: основной и тела пакета
    FSrcMain: String;
    FSrcBody: String;
     // True, если исходники были модифицированы
    FSourceChanged: Boolean;
     // Заполняет FSrcMain и FSrcBody текстами, получаемыми через FEditorNavIntf
    procedure GetSource;
     // Передаёт сформированный список FNavList в FEditorNavIntf
    procedure SetResults;
  protected
    procedure Execute; override;
  public
    constructor Create(EditorNavIntf: ISourceEditorNavigation);
    destructor Destroy; override;
     // Уведомляет поток, что исходники изменились
    procedure SetModified(cWaitTime: Cardinal);
     // Завершает процесс при первой возможности
    procedure Shutdown;
  end;

   //-------------------------------------------------------------------------------------------------------------------
   // Интерфейс объекта-пользователя фоновой компиляции
   //-------------------------------------------------------------------------------------------------------------------

  ICompileSource = interface(IInterface)
     // Должна возвращать Session для запроса
    function  GetSession: TOraSession;
     // Должна заполнять sMainSource и sBodySource данными основного текста и тела пакета соответственно, а
     //   sObjTypeMain и sObjTypeBody - Oracle-наименованиями типов их объектов 
    procedure GetSource(var sMainSource, sBodySource, sObjTypeMain, sObjTypeBody: String);
     // Должна добавлять запись статуса
    procedure AddResultEntry(SKind: TStatusKind; iLine, iCol: Integer; const sPart, sText: String);
     // Должна устанавливать состояние "Компиляция завершена"
    procedure Complete(bSuccess: Boolean);
  end;

   //-------------------------------------------------------------------------------------------------------------------
   // Поток компилирования SQL-текста
   //-------------------------------------------------------------------------------------------------------------------

  TCompileThread = class(TThread)
  private
     // Интерфейс объекта, запускающего компиляцию
    FCompileSrcIntf: ICompileSource;
     // Событие получения исходников и необходимости начала компиляции
    FHCompileEvent: THandle;
     // Компилируемые тексты: основной и тела пакета
    FSrcMain: String;
    FSrcBody: String;
     // Типы объектов: основной и тела пакета
    FObjTypeMain: String;
    FObjTypeBody: String;
     // Запрос, используемый для компиляции
    FQuery: TOraQuery;
     // True при успешном завершении компиляции
    FSuccess: Boolean;
     // Поля для регистрации записи статуса
    FErrObjType: String;
    FErrMessage: String;
     // Добавляет статус компиляции
    procedure AddResultEntry;
     // Уведомляет о завершении процесса
    procedure Complete;
  protected
    procedure Execute; override;
  public
    constructor Create(CompileSrcIntf: ICompileSource);
    destructor Destroy; override;
     // Заполняет FSrcMain, FSrcBody, FObjTypeMain, FObjTypeBody текстами, получаемыми через FCompileSrcIntf и запускает компиляцию
    procedure StartCompiling;
     // Завершает процесс при первой возможности
    procedure Shutdown;
  end;

const

  SApp_Name                    = 'PackageEditor';
  SApp_Version                 = '3.01RC2';
  SApp_FullName                = SApp_Name+' '+SApp_Version;

   // Пути в реестре
  SRegBaseKey                  = 'Software\DaleTech\PackageEditor';
  SRegToolbarsKey              = SRegBaseKey+'\Toolbars';
  SRegMainWindow               = 'MainWindow';
  SRegPreferences              = 'Preferences';
  SRegLogin                    = SRegPreferences+'\Login';
  SRegEditor                   = SRegPreferences+'\Editor';
  SRegHighlight                = SRegPreferences+'\Highlight';
  SRegKeyBindings              = SRegPreferences+'\KeyBindings';
  SRegOpenMRU                  = 'OpenMRU';
  SRegOpenFiles                = 'OpenFiles';

   // Image indices
  iiOK                         =  0;
  iiError                      =  1;
  iiFunction                   =  2;
  iiPackage                    =  3;
  iiProcedure                  =  4;
  iiWait                       =  5;
  iiUser                       =  6;
  iiUnknown                    =  7;
  //iiPublic                   =  8;
  iiNew                        =  9;
  iiOpen                       = 10;
  iiSave                       = 11;
  iiSaveAs                     = 12;
  iiClose                      = 13;
  iiDrop                       = 14;
  iiCut                        = 15;
  iiCopy                       = 16;
  iiPaste                      = 17;
  iiUndo                       = 18;
  iiRedo                       = 19;
  iiConnect                    = 20;
  iiDisconnect                 = 21;
  iiRetrieveObject             = 22;
  iiExit                       = 23;
  iiFind                       = 24;
  iiReplace                    = 25;
  iiSearchAgain                = 26;
  iiCompile                    = 27;
  iiSettings                   = 28;
  iiInfo                       = 29;
  iiHelp                       = 30;
  iiRefresh                    = 31;
  iiMacroRecStop               = 32;
  iiMacroPause                 = 33;
  iiMacroPlay                  = 34;

  aiiNavObjTypes: Array[TNavObjType] of Integer = (iiWait, iiProcedure, iiFunction);

  aCOT: Array[TCodeObjType] of record
    sName: String[9];
    pcTemplate: PChar;
    ii: Integer;
  end = (
    (sName: 'unknown';   pcTemplate: nil;                                                          ii: -1),
    (sName: 'FUNCTION';  pcTemplate: 'FUNCTION %(...) RETURN ... IS'#13'BEGIN'#13'  ...'#13'END;'; ii: iiFunction),
    (sName: 'PACKAGE';   pcTemplate: 'PACKAGE % IS'#13'  ...'#13'END;';                            ii: iiPackage),
    (sName: 'PROCEDURE'; pcTemplate: 'PROCEDURE %() IS'#13'BEGIN'#13'  ...'#13'END;';              ii: iiProcedure));

  WM_UPDATECAPTION             = WM_USER+10;
  WM_ENABLEACTIONS             = WM_USER+11;
  WM_UPDATETABNAMES            = WM_USER+12;
  WM_UPDATESTATUSLIST          = WM_USER+13;

   // Цвета
  CNavList_FontScanning        = clGrayText; // Цвет шрифта надписи 'Scanning source...' в списке навигации
  CNavList_FontStatic          = clSilver;   // Цвет шрифта статического текста в списке навигации (номера строк)
  CNavList_FontErroneous       = $0000a0;    // Цвет шрифта ошибочной процедуры/функции в списке навигации (без реализации)
  CNavList_BackErroneous       = $e5e5ff;    // Цвет фона ошибочной процедуры/функции в списке навигации
  CNavList_FontPrivateProc     = $a0c0a0;    // Цвет шрифта локальной процедуры в списке навигации (отсутствующей в заголовке пакета)
  CNavList_FontPrivateFunc     = $c0a0a0;    // Цвет шрифта локальной функции в списке навигации (отсутствующей в заголовке пакета)
  CNavList_FontPublicProc      = $007000;    // Цвет шрифта глобальной процедуры в списке навигации
  CNavList_FontPublicFunc      = $700000;    // Цвет шрифта глобальной функции в списке навигации

  CResultList_FontUnknown      = clGrayText; // Цвет шрифта сообщения результата о неизвестности статуса объекта
  CResultList_FontOK           = clGreen;    // Цвет шрифта сообщения результата о корректном состоянии объекта
  CResultList_FontError        = $0000a0;    // Цвет шрифта сообщения результата об ошибочном состоянии объекта
  CResultList_FontWorking      = $006090;    // Цвет шрифта сообщения о компилировании объекта
  CResultList_BackWorking      = $e0e0e0;    // Цвет фона окна результатов при компилировании объекта

resourcestring
   // Dialog texts
  SDlgTitle_Info               = 'Info';
  SDlgTitle_Error              = 'Error';
  SDlgTitle_Confirm            = 'Confirm';
  SDlgTitle_OpenFile           = 'Open object script';
  SDlgTitle_SaveFileAs         = 'Save object script as';

  SMsg_ConnectingToServer      = 'Connecting to %s...';
  SMsg_MemoryStatus            = 'Memory load: %d%%';
  SMsg_Done                    = 'Done';
  SMsg_SearchStringNotFound    = 'Search string "%s" not found';
  SMsg_ReplaceSummary          = 'Replaced %d occurences of "%s"';
  SMsg_ScanningSource          = 'Scanning source...';
  SMsg_LoadingFile             = 'Loading file: %s...';
  SMsg_StatusUnknown           = 'Status is unknown. Click here to load current object status.';
  SMsg_StatusDroppedOK         = '%s dropped OK';
  SMsg_StatusCannotDrop        = 'Cannot drop object %s: %s';
  SMsg_StatusDoesntExist       = '%s "%s" does not exist';
  SMsg_StatusOK                = '%s is compiled OK';
  SMsg_StatusNoStatusFound     = 'No status records found for %s "%s"';
  SMsg_NoConnection            = 'not connected';
  SMsg_LineColIndicator        = 'Line: %d / Col: %d ';
  SMsgConfirm_DropObject       = 'Do you wish to drop "%s"?';
  SMsgConfirm_ReloadFile       = 'Date/time of file "%s" has changed. Do you wish to reload it?';
  SMsgConfirm_FileNotSaved     = '%s "%s" was modified.'#13'Do you want to save changes?';

  SMsgError_CannotAccessRegKey = 'Error accessing registry key: %s';

  SWebUrl                      = 'http://devtools.narod.ru';
  
  SDefaultFileExt              = 'sql';
  SDefaultFileFilter           = 'SQL script files (*.sql)|*.sql|Text files (*.txt)|*.txt|All files (*.*)|*.*';

var
  DefConParams:      TDBConnectParams;   // Параметры подключения по умолчанию
  ActiveConParams:   TDBConnectParams;   // Текущие параметры подключения
  sEdFontName:       String;             // Имя шрифта редактора
  sHistTxSrch:       String;             // Текст истории поисковых строк
  sHistTxRepl:       String;             // Текст истории строк замены
  iEdFontSize:       Integer;            // Размер шрифта редактора
  iMaxUndo:          Integer;            // Количество команд в буфере отмены
  iRightEdge:        Integer;            // Положение правой границы, символов
  iTabWidth:         Integer;            // Ширина табуляции по умолчанию
  SynEditOpts:       TSynEditorOptions;  // Опции редактора
  bAutoLogin:        Boolean;            // True, если подключаться к серверу при старте приложения
  bUpperKwds:        Boolean;            // True, если ключевые слова подставляются в верхнем регистре
  bAutoSave:         Boolean;            // True, если сохранять текст объекта автоматически перед компиляцией
  bShowGutter:       Boolean;            // True, если отображать левую панель в редакторе кода 
  bLineNums:         Boolean;            // True, если отображать номера строк на панели      
  bWantTabs:         Boolean;            // True, если позволять вводить табуляции в редакторе
  bRestoreDesktop:   Boolean;            // True, если восстанавливать последние редактировавшиеся файлы при запуске
  bAutoloadStatus:   Boolean;            // True, если автоматически загружать статус для открываемых при старте файлов
  bShowNavHints:     Boolean;            // True, если отображать аргументы процедуры/функции во всплывающих подсказках Навигатора
  SynEditKeyStrokes: TSynEditKeyStrokes; // Настройки клавиш
   // Текущие настройки поиска
  sTxSearch:         String;             // Строка поиска
  sTxReplace:        String;             // Строка замены
  TxSrchOptions:     TSynSearchOptions;  // Опции поиска
  bRegexSearch:      Boolean;            // True, если активен поиск по регулярным выражениям

   // Exceptions
  procedure PackageEditorError(const sMsg: String); overload;
  procedure PackageEditorError(const sMsg: String; const aParams: Array of const); overload;

   // Разрешает или запрещает контрол, перекрашивая его в clWindow или clBtnFace соответственно
  procedure EnableWndCtl(Ctl: TWinControl; bEnable: Boolean);
   // Функции-переключатели
  function iif(b: Boolean; const sTrue, sFalse: String): String; overload;
  function iif(b: Boolean; iTrue, iFalse: Integer): Integer;     overload;
  function iif(b: Boolean; pTrue, pFalse: Pointer): Pointer;     overload;
   // Возвращают минимальное/максимальное значение из массива
  function Min(const aVals: Array of Integer): Integer;
  function Max(const aVals: Array of Integer): Integer;
   // Стандартные диалоги
  procedure Info(const sMessage: String);
  procedure Error(const sMessage: String);
  function  Confirm(const sMessage: String): Boolean;
   // Возвращает тип объекта по его имени
  function ObjTypeByName(const sType: String): TCodeObjType;
   // Конвертирует регистр ключевого слова с учётом текущего режима
  function ConvertKwd(const sKwd: String): String;
   // Кодирование/раскодирование строки
  function Encrypt(const s: String): String;
  function Decrypt(const s: String): String;

implementation
uses TypInfo, Forms, OraError;

  procedure PackageEditorError(const sMsg: String);
  begin
    raise EPackageEditorError.Create(sMsg);
  end;

  procedure PackageEditorError(const sMsg: String; const aParams: Array of const); overload;
  begin
    raise EPackageEditorError.CreateFmt(sMsg, aParams);
  end;

  procedure EnableWndCtl(Ctl: TWinControl; bEnable: Boolean);
  var pi: PPropInfo;
  begin
    Ctl.Enabled := bEnable;
    pi := GetPropInfo(Ctl, 'Color', [tkInteger]);
    if pi<>nil then SetOrdProp(Ctl, pi, iif(bEnable, clWindow, clBtnFace));
  end;

  function iif(b: Boolean; const sTrue, sFalse: String): String;
  begin
    if b then Result := sTrue else Result := sFalse;
  end;

  function iif(b: Boolean; iTrue, iFalse: Integer): Integer;
  begin
    if b then Result := iTrue else Result := iFalse;
  end;

  function iif(b: Boolean; pTrue, pFalse: Pointer): Pointer;
  begin
    if b then Result := pTrue else Result := pFalse;
  end;

  function Min(const aVals: Array of Integer): Integer;
  var i: Integer;
  begin
    Result := 2147483647;
    for i := 0 to High(aVals) do
      if aVals[i]<Result then Result := aVals[i];
  end;

  function Max(const aVals: Array of Integer): Integer;
  var i: Integer;
  begin
    Cardinal(Result) := $80000000;
    for i := 0 to High(aVals) do
      if aVals[i]>Result then Result := aVals[i];
  end;

  procedure Info(const sMessage: String);
  begin
    Application.MessageBox(PChar(sMessage), PChar(SDlgTitle_Info), MB_OK or MB_ICONINFORMATION);
  end;

  procedure Error(const sMessage: String);
  begin
    Application.MessageBox(PChar(sMessage), PChar(SDlgTitle_Error), MB_OK or MB_ICONERROR);
  end;

  function Confirm(const sMessage: String): Boolean;
  begin
    Result := Application.MessageBox(PChar(sMessage), PChar(SDlgTitle_Confirm), MB_OKCANCEL or MB_ICONQUESTION)=IDOK;
  end;

  function ObjTypeByName(const sType: String): TCodeObjType;
  begin
    for Result := Succ(coNone) to High(Result) do
      if AnsiCompareText(aCOT[Result].sName, sType)=0 then Exit;
    Result := coNone;
  end;

  function ConvertKwd(const sKwd: String): String;
  begin
    if bUpperKwds then Result := sKwd else Result := AnsiLowerCase(sKwd);
  end;

  function Encrypt(const s: String): String;
  var
    sh: Byte;
    i, l, Key: Integer;
  begin
    Key := Random(MaxInt);
    l := Length(s);
    Result := Format('%.3x%.8x%.3x%.8x%.8x', [Random($FFF), $FE8534CC-Cardinal(Key), Random($FFF), Random(MaxInt), (MaxInt-l) xor Key]);
    sh := 0;
    for i := 1 to l do begin
      Result := Result+Format('%.2x%.4x', [Byte((Key shr sh) and $FF) xor Byte(s[i]), Random($FFFF)]);
      sh := (sh+1) mod 8;
    end;
    for i := 1 to Random(20) do Result := Result+Format('%.7x', [Random($FFFFFFF)]);
  end;

  function Decrypt(const s: String): String;
  var
    sh: Byte;
    i, l, Key: Integer;
  begin
    Key := Integer($FE8534CC-Cardinal(StrToIntDef('$'+Copy(s, 4, 8), 0)));
    l := (MaxInt-StrToIntDef('$'+Copy(s, 23, 8), 0)) xor Key;
    sh := 0;
    Result := '';
    for i := 1 to l do begin
      Result := Result+Char(StrToIntDef('$'+Copy(s, 25+i*6, 2), 0) xor Byte((Key shr sh) and $FF));
      sh := (sh+1) mod 8;
    end;
  end;
  
   //===================================================================================================================
   // TStatusList
   //===================================================================================================================

  function TStatusList.Add(SKind: TStatusKind; iLine, iCol: Integer; const sPart, sText: String): Integer;
  var p: PStatusEntry;
  begin
    New(p);
    Result := inherited Add(p);
    p.SKind := SKind;
    p.iLine := iLine;
    p.iCol  := iCol;
    p.sPart := sPart;
    p.sText := sText;
  end;

  function TStatusList.GetItems(Index: Integer): PStatusEntry;
  begin
    Result := PStatusEntry(Get(Index));
  end;

  procedure TStatusList.Notify(Ptr: Pointer; Action: TListNotification);
  begin
    if Action=lnDeleted then Dispose(PStatusEntry(Ptr));
  end;

   //===================================================================================================================
   // TNavList
   //===================================================================================================================

  function TNavList.Add(_NavObjType: TNavObjType; const _sName, _sArgs: String; _iRowMain, _iRowBody: Integer): Integer;
  var
    p: PNavRecord;
    iNewOrd: Integer;
  begin
     // Ищем место вставки
    FindInsIndex(_NavObjType, _sName, Result, iNewOrd);
     // Создаём элемент
    New(p);
    Insert(Result, p);
    with p^ do begin
      NavObjType := _NavObjType;
      sName      := _sName;
      sArgs      := _sArgs;
      iRowMain   := _iRowMain;
      iRowBody   := _iRowBody;
      iOrd       := iNewOrd; 
    end;
  end;

  function TNavList.CompareObj(idx: Integer; const sName: String; NavObjType: TNavObjType): Integer;
  var pNavRec: PNavRecord;
  begin
    pNavRec := GetItems(idx);
     // Сравниваем текст
    Result := AnsiCompareText(pNavRec^.sName, sName);
     // Если текст совпадает, сравниваем тип: сначала идут процедуры, затем функции
    if Result=0 then Result := ShortInt(pNavRec^.NavObjType)-ShortInt(NavObjType);
  end;

  procedure TNavList.FindInsIndex(NavObjType: TNavObjType; const sName: String; var Index, iOrd: Integer);
  var idxLow, idxHigh, idx: Integer;
  begin
    idxLow  := 0;
    idxHigh := Count-1;
    iOrd := 0;
    while idxLow<=idxHigh do begin
       // Берём элемент в средней позиции между границами в качестве тестового
      idx := (idxLow+idxHigh) shr 1;
      case CompareObj(idx, sName, NavObjType) of
         // Тестовый элемент меньше данного: ставим левую границу после тестового элемента
        Low(Integer)..-1: idxLow := idx+1;
         // Тестовый элемент больше данного: ставим правую границу перед тестовым элементом
        1..High(Integer): idxHigh := idx-1;
         // Нашли совпадение - перебираем элементы, пока не найдём следующий порядковый номер
        else {0} begin
          repeat
            iOrd := GetItems(idx)^.iOrd+1;
            Inc(idx);
          until (idx>idxHigh) or (GetItems(idx)^.iOrd=0);
          idxLow := idx;
          Break;
        end;
      end;
    end;
    Index := idxLow;
  end;

  function TNavList.GetItems(Index: Integer): PNavRecord;
  begin
    Result := PNavRecord(Get(Index));
  end;

  function TNavList.IndexOf(NavObjType: TNavObjType; const sName: String; iOrd: Integer): Integer;
  var
    idxLow, idxHigh, idx: Integer;
    p: PNavRecord;
  begin
    Result := -1;
    idxLow  := 0;
    idxHigh := Count-1;
    while idxLow<=idxHigh do begin
      idx := (idxLow+idxHigh) shr 1;
      case CompareObj(idx, sName, NavObjType) of
        Low(Integer)..-1: idxLow := idx+1;
        1..High(Integer): idxHigh := idx-1;
        else {0} begin
           // Перебираем элементы, ища порядковый номер. Начинаем с элемента с iOrd=0
          Dec(idx, GetItems(idx)^.iOrd);
          repeat
            p := GetItems(idx);
            if ((iOrd<0) and (p.iRowBody=0)) or ((iOrd>=0) and (p.iOrd=iOrd)) then begin
              Result := idx;
              Break;
            end;
            Inc(idx);
          until (idx>idxHigh) or (GetItems(idx)^.iOrd=0);
          Break;
        end;
      end;
    end;
  end;

  procedure TNavList.Notify(Ptr: Pointer; Action: TListNotification);
  begin
    if Action=lnDeleted then Dispose(PNavRecord(Ptr));
  end;

   //===================================================================================================================
   // TSourceScanThread
   //===================================================================================================================

  constructor TSourceScanThread.Create(EditorNavIntf: ISourceEditorNavigation);
  begin
    inherited Create(True);
    FreeOnTerminate := True;
    FEditorNavIntf := EditorNavIntf;
     // Создаём Highlighter для парсинга
    FSynSQL := TSynSQLSyn.Create(nil);
    FSynSQL.SQLDialect := sqlOracle;
     // Создаём локальный список объектов навигации
    FNavList := TNavList.Create;
     // Создаём событие начала сканирования
    FHScanEvent := CreateEvent(nil, False, False, nil);
    Assert(FHScanEvent<>0, 'Failed to create Scan Event');
    Resume;
  end;

  destructor TSourceScanThread.Destroy;
  begin
    FSynSQL.Free;
    FNavList.Free;
    CloseHandle(FHScanEvent);
    inherited Destroy;
  end;

  procedure TSourceScanThread.Execute;

     // Сканирует заданный тест. Если bSecond=False - это первый проход, иначе - второй
    procedure ScanSrc(const sSrc: String; bSecond: Boolean);
    const FuncNameTypes: Set of TtkTokenKind = [
      SynHighlighterSQL.tkDatatype, SynHighlighterSQL.tkDefaultPackage, SynHighlighterSQL.tkException,
      SynHighlighterSQL.tkFunction, SynHighlighterSQL.tkIdentifier, SynHighlighterSQL.tkKey, SynHighlighterSQL.tkPLSQL,
      SynHighlighterSQL.tkSQLPlus, SynHighlighterSQL.tkTableName, SynHighlighterSQL.tkUnknown,
      SynHighlighterSQL.tkVariable];
    var
      iLine, iScanPos, idx, iSrcLength: Integer;
      s: String;
      NOType: TNavObjType;

      procedure ScanLineNums(iCurPos: Integer);
      var i: Integer;
      begin
        for i := iScanPos to iCurPos do
          if sSrc[i]=#13 then Inc(iLine);
        iScanPos := iCurPos+1;
      end;

       // Пытается определить аргументы процедуры/функции и возвращает их
      function GetArgs: String;
      var iBegPos, iEndPos: Integer;
      begin
        iBegPos := FSynSQL.GetTokenPos+Length(FSynSQL.GetToken)+1;
        Result := '';
         // Ищем первый непробельный символ
        while (iBegPos<=iSrcLength) and (Byte(sSrc[iBegPos])<=32) do Inc(iBegPos);
        if (iBegPos<iSrcLength) and (sSrc[iBegPos]='(') then begin
          iEndPos := iBegPos+1;
           // Ищем символ ')' или ';'
          while (iEndPos<=iSrcLength) and not (sSrc[iEndPos] in [';', ')']) do Inc(iEndPos);
          if (iEndPos<=iSrcLength) and (sSrc[iEndPos]=')') then Result := Copy(sSrc, iBegPos+1, iEndPos-iBegPos-1);
        end;
      end;

    begin
      iSrcLength := Length(sSrc);
      FSynSQL.SetLine(sSrc, 1);
      iLine := 1;
      iScanPos := 1;
      while not Terminated and not FSourceChanged and not FSynSQL.GetEOL do begin
         // Выбираем ключевые слова PL/SQL
        if FSynSQL.GetTokenKind=Ord(tkPLSQL) then begin
           // Проверяем тип ключевого слова
          s := Trim(AnsiUpperCase(FSynSQL.GetToken));
          if s='PROCEDURE'     then NOType := notProcedure
          else if s='FUNCTION' then NOType := notFunction
          else                      NOType := notNone;
           // Если это объект для навигационного списка
          if NOType<>notNone then begin
            ScanLineNums(FSynSQL.GetTokenPos);
             // Сканируем до конца строки или до первого идентификатора
            FSynSQL.Next; // Пропускаем 'function' / 'procedure'
            while not FSynSQL.GetEol and not (TtkTokenKind(FSynSQL.GetTokenKind) in FuncNameTypes) do FSynSQL.Next;
            if TtkTokenKind(FSynSQL.GetTokenKind) in FuncNameTypes then begin
               // Имя процедуры/функции
              s := FSynSQL.GetToken;
               // Если основной текст - добавляем объект в список
              if not bSecond then
                FNavList.Add(NOType, s, GetArgs, iLine, 0)
               // Иначе (тело пакета) - если объект найден, прописываем ему номер строки в теле, иначе добавляем
              else begin
                idx := FNavList.IndexOf(NOType, s, -1);
                if idx>=0 then FNavList[idx].iRowBody := iLine else FNavList.Add(NOType, s, GetArgs, 0, iLine);
              end;
            end;
            Sleep(0);
          end;
        end;
        FSynSQL.Next;
      end;
    end;

  begin
     // Крутим цикл, пока поток жив
    while not Terminated do begin
       // Ждём смены исходников
      WaitForSingleObject(FHScanEvent, INFINITE);
      repeat
        if Terminated then Break;
         // Сбрасываем событие и ждём заданное время
        ResetEvent(FHScanEvent);
        Sleep(FWaitTime);
        FNavList.Clear;
         // Получаем исходники
        if not Terminated then Synchronize(GetSource);
         // Сканируем основной текст
        if not Terminated then ScanSrc(FSrcMain, False);
         // Сканируем тело пакета
        if not Terminated then ScanSrc(FSrcBody, True);
      until not FSourceChanged or Terminated;
       // Передаём всё, чего насканировали
      if not Terminated then Synchronize(SetResults);
    end;
  end;

  procedure TSourceScanThread.GetSource;
  begin
    FEditorNavIntf.GetSource(FSrcMain, FSrcBody);
    FSourceChanged := False;
  end;

  procedure TSourceScanThread.SetModified(cWaitTime: Cardinal);
  begin
    FWaitTime := cWaitTime;
    FSourceChanged := True;
    if FHScanEvent<>0 then SetEvent(FHScanEvent);
  end;

  procedure TSourceScanThread.SetResults;
  begin
    FEditorNavIntf.SetResultList(FNavList);
  end;

  procedure TSourceScanThread.Shutdown;
  begin
    Terminate;
    SetEvent(FHScanEvent);
  end;

   //===================================================================================================================
   // TCompileThread 
   //===================================================================================================================

  procedure TCompileThread.AddResultEntry;
  begin
    FCompileSrcIntf.AddResultEntry(skError, 0, 0, FErrObjType, FErrMessage);
  end;

  procedure TCompileThread.Complete;
  begin
    FCompileSrcIntf.Complete(FSuccess);
  end;

  constructor TCompileThread.Create(CompileSrcIntf: ICompileSource);
  begin
    inherited Create(True);
    FreeOnTerminate := True;
    FCompileSrcIntf := CompileSrcIntf;
    FHCompileEvent := CreateEvent(nil, False, False, nil);
    Assert(FHCompileEvent<>0, 'Failed to create Compile Event');
    FQuery := TOraQuery.Create(nil);
    FQuery.Session := FCompileSrcIntf.GetSession;
    Resume;
  end;

  destructor TCompileThread.Destroy;
  begin
    FQuery.Free;
    CloseHandle(FHCompileEvent);
    inherited Destroy;
  end;

  procedure TCompileThread.Execute;

    function ExecText(const sObjType, sSQLText: String): Boolean;
    begin
      Result := False;
      FQuery.SQL.Text := sSQLText;
      try
        FQuery.ExecSQL;
        Result := True;
      except
        on e: EOraError do
          if (e.ErrorCode=0) or (e.ErrorCode=24344 {Success with compilation error}) then
            Result := True
          else begin
            Synchronize(AddResultEntry);
            FErrObjType := sObjType;
            FErrMessage := e.Message;
          end;
      end;
       // Release memory
      FQuery.SQL.Clear;
    end;

  begin
    while not Terminated do begin
      FSuccess := False;
      WaitForSingleObject(FHCompileEvent, INFINITE);
      if Terminated then Break;
      FSuccess := ExecText(FObjTypeMain, FSrcMain);
      if Terminated then Break;
      if FSuccess and (FSrcBody<>'') then FSuccess := ExecText(FObjTypeBody, FSrcBody);
      Synchronize(Complete);
    end;
  end;

  procedure TCompileThread.Shutdown;
  begin
    Terminate;
    SetEvent(FHCompileEvent);
  end;

  procedure TCompileThread.StartCompiling;
  begin
    FCompileSrcIntf.GetSource(FSrcMain, FSrcBody, FObjTypeMain, FObjTypeBody);
    SetEvent(FHCompileEvent);
  end;

end.
