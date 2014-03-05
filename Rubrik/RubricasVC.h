//
//  RubricasVC.h
//  Rubrik
//
//  Created by Alejandro Flores Ibarra on 05/03/14.
//  Copyright (c) 2014 Daniela Hernández Banda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RubricasVC : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSMutableArray *rubricas;
@property (nonatomic,strong) NSMutableArray *conceptos;

@property (nonatomic) NSInteger indiceActual;

@property (weak, nonatomic) IBOutlet UITextField *tfConceptoRubrica;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UITableView *tableConceptos;

@property (weak, nonatomic) IBOutlet UILabel *lblNombreRubrica;

@end
