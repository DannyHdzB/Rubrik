//
//  HomeViewController.h
//  Rubrik
//
//  Created by Nanis on 3/4/14.
//  Copyright (c) 2014 Daniela Hernández Banda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSArray *opciones;
@property (nonatomic) NSInteger indiceActual;

@end
