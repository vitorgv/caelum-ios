//
//  ContatoFormViewController.h
//  ContatosIP67
//
//  Created by ios2971 on 21/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contato.h"
#import "ListaContatosProtocol.h"

@interface ContatoFormViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIActionSheetDelegate, UITextFieldDelegate>

@property(nonatomic, strong) IBOutlet UITextField *nomeTextField, *telefoneTextField, *emailTextField, *enderecoTextField, *siteTextField, *twitterTextField, *latitudeTextField, *longitudeTextField;
@property(strong) NSMutableArray *contatos;
@property Contato *contato;
@property(weak) id<ListaContatosProtocol> delegate;
@property(strong) IBOutlet UIButton *botaoFoto;
@property(strong) UITextField *campoAtual;
@property(weak, nonatomic) IBOutlet UIScrollView *scroll;
@property(strong) IBOutlet UIButton *botaoLocalizacao;
@property(strong) NSManagedObjectContext *contexto;

- (Contato *) pegaDadosDoFormulario;
- (IBAction) proximoElemento:(UITextField *)textField;
- (void) ocultaFormulario;
- (void) criaContato;
- (id) initWithContato:(Contato *)contato;
- (IBAction) selecionaFoto:(id)sender;
- (IBAction) buscarCoordenadas:(id)sender;

@end
