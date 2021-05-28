unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus,
  ActnList, StdActns;

type

  { TForm1 }

  TForm1 = class(TForm)
    Action1: TAction;
    ActionList1: TActionList;
    ColorSelect1: TColorSelect;
    EditCopy1: TEditCopy;
    EditDelete1: TEditDelete;
    EditPaste1: TEditPaste;
    EditSelectAll1: TEditSelectAll;
    FileOpen1: TFileOpen;
    FontEdit1: TFontEdit;
    MainMenu1: TMainMenu;
    Memo1: TMemo;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    TOpenDialog1: TOpenDialog;
    procedure Action1Execute(Sender: TObject);
    procedure ColorSelect1Accept(Sender: TObject);
    procedure FileOpen1Accept(Sender: TObject);

    procedure FontEdit1Accept(Sender: TObject);
    procedure MenuItem12Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }



procedure TForm1.FileOpen1Accept(Sender: TObject);
begin
  Memo1.Clear;
  Memo1.Lines.LoadFromFile(FileOpen1.Dialog.FileName);
  Form1.Caption:=FileOpen1.Dialog.FileName;
end;



procedure TForm1.ColorSelect1Accept(Sender: TObject);
begin
  Memo1.Font.Color := ColorSelect1.Dialog.Color;
end;

procedure TForm1.Action1Execute(Sender: TObject);
begin
  ShowMessage('Welcome to My text Editor');
end;

procedure TForm1.FontEdit1Accept(Sender: TObject);
begin
  Memo1.Font := FontEdit1.Dialog.Font;
end;

procedure TForm1.MenuItem12Click(Sender: TObject);
var
  saveDialog: TSaveDialog;
begin
  saveDialog := TSaveDialog.Create(self);
  saveDialog.Title := 'Save your text as text file';
  saveDialog.Filter := 'Text file|*.txt';
  if saveDialog.Execute then
  begin
    with TStringList.Create do
      try
        Add(Memo1.Lines.Text);
        SaveToFile(saveDialog.FileName);
      finally
        Free;
      end;
  end;
  saveDialog.Free;

end;


end.


