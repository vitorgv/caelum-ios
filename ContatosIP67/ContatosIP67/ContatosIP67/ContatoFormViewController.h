//
//  ContatoFormViewController.h
//  ContatosIP67
//
//  Created by ios2971 on 21/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContatoFormViewController : UIViewController 

@property(nonatomic, strong) IBOutlet UITextField *nomeTextField, *telefoneTextField, *emailTextField, *enderecoTextField, *siteTextField;

- (IBAction)textFieldReturn:(id)sender;
//- (IBAction)backgroundTouched:(id)sender;

- (IBAction)cadastrarContato:(id)sender;

@end
