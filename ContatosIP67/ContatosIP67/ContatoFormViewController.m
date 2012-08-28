//
//  ContatoFormViewController.m
//  ContatosIP67
//
//  Created by ios2971 on 21/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ContatoFormViewController.h"
#import "Contato.h"

@implementation ContatoFormViewController

@synthesize nomeTextField, telefoneTextField, emailTextField, enderecoTextField, siteTextField, twitterTextField;
@synthesize contatos = _contatos;
@synthesize contato;
@synthesize delegate;
@synthesize botaoFoto;

// sobreescrita do metodo init para quando a tela for criada, tambem iniciara o array.
- (id) init {
    self = [super init];
    if (self) {
        
        [[self navigationItem] setTitle:@"Cadastro"];
        
        UIBarButtonItem *botaoCancelar = [[UIBarButtonItem alloc] initWithTitle:@"Cancelar"
                                                                        style:UIBarButtonItemStylePlain
                                                                       target:self action:@selector(ocultaFormulario)];
                                    
        UIBarButtonItem *botaoConfirmar = [[UIBarButtonItem alloc] initWithTitle:@"Confirmar"
                                                                          style:UIBarButtonItemStylePlain
                                                                         target:self action:@selector(criaContato)];
        
        [[self navigationItem] setLeftBarButtonItem:botaoCancelar];
        [[self navigationItem] setRightBarButtonItem:botaoConfirmar];
    }
    return self;
}

- (id) initWithContato:(Contato *)_contato {
    self = super.init;
    if (self)
    {
        self.contato = _contato;
        
        UIBarButtonItem *confirmar = [[UIBarButtonItem alloc] 
                                      initWithTitle:@"Confirmar" 
                                      style:UIBarButtonItemStylePlain 
                                      target:self 
                                      action:@selector(atualizaContato)];
        self.navigationItem.rightBarButtonItem = confirmar;
    }
    return self;
}


- (void) ocultaFormulario {
    [self dismissModalViewControllerAnimated:YES];
}

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    if (self.contato) {
        nomeTextField.text = contato.nome;
        telefoneTextField.text = contato.telefone;
        emailTextField.text = contato.email;
        enderecoTextField.text = contato.endereco;
        siteTextField.text = contato.site;
        twitterTextField.text = contato.twitter;
        
        if (contato.foto) {
            [botaoFoto setImage:contato.foto forState:UIControlStateNormal];
        }

    }
    
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

// metodo responsavel por receber os dados do formulario e retornar um objeto Contato totalmente preenchido.
- (Contato *) pegaDadosDoFormulario {
    if (!self.contato) {
        contato = [Contato new];
    }
    
    [contato setNome:[nomeTextField text]];
    [contato setTelefone:[telefoneTextField text]];
    [contato setEmail:[emailTextField text]];
    [contato setEndereco:[enderecoTextField text]];
    [contato setSite:[siteTextField text]];
    [contato setTwitter:[twitterTextField text]];
    
    if (botaoFoto.imageView.image) {
        contato.foto = botaoFoto.imageView.image;
    }
    
    return contato;
}

// metodo responsavel por verificar quando o proximo textfield devera ser acionado, ou receber
// a responsabilidade de controle sobre o keyboard.
- (IBAction) proximoElemento:(UITextField *)textField {
    // Campos em ordem na tela: nome, telefone, email, twitter, endereco, site.
    
    if (textField == [self nomeTextField]) {
        [[self telefoneTextField] becomeFirstResponder];
    } else if (textField == [self telefoneTextField]) {
        [[self emailTextField] becomeFirstResponder];
    } else if (textField == [self emailTextField]) {
        [[self twitterTextField] becomeFirstResponder];
    } else if (textField == [self twitterTextField]) {
        [[self enderecoTextField] becomeFirstResponder];
    } else if (textField == [self enderecoTextField]) {
        [[self siteTextField] resignFirstResponder];
    } else if (textField == [self siteTextField]) {
        [[self siteTextField] resignFirstResponder];
    }
    
}

- (void) criaContato {
    Contato *novoContato = [self pegaDadosDoFormulario];
    if (self.delegate) {
        [self.delegate contatoAdicionado:novoContato];   
    }
    [self dismissModalViewControllerAnimated:YES];
}

- (void) atualizaContato {
    Contato *contatoAtualizado = [self pegaDadosDoFormulario];
    if (self.delegate) {
        [self.delegate contatoAtualizado:contatoAtualizado];   
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction) selecionaFoto:(id)sender {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        // camera disponivel
        // UIImagePickerControllerSourceTypeCamera
    } else {
        // usar a biblioteca
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        picker.allowsEditing = YES;
        picker.delegate = self;
        [self presentModalViewController:picker animated:YES];
    }
    
}

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *imagemSelecionada = [info valueForKey:UIImagePickerControllerEditedImage];
    [botaoFoto setImage:imagemSelecionada forState:UIControlStateNormal];
    [picker dismissModalViewControllerAnimated:YES];
}

@end
