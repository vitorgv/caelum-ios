//
//  ContatoFormViewController.h
//  ContatosIP67
//
//  Created by ios2971 on 21/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contato.h"

@interface ContatoFormViewController : UIViewController 

@property(nonatomic, strong) IBOutlet UITextField *nomeTextField, *telefoneTextField, *emailTextField, *enderecoTextField, *siteTextField;

@property(strong, nonatomic) NSMutableArray *contatos;

//- (IBAction)cadastrarContato:(id)sender;

- (Contato *)obtemDadosDoFormulario;

- (IBAction)proximoElemento:(UITextField *)textField;

- (void) ocultaFormulario;

- (void) adicionaContato;

@end
