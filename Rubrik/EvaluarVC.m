//
//  EvaluarVC.m
//  Rubrik
//
//  Created by Oscar Sebastián Hidalgo Rodríguez on 05/03/14.
//  Copyright (c) 2014 Daniela Hernández Banda. All rights reserved.
//

#import "EvaluarVC.h"

@interface EvaluarVC ()

@end

@implementation EvaluarVC

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
    self.paginaWV.delegate = self;
    
    NSURL *url = [NSURL URLWithString:@"https://appmovil.cem.itesm.mx/rmroman/rmr.html"];
    NSURLRequest *requestURL = [NSURLRequest requestWithURL:url];
    [self.paginaWV loadRequest:requestURL];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)stepperValueChanged:(UIStepper *)sender
{
    NSInteger stp = sender.tag;
    if (stp==0) {
        [self.ortolbl setText:[NSString stringWithFormat:@"%d", (int)sender.value]];
    }
    if (stp==1) {
        [self.redlbl setText:[NSString stringWithFormat:@"%d", (int)sender.value]];
    }
    if (stp==2) {
        [self.rslbl setText:[NSString stringWithFormat:@"%d", (int)sender.value]];
    }
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(alertView.tag == 0)
    {
        if(buttonIndex==1){
            [self.claselbl setText:@"Aplicaciones de cómputo móvil"];
        }else if(buttonIndex==2){
            [self.claselbl setText:@"Multinucleo"];
        }else if(buttonIndex==3){
            [self.claselbl setText:@"Seguridad"];
        }
    }
    if(alertView.tag == 1){
        if(buttonIndex==1){
            [self.alumnolbl setText:@"Flores"];
        }else if(buttonIndex==2){
            [self.alumnolbl setText:@"Memo"];
        }else if(buttonIndex==3){
            [self.alumnolbl setText:@"Sam"];
        }
    }
    if(alertView.tag == 2){
        if(buttonIndex==1){
            [self.tarealbl setText:@"Tarea 1"];
        }else if(buttonIndex==2){
            [self.tarealbl setText:@"Tarea 2"];
        }else if(buttonIndex==3){
            [self.tarealbl setText:@"Tarea 3"];
        }
    }

    
}

- (IBAction)seleccionarClase:(id)sender {
    UIAlertView *alerta =[[UIAlertView alloc] initWithTitle:@"Clase" message:@"Seleccione la clase" delegate:self cancelButtonTitle:@"Cancelar" otherButtonTitles:@"Aplicaciones de cómputo móvil",@"Multinucleo",@"Seguridad", nil];
    alerta.alertViewStyle = UIAlertViewStyleDefault;
    [alerta setTag:0];
    [alerta show];
}


- (IBAction)seleccionarAlumno:(id)sender {
    UIAlertView *alerta =[[UIAlertView alloc] initWithTitle:@"Clase" message:@"Seleccione la clase" delegate:self cancelButtonTitle:@"Cancelar" otherButtonTitles:@"Flores",@"Memo",@"Sam", nil];
    alerta.alertViewStyle = UIAlertViewStyleDefault;
    [alerta setTag:1];
    [alerta show];
}

- (IBAction)seleccionarTarea:(id)sender {
    UIAlertView *alerta =[[UIAlertView alloc] initWithTitle:@"Clase" message:@"Seleccione la clase" delegate:self cancelButtonTitle:@"Cancelar" otherButtonTitles:@"Tarea 1",@"Tarea 2",@"Tarea 3", nil];
    alerta.alertViewStyle = UIAlertViewStyleDefault;
    [alerta setTag:2];
    [alerta show];
}

@end
