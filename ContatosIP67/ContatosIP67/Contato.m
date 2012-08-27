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
@synthesize twitter = _twitter;

- (NSString*) description {
    NSString *retorno = [NSString stringWithFormat:@"Nome: %@ \n Email: %@",_nome, _email]; 
    return retorno;
}

- (void) encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.nome forKey:@"nome"];
    [aCoder encodeObject:self.telefone forKey:@"telefone"];
    [aCoder encodeObject:self.email forKey:@"email"];
    [aCoder encodeObject:self.endereco forKey:@"endereco"];
    [aCoder encodeObject:self.site forKey:@"site"];
    [aCoder encodeObject:self.twitter forKey:@"twitter"];
}

- (id) initWithCoder:(NSCoder *)aDecoder {
    self = [super init];

    if (self) {
        [self setNome:[aDecoder decodeObjectForKey:@"nome"]];
        [self setTelefone:[aDecoder decodeObjectForKey:@"telefone"]];
        [self setEmail:[aDecoder decodeObjectForKey:@"email"]];
        [self setEndereco:[aDecoder decodeObjectForKey:@"endereco"]];
        [self setSite:[aDecoder decodeObjectForKey:@"site"]];
        [self setTwitter:[aDecoder decodeObjectForKey:@"twitter"]];
    }
    
    return self;
}

@end
