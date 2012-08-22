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

//-(IBAction)backgroundTouched:(id)sender
//{
//    [nomeTextField resignFirstResponder];
//}

-(IBAction)textFieldReturn:(id)sender
{
    [sender resignFirstResponder];
}

@synthesize nomeTextField, telefoneTextField, emailTextField, enderecoTextField, siteTextField;

- (IBAction)cadastrarContato:(id)sender
{
    NSMutableDictionary *contatos = [[NSMutableDictionary alloc] init];
    [contatos setObject: [nomeTextField text] forKey:@"nome"];
    [contatos setObject: [telefoneTextField text] forKey:@"telefone"];
    [contatos setObject: [emailTextField text] forKey:@"email"];
    [contatos setObject: [enderecoTextField text] forKey:@"endereco"];
    [contatos setObject: [siteTextField text] forKey:@"site"];
    
    NSLog(@"dados: %@", contatos);
    
}


@end
