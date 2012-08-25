//
//  ListaContatosViewController.h
//  ContatosIP67
//
//  Created by ios2971 on 22/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListaContatosProtocol.h"

@interface ListaContatosViewController : UITableViewController <ListaContatosProtocol>

@property(strong) NSMutableArray *contatos;

- (void) exibeFormulario;

@end
