//
//  ListaContatosViewController.m
//  ContatosIP67
//
//  Created by ios2971 on 22/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ListaContatosViewController.h"
#import "ContatoFormViewController.h"

@implementation ListaContatosViewController

@synthesize contatos = _contatos;

- (id)init
{
    self = [super init];
    if (self) {
        [[self navigationItem] setTitle:@"Contatos"];
        
        UIBarButtonItem *botaoExibirFormulario = [[UIBarButtonItem alloc]
                                                   initWithBarButtonSystemItem:UIBarButtonSystemItemAdd 
                                                  target:self 
                                                  action:@selector(exibeFormulario)];
                          
        [[self navigationItem] setRightBarButtonItem:botaoExibirFormulario];
        
        //
        NSLog(@"self.contatos: %d", [[self contatos] count]);
        NSLog(@"_contatos: %d", [_contatos count]);
        
        //_contatos = [self contatos];
        _contatos = [[NSMutableArray alloc] initWithObjects:_contatos, nil];
        
        NSLog(@"self.contatos: %d", [[self contatos] count]);
        NSLog(@"_contatos: %d", [_contatos count]);
    }
    return self;
}

- (void) exibeFormulario
{
    NSLog(@"Contatos: %d", [[self contatos] count]);
    
    //UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert" 
    //                                                message:@"Message here" 
    //                                               delegate:self 
    //                                      cancelButtonTitle:@"OK" 
    //                                      otherButtonTitles:nil];
    //[alert show];
    
    ContatoFormViewController *formulario = [[ContatoFormViewController alloc] init];
    
    UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:formulario];
    
    [self presentModalViewController:navigation animated:YES];
    
}

@end
