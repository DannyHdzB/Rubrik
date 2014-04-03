//
//  ViewController.m
//

#import "PrincipalVC.h"


@implementation PrincipalVC


- (IBAction)grabarDato:(id)sender
{
    //NSString *nombre = @"name";
    //int edad = 4;
    
    // Grabar esta información en la BD
    [self abrirBD];
    //[self insertarTarea:edad :nombre];
    [self cerrarBD];
    
    // Esconde el teclado
    [self.tfEdad resignFirstResponder];
    [self.tfNombre resignFirstResponder];
}

// Abre la BD y prepara la tabla
-(void) abrirBD
{
    // Abre la BD, pasamos a la función el nombre con el path completo como cadena de C
    int resultado = sqlite3_open([[self obtenerArchivo] UTF8String], &baseDeDatos);
    
    if (resultado != SQLITE_OK) {
        sqlite3_close(baseDeDatos);
        NSAssert(0, @"No se puede abrir la BD");
    }
    
    // CREAR la Tabla 'Datos' que vamos a utilizar -Sólo se crea si no existe-
    
    NSString *tareaSQL = @"CREATE TABLE tarea (idTarea INTEGER PRIMARY KEY,numeroTarea INTEGER, blog Text, matriculaAlumno integer,calificacion INTEGER,FOREIGN KEY(matriculaAlumno) REFERENCES alumno (Matricula))";

    /*NSString *tareasSQl = @"CREATE TABLE IF NOT EXISTS TAREAS (Tareas INTEGER Primary key, tarea INTEGER ,FOREIGN KEY(tarea) REFERENCES tarea(numeroTarea));";*/
    
    NSString *alumnoSQL = @"CREATE TABLE ALUMNO (matricula INTEGER Primary key,Nombre TEXT, correo TEXT);";
    
    NSString *materiaSQL =@"CREATE TABLE IF NOT EXISTS Materia (ID INTEGER Primary key,Nombre TEXT)";
    
    
    NSString *materiaAlumnoSQL =@"CREATE TABLE IF NOT EXISTS MateriaAlumno (ID INTEGER Primary key, matricula integer, materia INTEGER, FOREIGN KEY(matricula) REFERENCES alumno (Matricula), FOREIGN KEY(materia) REFERENCES Materia (ID));";

    
    
    char *error;
    // Ejecuta el Query y almacena el resultado
    resultado = sqlite3_exec (baseDeDatos, [tareaSQL UTF8String], NULL, NULL, &error) ;
    if (resultado != SQLITE_OK) {
        sqlite3_close(baseDeDatos);
        NSAssert(0, @"Error al crear la tabla: %s", error);
    }
    

    
    resultado = sqlite3_exec (baseDeDatos, [alumnoSQL UTF8String], NULL, NULL, &error) ;
    
    if (resultado != SQLITE_OK) {
        sqlite3_close(baseDeDatos);
        NSAssert(0, @"Error al crear la tabla: %s", error);
    }
    
    
    resultado = sqlite3_exec (baseDeDatos, [materiaSQL UTF8String], NULL, NULL, &error) ;
    
    if (resultado != SQLITE_OK) {
        sqlite3_close(baseDeDatos);
        NSAssert(0, @"Error al crear la tabla: %s", error);
    }
    
    
    
    resultado = sqlite3_exec (baseDeDatos, [materiaAlumnoSQL UTF8String], NULL, NULL, &error) ;
    
    if (resultado != SQLITE_OK) {
        sqlite3_close(baseDeDatos);
        NSAssert(0, @"Error al crear la tabla: %s", error);
    }
    
    
    
}

// Agrega un registro a la BD


/*
    PARAMETROS matricula: matricula del alumno sin el A0
               nombre: nombre del alumno
               correo: dirreción de correo alumno
    
 DESCRIPCIÓN
    inserta alumno
 */

-(void) insertarAlumno:(NSInteger*)matricula :(NSString*)nombre :(NSString*)correo{
    
    NSString  *insertarSQL = [NSString stringWithFormat:@"INSERT INTO alumno (matricula,nombre, correo) VALUES(\"%d\", \"%@\", \"%@\")", matricula, nombre,correo];
    
    
    char *error;
    int resultado = sqlite3_exec(baseDeDatos, [insertarSQL UTF8String], NULL, NULL, &error);
    
    if ( resultado == SQLITE_OK) {
        NSLog(@"Registro insertado...");
    }
    else {
        NSLog(@"Error al insertar registro: %s", error);
    }
    
    
}


/*
 PARAMETROS numero: numero  de tarea
            blog: dirrecion del blog
            matricula: matricula del alumno (FK)
 
 DESCRIPCIÓN
 inserta tarea
 */

-(void) insertarTarea:(NSInteger*)numero :(NSString*)blog :(NSInteger*)matriculaAlumno
{
    NSString  *insertarSQL = [NSString stringWithFormat:@"INSERT into tarea(idTarea,numeroTarea,blog,matriculaAlumno,calificaion) VALUES (null,%d,\"%@\",%d,100)", numero,blog,matriculaAlumno,100];
    
    char *error;
    int resultado = sqlite3_exec(baseDeDatos, [insertarSQL UTF8String], NULL, NULL, &error);
    
    if ( resultado == SQLITE_OK) {
        NSLog(@"Registro insertado...");
    }
    else {
        NSLog(@"Error al insertar registro: %s", error);
    }
}


/*
 PARAMETROS nombre: nombre materia

 
 DESCRIPCIÓN
 inserta materia
 */


-(void) insertarMateria:(NSString*)nombre {
    NSString  *insertarSQL = [NSString stringWithFormat:@"INSERT into materia(ID,nombre) VALUES (null,\"%@\")", nombre];
    
    char *error;
    int resultado = sqlite3_exec(baseDeDatos, [insertarSQL UTF8String], NULL, NULL, &error);
    
    if ( resultado == SQLITE_OK) {
        NSLog(@"Registro insertado...");
    }
    else {
        NSLog(@"Error al insertar registro: %s", error);
    }
}


/*
 PARAMETROS matricula: matricula del alumno (fk)
            blog: nombre De la materia
 
 
 DESCRIPCIÓN
 inserta relación entre materia y alunmo
 */

-(void) insertarMateriayAlumno :(NSInteger) matricula :(NSString*)nombre{
    NSString  *insertarSQL = [NSString stringWithFormat:@"INSERT into MateriaAlumno(ID,matricula,materia) VALUES (null,%d,\"%@\")",matricula, nombre ];
    
    char *error;
    int resultado = sqlite3_exec(baseDeDatos, [insertarSQL UTF8String], NULL, NULL, &error);
    
    if ( resultado == SQLITE_OK) {
        NSLog(@"Registro insertado...");
    }
    else {
        NSLog(@"Error al insertar registro: %s", error);
    }
}


/*
 PARAMETROS calificacion: calificación que obtuvo
            matricula: matricula del alumno (FK)
            numeroTarea: numero de la tarea calificada (FK)
 
 DESCRIPCIÓN
 cambia calificación
 */

-(void) calificar :(NSInteger)calificacion :(NSInteger) matricula :(NSInteger*)numeroTarea{
    NSString  *cambiarCalificacion = [NSString stringWithFormat:@"UPDATE tarea SET calificacion = %d WHERE matriculaAlumno = %d AND numeroTarea = %d;",calificacion,matricula, numeroTarea ];
    
    
    
    char *error;
    int resultado = sqlite3_exec(baseDeDatos, [cambiarCalificacion UTF8String], NULL, NULL, &error);
    
    if ( resultado == SQLITE_OK) {
        NSLog(@"Calificacion cambiada...");
    }
    else {
        NSLog(@"Error al insertar registro: %s", error);
    }
}



// Cierra la BD
-(void) cerrarBD
{
    sqlite3_close(baseDeDatos);
}

// Regresa el nombre del archivo de la BD con el path completo
- (NSString *)obtenerArchivo
{
    // Obtiene un arreglo con los directorios de documentos de la app
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    // En iOS es uno sólo
    NSString *pathDocumentos = [paths objectAtIndex:0];
    // Le agrega el nombre del archivo incluyendo /
    return [pathDocumentos stringByAppendingPathComponent:@"datos.sqlite"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
