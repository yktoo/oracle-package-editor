{****************************************************************
  $Id: udRetrieveObject.pas,v 1.2 2006-11-30 10:30:41 dale Exp $
****************************************************************}
unit udRetrieveObject;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ConsVarsTypes,
  StdCtrls, ComCtrls, ExtCtrls;

type
  TdRetrieveObject = class(TForm)
    tvMain: TTreeView;
    pBottom: TPanel;
    bOK: TButton;
    bCancel: TButton;
    pTop: TPanel;
    cbObjType: TComboBoxEx;
    lObjType: TLabel;
    procedure bOKClick(Sender: TObject);
    procedure LoadObjects(Sender: TObject = nil);
  end;

  function RetrieveObject: Boolean;

implementation
{$R *.DFM}
uses Main;

  function RetrieveObject: Boolean;
  var co: TCodeObjType;
  begin
    with TdRetrieveObject.Create(Application) do
      try
        for co := Succ(coNone) to High(co) do
          with aCOT[co] do cbObjType.ItemsEx.AddItem(sName, ii, ii, -1, 0, nil);
        cbObjType.ItemIndex := Byte(fMain.ObjectType)-1;
        LoadObjects;
        Result := ShowModal=mrOK;
      finally
        Free;
      end;
  end;

   //===================================================================================================================
   // TdRetrieveObject
   //===================================================================================================================

  procedure TdRetrieveObject.LoadObjects(Sender: TObject = nil);
  var
    sOldOwner, sOwner, sName, sActiveName: String;
    nOwner, n, nSel: TTreeNode;
    co: TCodeObjType;
  begin
    co := TCodeObjType(cbObjType.ItemIndex+1);
    if fMain.ActiveEditor=nil then sActiveName := '' else sActiveName := fMain.ActiveEditor.ObjectName;
    sOldOwner := '';
    nOwner := nil;
    nSel := nil;
    tvMain.Items.BeginUpdate;
    try
      tvMain.Items.Clear;
      with fMain.OpenSQL('select owner, object_name from all_objects where object_type=''%s'' order by 1, 2', [aCOT[co].sName]) do begin
        while not Eof do begin
          sOwner := FieldByName('owner').AsString;
          sName :=  FieldByName('object_name').AsString;
          if sOldOwner<>sOwner then begin
            sOldOwner := sOwner;
            nOwner := tvMain.Items.Add(nil, sOwner);
            nOwner.ImageIndex    := iiUser;
            nOwner.SelectedIndex := iiUser;
          end;
          n := tvMain.Items.AddChild(nOwner, sName);
          with n do begin
            ImageIndex    := aCOT[co].ii;
            SelectedIndex := ImageIndex;
          end;
          if AnsiCompareText(sOwner+'.'+sName, sActiveName)=0 then nSel := n;
          Next;
        end;
        Close;
      end;
      tvMain.Selected := nSel;
      if nSel<>nil then nSel.MakeVisible;
    finally
      tvMain.Items.EndUpdate;
    end;
  end;

  procedure TdRetrieveObject.bOKClick(Sender: TObject);
  var n: TTreeNode;
  begin
    n := tvMain.Selected;
    if (n<>nil) and (n.Parent<>nil) then begin
      fMain.NewEditor(TCodeObjType(cbObjType.ItemIndex+1), False, '', n.Parent.Text+'.'+n.Text, '', '', 0).RetrieveObject;
      ModalResult := mrOK;
    end;
  end;

end.
