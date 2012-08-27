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

@interface ContatoFormViewController : UIViewController 

@property(nonatomic, strong) IBOutlet UITextField *nomeTextField, *telefoneTextField, *emailTextField, *enderecoTextField, *siteTextField, *twitterTextField;

@property(strong) NSMutableArray *contatos;

@property Contato *contato;

@property(weak) id<ListaContatosProtocol> delegate;

- (Contato *)pegaDadosDoFormulario;

- (IBAction)proximoElemento:(UITextField *)textField;

- (void)ocultaFormulario;

- (void)criaContato;

- (id)initWithContato:(Contato *)contato;

@end
