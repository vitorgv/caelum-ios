//
//  ContatosNoMapaViewController.m
//  ContatosIP67
//
//  Created by ios2971 on 28/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ContatosNoMapaViewController.h"
#import "MapKit/MKUserTrackingBarButtonItem.h"

@implementation ContatosNoMapaViewController

@synthesize mapa;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

    if (self) {
        //
        UIImage *imagemTabItem = [UIImage imageNamed:@"mapa-contatos.png"];
        UITabBarItem *tabItem = [[UITabBarItem alloc] initWithTitle:@"Mapa" image:imagemTabItem tag:0];
        [self setTabBarItem:tabItem];
        [[self navigationItem] setTitle:@"Localizacao"];
    }

    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    MKUserTrackingBarButtonItem *botaoLocalizacao = [[MKUserTrackingBarButtonItem alloc] initWithMapView:self.mapa];
    [[self navigationItem] setLeftBarButtonItem:botaoLocalizacao];
    
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

@end