//
//  tareasVC.h
//  Rubrik
//
//  Created by Alejandro Flores Ibarra on 05/03/14.
//  Copyright (c) 2014 Daniela Hernández Banda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tareasVC : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSMutableArray *tareas;
@property (nonatomic) NSInteger indiceActual;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
