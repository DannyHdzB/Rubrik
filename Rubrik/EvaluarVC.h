//
//  EvaluarVC.h
//  Rubrik
//
//  Created by Oscar Sebastián Hidalgo Rodríguez on 05/03/14.
//  Copyright (c) 2014 Daniela Hernández Banda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EvaluarVC : UIViewController <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *clasebtn;
@property (weak, nonatomic) IBOutlet UIButton *alumnobtn;
@property (weak, nonatomic) IBOutlet UIButton *tareabtn;

@property (weak, nonatomic) IBOutlet UILabel *claselbl;
@property (weak, nonatomic) IBOutlet UILabel *alumnolbl;
@property (weak, nonatomic) IBOutlet UILabel *tarealbl;
@property (weak, nonatomic) IBOutlet UIWebView *paginaWV;
@property (weak, nonatomic) IBOutlet UIStepper *ortostpr;
@property (weak, nonatomic) IBOutlet UIStepper *redacstpr;
@property (weak, nonatomic) IBOutlet UIStepper *rubsstpr;
@property (weak, nonatomic) IBOutlet UILabel *ortolbl;
@property (weak, nonatomic) IBOutlet UILabel *redlbl;
@property (weak, nonatomic) IBOutlet UILabel *rslbl;
- (IBAction)stepperValueChanged:(UIStepper *)sender;

@end
