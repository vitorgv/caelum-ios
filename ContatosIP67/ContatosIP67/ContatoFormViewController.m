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

@end

@implementation ContatoFormViewController

@synthesize nomeTextField, telefoneTextField, emailTextField, enderecoTextField, siteTextField;
@synthesize contatos = _contatos;

// sobreescrita do metodo init para quando a tela for criada, tambem iniciara o array.
- (id)init
{
    self = [super init];
    if (self) {
        
        [[self navigationItem] setTitle:@"Cadastro"];
        
        UIBarButtonItem *botaoCancelar = [[UIBarButtonItem alloc] initWithTitle:@"Cancelar"
                                                                        style:UIBarButtonItemStylePlain
                                                                       target:self action:@selector(ocultaFormulario)];
                                    
        UIBarButtonItem *botaoConfirmar = [[UIBarButtonItem alloc] initWithTitle:@"Confirmar"
                                                                          style:UIBarButtonItemStylePlain
                                                                         target:self action:@selector(adicionaContato)];
        
        [[self navigationItem] setLeftBarButtonItem:botaoCancelar];
        [[self navigationItem] setRightBarButtonItem:botaoConfirmar];

    }
    return self;
}

- (void) ocultaFormulario
{
    [self dismissModalViewControllerAnimated:YES];
}

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





// metodo responsavel por cadastrar um contato quando o botao de cadastro for acionado.
//- (IBAction)cadastrarContato:(id)sender
//{
//    Contato *contato = [self obtemDadosDoFormulario:sender];
//    
//    // Essa foi a primeira forma de guardar os dados, nem chega perto de ser a melhor solucao. (NSMutableDictionary)
////    NSMutableDictionary *contatos = [[NSMutableDictionary alloc] init];
////    [contatos setObject: [contato nome] forKey:@"nome"];
////    [contatos setObject: [contato telefone] forKey:@"telefone"];
////    [contatos setObject: [contato email] forKey:@"email"];
////    [contatos setObject: [contato endereco] forKey:@"endereco"];
////    [contatos setObject: [contato site] forKey:@"site"];
//    
//    
//    // Essa e a segunda forma de guardar os dados, e que ainda nao eh a melhor solucao. (NSMutableArray)
//    
//    // acesso via metodo (melhor)
//    [[self contatos] addObject:contato];
//    //[[self contatos] release];
//    
//    // acesso direto a propriedade
//    //[_contatos addObject:contato];
//    
//    // utilizando diretamento a propriedade
//    //NSMutableArray *contatos = [self contatos];
//    //[contatos addObject:contato];
//    
//    NSLog(@"dados: %@", [[self contatos] description]);
//    
//    // solucao ruim para ocultar o teclado
//    // [siteTextField resignFirstResponder];
//    
//    // solucao menos ruim para ocultar o teclado, ainda nao esta bom
//    [[self view] endEditing: YES];
//    
//    //
//    [self ocultaFormulario];
//    
//}

// sobrescrita do getter de contato. para ser possivel eh necessario que ele seja nanatomic, pois
// ele exibira um warning para deixar claro que ele nao se responsabilizara pela propriedade.
//- (NSMutableArray *)contatos {
//    //NSLog(@"Acessou a propriedade contato");
//    @synchronized(self){ // para garantir que a propriedade continue a ser atomica.
//        return _contatos;
//    }
//}

// metodo responsavel por receber os dados do formulario e retornar um objeto Contato
// totalmente preenchido.
- (Contato *)obtemDadosDoFormulario {
    Contato *contato = [[Contato alloc] init];
    [contato setNome:[nomeTextField text]];
    [contato setTelefone:[telefoneTextField text]];
    [contato setEmail:[emailTextField text]];
    [contato setEndereco:[enderecoTextField text]];
    [contato setSite:[siteTextField text]];
    
    NSLog(@"contato: %@", contato);
    
    return contato;
}

// metodo responsavel por verificar quando o proximo textfield devera ser acionado, ou receber
// a responsabilidade de controle sobre o keyboard.
- (IBAction)proximoElemento:(UITextField *)textField 
{
    // Campos em ordem na tela: nome, telefone, email, endereco, site.
    
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

- (void) adicionaContato
{
    Contato *contato = [self obtemDadosDoFormulario];
    [[self contatos] addObject:contato];
    NSLog(@"Contatos cadastrados: %d", [[self contatos] count]);
    
    [self dismissModalViewControllerAnimated:YES];
}

@end
