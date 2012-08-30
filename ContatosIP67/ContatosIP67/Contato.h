//
//  Contato.h
//  ContatosIP67
//
//  Created by ios2971 on 21/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contato : NSObject <NSCoding>

@property(strong) NSString *nome;
@property(strong) NSString *telefone;
@property(strong) NSString *email;
@property(strong) NSString *endereco;
@property(strong) NSString *site;
@property(strong) NSString *twitter;
@property(strong) UIImage *foto;
@property(strong) NSNumber *latitude;
@property(strong) NSNumber *longitude;

- (NSString *)description;

@end
