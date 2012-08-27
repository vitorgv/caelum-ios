//
//  ListaContatosViewController.h
//  ContatosIP67
//
//  Created by ios2971 on 22/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListaContatosProtocol.h"
#import <MessageUI/MFMailComposeViewController.h>

@interface ListaContatosViewController : UITableViewController <ListaContatosProtocol, UIActionSheetDelegate,MFMailComposeViewControllerDelegate> {
    Contato *contatoSelecionado;  
}

@property(strong) NSMutableArray *contatos;
//@property(strong) Contato *contatoSelecionado;

- (void) exibeFormulario;

- (void) exibeMaisAcoes:(UIGestureRecognizer *) gesture;

@end
