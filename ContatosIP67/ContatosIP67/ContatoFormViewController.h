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

- (IBAction)cadastrarContato:(id)sender;

- (Contato *)obtemDadosDoFormulario:(id)sender;

- (IBAction)proximoElemento:(UITextField *)textField;

@end
