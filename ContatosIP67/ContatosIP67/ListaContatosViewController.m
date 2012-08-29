//
//  ListaContatosViewController.m
//  ContatosIP67
//
//  Created by ios2971 on 22/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ListaContatosViewController.h"
#import "ContatoFormViewController.h"
#import "Contato.h"
#import "ListaContatosProtocol.h"
#import "SiteDoContatoViewController.h"

@implementation ListaContatosViewController

@synthesize contatos = _contatos;
//@synthesize contatoSelecionado;

- (id) init {
    self = [super init];
    
    if (self) {
        //
        UIImage *imagemTabItem = [UIImage imageNamed:@"lista-contatos.png"];
        UITabBarItem *tabItem = [[UITabBarItem alloc] initWithTitle:@"Contatos" image:imagemTabItem tag:0];
        //        UITabBarItem *tabItem = [[UITabBarItem alloc] 
        //                                 initWithTabBarSystemItem:UITabBarSystemItemDownloads tag:0];
        [self setTabBarItem:tabItem];
        
        //
        [[self navigationItem] setTitle:@"Contatos"];
        
        //
        UIBarButtonItem *botaoExibirFormulario = [[UIBarButtonItem alloc]
                                                  initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                  target:self 
                                                  action:@selector(exibeFormulario)];
        [[self navigationItem] setRightBarButtonItem:botaoExibirFormulario];
        
        //
        self.navigationItem.leftBarButtonItem = self.editButtonItem;
    }
    return self;
}

- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.contatos removeObjectAtIndex:indexPath.row];
        NSArray *indexPaths = [NSArray arrayWithObject:indexPath];
        [tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
    }
    
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;   
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self contatos] count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"CellStyleSubtitle";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:cellIdentifier];
    }
    
    Contato *contato = [self.contatos objectAtIndex:indexPath.row];
    cell.textLabel.text = contato.nome;
    cell.detailTextLabel.text = contato.email;
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Contato *contato = [self.contatos objectAtIndex:indexPath.row];
    ContatoFormViewController *form = [[ContatoFormViewController alloc] initWithContato:contato];
    form.contatos = self.contatos;
    form.delegate = self;
    [self.navigationController pushViewController:form animated:YES];
}

-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    Contato *contato = [self.contatos objectAtIndex:sourceIndexPath.row];
    [self.contatos removeObjectAtIndex:sourceIndexPath.row];
    [self.contatos insertObject:contato atIndex:destinationIndexPath.row];
}

- (void) viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}

- (void) exibeFormulario {
    ContatoFormViewController *form = [[ContatoFormViewController alloc] init];
    form.delegate = self;
    [form setContatos:[self contatos]];
    
    UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:form];
    [self presentModalViewController:navigation animated:YES];
}

- (void) contatoAtualizado:(id)contato {
    NSLog(@"atualizado: %d", [self.contatos indexOfObject:contato]);    
}

- (void) contatoAdicionado:(id)contato {
    [self.contatos addObject:contato];
    NSLog(@"adicionado: %d", [self.contatos indexOfObject:contato]);
}

- (void) viewDidLoad {
    [super viewDidLoad];
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(exibeMaisAcoes:)];
    
    [self.tableView addGestureRecognizer:longPress];
    
}

- (void) exibeMaisAcoes:(UIGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateBegan) {
        CGPoint ponto = [gesture locationInView:self.tableView];
        NSIndexPath *index = [self.tableView indexPathForRowAtPoint:ponto];
        
        //
        contatoSelecionado = [_contatos objectAtIndex:index.row];
        
        UIActionSheet *opcoes = [[UIActionSheet alloc] initWithTitle:contatoSelecionado.nome delegate:self cancelButtonTitle:@"Cancelar" destructiveButtonTitle:nil otherButtonTitles:@"Ligar", @"Enviar Email", @"Visualizar Site", @"Abrir Mapa", @"Twitt it", nil];
        
        [opcoes showInView:self.view];
    }
}

- (void) actionSheet:(UIActionSheet *) actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    switch (buttonIndex) {
        case 0:
            [self ligar];
            break;
            
        case 1:
            [self enviarEmail];
            break;
            
        case 2:
            [self abrirSite];
            break;
            
        case 3:
            [self mostrarMapa];
            break;
            
        case 4:
            [self enviarTwitter];
            
        default:
            break;
    }
    
    contatoSelecionado = nil;
}

- (void) ligar {
    UIDevice *device = [UIDevice currentDevice];
    if([device.model isEqualToString:@"iPhone"]) {
        NSString *numero = [NSString stringWithFormat:@"tel:%@", contatoSelecionado.telefone];
        [self abrirAplicativoComURL:numero];
    } else {
        [[[UIAlertView alloc] initWithTitle:@"Impossivel fazer ligacao" message:@"Seu dispositivo nao eh um iPhone" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    }
}

- (void) abrirAplicativoComURL:(NSString *) url {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}

- (void) abrirSite {
    //    NSString *url = contatoSelecionado.site;
    //    [self abrirAplicativoComURL:url];
    
    SiteDoContatoViewController *siteView = [SiteDoContatoViewController new];
    [siteView setContato:contatoSelecionado];
    [self.navigationController pushViewController:siteView animated:YES];
}

- (void) mostrarMapa {
    NSString *url = [[NSString stringWithFormat:@"http://maps.google.com/maps?q=%@", contatoSelecionado.endereco] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [self abrirAplicativoComURL:url];
}

- (void) enviarEmail {
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *enviadorEmail = [[MFMailComposeViewController alloc] init];
        enviadorEmail.mailComposeDelegate = self;
        
        [enviadorEmail setToRecipients:[NSArray arrayWithObject:contatoSelecionado.email]];
        [enviadorEmail setSubject:@"Caelum"];
        [self presentModalViewController:enviadorEmail animated:YES];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ops" message:@"Voce nao pode enviar emails. Sem conexao." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
}

- (void) mailComposeController:(MFMailComposeViewController *) controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    [self dismissModalViewControllerAnimated:YES];    
}

- (void) enviarTwitter {
    TWTweetComposeViewController *twitter = [TWTweetComposeViewController new];
    [twitter setInitialText:contatoSelecionado.twitter];
    [self presentModalViewController:twitter animated:YES];
}

@end
