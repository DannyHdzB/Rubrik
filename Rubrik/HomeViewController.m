//
//  HomeViewController.m
//  Rubrik
//
//  Created by Nanis on 3/4/14.
//  Copyright (c) 2014 Daniela Hernández Banda. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.opciones.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *celdaID =@"celda";
    UITableViewCell *celda = [tableView dequeueReusableCellWithIdentifier:celdaID];
    if(celda == nil){
        
        //no pueede reusar la celda}
        celda= [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:celdaID];
        
        
    }
    celda.textLabel.text = [self.opciones objectAtIndex:indexPath.row];
    
    return celda;
    
}

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
    self.opciones=@[@"Evaluar",@"Clases",@"Alumnos",@"Rúbricas"];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
