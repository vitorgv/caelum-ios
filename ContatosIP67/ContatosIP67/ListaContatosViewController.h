//
//  ListaContatosViewController.h
//  ContatosIP67
//
//  Created by ios2971 on 22/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListaContatosViewController : UITableViewController

@property(strong) NSMutableArray *contatos;

- (void) exibeFormulario;

//- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView;
//- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
//- (void) viewWillAppear:(BOOL)animated;

@end
