//
//  alumnosVC.m
//  Rubrik
//
//  Created by Alejandro Flores Ibarra on 05/03/14.
//  Copyright (c) 2014 Daniela Hernández Banda. All rights reserved.
//

#import "alumnosVC.h"

@interface alumnosVC ()

@end

@implementation alumnosVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.alumnos.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *celdaID =@"tbTareas";
    UITableViewCell *celda = [tableView dequeueReusableCellWithIdentifier:celdaID];
    if(celda == nil){
        
        //no pueede reusar la celda}
        celda= [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:celdaID];
        
    }
    celda.textLabel.text = [self.alumnos objectAtIndex:indexPath.row];
    
    return celda;
    
}


- (IBAction)agregarAlumno:(id)sender {
    
    UIAlertView *alerta =[[UIAlertView alloc] initWithTitle:@"Agregar Alumno" message:@"Escribe el nombre" delegate:self cancelButtonTitle:@"Cancelar" otherButtonTitles: @"Aceptar",nil];
    alerta.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alerta show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSString *str = [alertView textFieldAtIndex:0].text;
    if(buttonIndex==1){
        [_alumnos addObject:str];
    }
    [_tableView reloadData];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.indiceActual = indexPath.row;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.alumnos= [[NSMutableArray alloc]initWithObjects:@"Maises Olmedo",@"Jose Salinas",@"Andres Duran", nil];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
