//
//  ViewController.m
//  OlaMundo
//
//  Created by ios2971 on 20/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

//@interface ViewController ()

//@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}



@synthesize meuLabel, meuTextField;

- (IBAction)atualizaLabel:(id)sender {
    [meuLabel setText:[meuTextField text]];
}



@synthesize valor1Label, valor2Label, resultadoLabel;

- (IBAction)somaBrasil:(id)sender {
    int val1 = [[valor1Label text] intValue];
    int val2 = [[valor2Label text] intValue];
    
    int soma = val1 + val2;
    [resultadoLabel setText: [NSString stringWithFormat: @"%i", soma]];
    
    NSLog(@"Soma de %i e %i eh igual a %i", val1, val2, soma);

}

@end
