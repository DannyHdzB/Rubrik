//
//  ClasesViewController.m
//  Rubrik
//
//  Created by Daniela Hernández Banda on 05/03/14.
//  Copyright (c) 2014 Daniela Hernández Banda. All rights reserved.
//

#import "ClasesViewController.h"

@interface ClasesViewController ()
{
    AgregarClaseViewController *controller;
    UIPopoverController *popoverController;
}
@end

@implementation ClasesViewController

#pragma mark Table View

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.clases.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *celdaID =@"claseCelda";
    UITableViewCell *celda = [tableView dequeueReusableCellWithIdentifier:celdaID];
    if(celda == nil){
        
        //no pueede reusar la celda}
        celda= [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:celdaID];
        
        
    }
    celda.textLabel.text = [self.clases objectAtIndex:indexPath.row];
    
    return celda;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"verInformacionClase" sender:self];
}

#pragma mark Agregar Clase

@synthesize showAgregarClase;
- (IBAction)showPopover:(UIButton *)sender
{
    if ([popoverController isPopoverVisible]) {
        [popoverController dismissPopoverAnimated:YES];
    } else {
        //the rectangle here is the frame of the object that presents the popover,
        //in this case, the UIButton…
        CGRect popRect = CGRectMake(self.showAgregarClase.frame.origin.x,
                                    self.showAgregarClase.frame.origin.y,
                                    self.showAgregarClase.frame.size.width,
                                    self.showAgregarClase.frame.size.height);
        [popoverController presentPopoverFromRect:popRect
                                           inView:self.view
                         permittedArrowDirections:UIPopoverArrowDirectionAny
                                         animated:YES];
    }
}


#pragma mark Others

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.clases=@[@"Proyectos de desarrollo para dispositivos móviles",
                    @"Aplicaciones de cómputo móvil",
                    @"Matemáticas III"];
    
    controller = [[AgregarClaseViewController alloc] initWithNibName:@"AgregarClaseViewController" bundle:nil];
    popoverController = [[UIPopoverController alloc] initWithContentViewController:controller];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
