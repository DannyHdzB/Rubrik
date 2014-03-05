//
//  ClasesViewController.h
//  Rubrik
//
//  Created by Daniela Hernández Banda on 05/03/14.
//  Copyright (c) 2014 Daniela Hernández Banda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AgregarClaseViewController.h"

@interface ClasesViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) NSArray *clases;

@property (weak, nonatomic) IBOutlet UIButton *showAgregarClase;

- (IBAction)showPopover:(UIButton *)sender;

@end
