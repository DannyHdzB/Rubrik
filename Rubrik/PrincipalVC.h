//
//  ViewController.h
//  PruebaBaseDatos
//
//  Created by Roberto Martínez on 22/06/13.
//  Copyright (c) 2013 Roberto Martínez Román. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>     // Para las funciones de Base de datos

// CONTROLADOR DE LA PANTALLA PRINCIPAL, AQUI SE CAPTURAN LOS DATOS QUE VAN A LA BASE DE DATOS

@interface PrincipalVC : UIViewController
{   // Apuntador al objeto que representa la Base de datos
    sqlite3 *baseDeDatos;       // Esta es una variable privada
}

// Outlets para los campso de texto Nombre y la Edad en la GUI
@property (weak, nonatomic) IBOutlet UITextField *tfNombre;
@property (weak, nonatomic) IBOutlet UITextField *tfEdad;

@end
