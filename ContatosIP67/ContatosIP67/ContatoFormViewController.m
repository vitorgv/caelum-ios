//
//  ContatoFormViewController.m
//  ContatosIP67
//
//  Created by ios2971 on 21/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ContatoFormViewController.h"
#import "Contato.h"

@interface ContatoFormViewController ()
{
    UITextField *nomeTextField;
}

@end

@implementation ContatoFormViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}



@synthesize nomeTextField, telefoneTextField, emailTextField, enderecoTextField, siteTextField;

- (IBAction)cadastrarContato:(id)sender
{
    Contato *contato = [self obtemDadosDoFormulario:sender];
    
    NSMutableDictionary *contatos = [[NSMutableDictionary alloc] init];
    [contatos setObject: [contato nome] forKey:@"nome"];
    [contatos setObject: [contato telefone] forKey:@"telefone"];
    [contatos setObject: [contato email] forKey:@"email"];
    [contatos setObject: [contato endereco] forKey:@"endereco"];
    [contatos setObject: [contato site] forKey:@"site"];
    
    NSLog(@"dados: %@", contatos);
    
//    [siteTextField resignFirstResponder]; // solucao ruim para ocultar o teclado
    [[self view] endEditing: YES]; // solucao menos ruim para ocultar o teclado, ainda nao esta bom
}

- (Contato *)obtemDadosDoFormulario:(id)sender {
    Contato *contato = [[Contato alloc] init];
    [contato setNome:[nomeTextField text]];
    [contato setTelefone:[telefoneTextField text]];
    [contato setEmail:[emailTextField text]];
    [contato setEndereco:[enderecoTextField text]];
    [contato setSite:[siteTextField text]];
    
    NSLog(@"contato: %@", contato);
    
    return contato;
}

- (IBAction)proximoElemento:(UITextField *)textField 
{
    // Campos em ordem: nome, telefone, email, endereco, site.
    
    if (textField == [self nomeTextField])
    {
        [[self telefoneTextField] becomeFirstResponder];
    }
    else if (textField == [self telefoneTextField])
    {
        [[self emailTextField] becomeFirstResponder];
    }
    else if (textField == [self emailTextField])
    {
        [[self enderecoTextField] becomeFirstResponder];
    }
    else if (textField == [self enderecoTextField])
    {
        [[self siteTextField] becomeFirstResponder];
    }
    else if (textField == [self siteTextField])
    {
        [[self siteTextField] resignFirstResponder];
    }
    
}

@end
