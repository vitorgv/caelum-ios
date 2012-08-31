//
//  ContatosNoMapaViewController.h
//  ContatosIP67
//
//  Created by ios2971 on 28/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MKMapView.h>

@interface ContatosNoMapaViewController : UIViewController<MKMapViewDelegate>
@property(nonatomic ,strong) NSMutableArray *contatos;
@property(nonatomic, weak) IBOutlet MKMapView *mapa;
@end
