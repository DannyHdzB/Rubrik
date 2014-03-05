//
//  RubricasVC.m
//  Rubrik
//
//  Created by Alejandro Flores Ibarra on 05/03/14.
//  Copyright (c) 2014 Daniela Hernández Banda. All rights reserved.
//

#import "RubricasVC.h"

@interface RubricasVC ()

@end

@implementation RubricasVC

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
    return [self.rubricas count];

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

        static NSString *celdaID =@"tbRubricas";
        UITableViewCell *celda = [tableView dequeueReusableCellWithIdentifier:celdaID];
        if(celda == nil){
            
            //no pueede reusar la celda}
            celda= [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:celdaID];
            
        }
        celda.textLabel.text = [self.rubricas objectAtIndex:indexPath.row];
        
        return celda;


}



- (IBAction)agregarRubrica:(id)sender {
    
    UIAlertView *alerta =[[UIAlertView alloc] initWithTitle:@"Agregar Rubrica" message:@"Escribe el nombre" delegate:self cancelButtonTitle:@"Cancelar" otherButtonTitles: @"Aceptar",nil];
    alerta.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alerta show];
}


-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSString *str = [alertView textFieldAtIndex:0].text;
    if(buttonIndex==1){
        [_rubricas addObject:str];
    }
    [_tableView reloadData];
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.indiceActual = indexPath.row;

    self.lblNombreRubrica.text = [self.rubricas objectAtIndex:self.indiceActual];
}


- (void)viewDidLoad
{
    

    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.rubricas= [[NSMutableArray alloc]initWithObjects:@"Ensayos",@"Reportes",@"Investigacion", nil];

    self.conceptos= [[NSMutableArray alloc]initWithObjects:@"Rubrica 1",@"Rubrica 2",@"Rubrica 3", nil];
    
  /*  self.navigationItem.leftBarButtonItem = self.editButtonItem;
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:nil];
    self.navigationItem.rightBarButtonItem = addButton;*/
}


- (void)didReceiveMemoryWarning
{

    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
