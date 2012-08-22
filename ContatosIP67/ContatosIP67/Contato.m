//
//  Contato.m
//  ContatosIP67
//
//  Created by ios2971 on 21/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Contato.h"

@implementation Contato

@synthesize nome = _nome;
@synthesize telefone = _telefone;
@synthesize email = _email;
@synthesize endereco = _endereco;
@synthesize site = _site;

- (NSString*)description
{
    NSString *retorno = [NSString stringWithFormat:@"Nome: %@ \n Email: %@",_nome, _email]; 
    return retorno;
}

@end
