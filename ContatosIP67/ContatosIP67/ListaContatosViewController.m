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

@implementation ListaContatosViewController

@synthesize contatos = _contatos;

- (id) init {
    self = [super init];
    if (self) {
        [[self navigationItem] setTitle:@"Contatos"];
        
        UIBarButtonItem *botaoExibirFormulario = [[UIBarButtonItem alloc]
                                                  initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                  target:self 
                                                  action:@selector(exibeFormulario)];
        [[self navigationItem] setRightBarButtonItem:botaoExibirFormulario];
        
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
    NSInteger indice = [self.contatos indexOfObject:contato];
    [self.contatos removeObjectAtIndex:indice];
    [self.contatos insertObject:contato atIndex:indice];
    NSLog(@"atualizado: %d", [self.contatos indexOfObject:contato]);    
}

- (void) contatoAdicionado:(id)contato {
    [self.contatos addObject:contato];
    NSLog(@"adicionado: %d", [self.contatos indexOfObject:contato]);
}

@end
