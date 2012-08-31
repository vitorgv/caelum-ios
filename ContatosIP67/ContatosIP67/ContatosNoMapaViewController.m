//
//  ContatosNoMapaViewController.m
//  ContatosIP67
//
//  Created by ios2971 on 28/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ContatosNoMapaViewController.h"
#import "MapKit/MKUserTrackingBarButtonItem.h"
#import "MapKit/MKUserLocation.h"
#import "MapKit/MKPinAnnotationView.h"
#import "Contato.h"

@implementation ContatosNoMapaViewController

@synthesize mapa;
@synthesize contatos;

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

- (void) viewWillAppear:(BOOL)animated {
    [[self mapa] addAnnotations:contatos];
}

- (void) viewWillDisappear:(BOOL)animated {
    [[self mapa] removeAnnotations:contatos];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    }
    
    static NSString *identifier = @"pino";
    MKPinAnnotationView *pino = (MKPinAnnotationView *)[mapa dequeueReusableAnnotationViewWithIdentifier:identifier];
    
    if (!pino) {
        pino = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
    } else {
        pino.annotation = annotation;
    }
    
    Contato *contato = (Contato *) annotation;
    pino.pinColor = MKPinAnnotationColorGreen;
    pino.canShowCallout = YES;
    if (contato.foto) {
        UIImageView *imagemContato = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
        imagemContato.image = contato.foto;
        pino.leftCalloutAccessoryView = imagemContato;
    }
    
    return pino;
}

@end
