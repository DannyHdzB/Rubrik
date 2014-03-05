//
//  tareasVC.m
//  Rubrik
//
//  Created by Alejandro Flores Ibarra on 05/03/14.
//  Copyright (c) 2014 Daniela Hernández Banda. All rights reserved.
//

#import "tareasVC.h"

@interface tareasVC ()

@end

@implementation tareasVC

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
    return self.tareas.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *celdaID =@"tbTareas";
    UITableViewCell *celda = [tableView dequeueReusableCellWithIdentifier:celdaID];
    if(celda == nil){
        
        //no pueede reusar la celda}
        celda= [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:celdaID];
        
    }
    celda.textLabel.text = [self.tareas objectAtIndex:indexPath.row];
    
    return celda;
    
}

- (IBAction)agregarTarea:(id)sender {
    
    UIAlertView *alerta =[[UIAlertView alloc] initWithTitle:@"Agregar Tarea" message:@"Escribe el nombre" delegate:self cancelButtonTitle:@"Cancelar" otherButtonTitles: @"Aceptar",nil];
    alerta.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alerta show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSString *str = [alertView textFieldAtIndex:0].text;
    if(buttonIndex==1){
        [_tareas addObject:str];
    }
    [_tableView reloadData];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.indiceActual = indexPath.row;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tareas= [[NSMutableArray alloc]initWithObjects:@"Tarea1",@"Tarea2",@"Tarea3", nil];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
