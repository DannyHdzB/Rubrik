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
    [self insertarAlumno:1167511 :@"Luis Carlos" :@"kuak_17@hotmail.com"];
    [self insertarTarea:1 :@"blogspot" :1167511];
    [self insertarMateria:@"introduccion a las artes obscuras"];
    [self insertarMateriayAlumno:1167511 :1];
    NSMutableArray *prueba = [self getAlumnos:@"introduccion a las artes obscuras"];
    
    NSLog(@"%@",prueba);
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
//_______________________________________________

/*
 PARAMETROS matricula: matricula del alumno sin el A0
 nombre: nombre del alumno
 correo: dirreción de correo alumno
 
 DESCRIPCIÓN
 inserta alumno
 */

-(void) insertarAlumno:(NSInteger)matricula :(NSString*)nombre :(NSString*)correo{
    
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

//_______________________________________________
/*
 PARAMETROS numero: numero  de tarea
 blog: dirrecion del blog
 matricula: matricula del alumno (FK)
 
 DESCRIPCIÓN
 inserta tarea
 */

-(void) insertarTarea:(NSInteger)numero :(NSString*)blog :(NSInteger)matriculaAlumno
{
    NSString  *insertarSQL = [NSString stringWithFormat:@"INSERT into tarea(idTarea,numeroTarea,blog,matriculaAlumno,calificacion) VALUES (null,%d,\"%@\",%d,100)", numero,blog,matriculaAlumno,100];
    
    char *error;
    int resultado = sqlite3_exec(baseDeDatos, [insertarSQL UTF8String], NULL, NULL, &error);
    
    if ( resultado == SQLITE_OK) {
        NSLog(@"Registro insertado...");
    }
    else {
        NSLog(@"Error al insertar registro: %s", error);
    }
}

//_______________________________________________
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

//_______________________________________________
/*
 PARAMETROS matricula: matricula del alumno (fk)
 id: id de la materia
 
 
 DESCRIPCIÓN
 inserta relación entre materia y alunmo
 */

-(void) insertarMateriayAlumno :(NSInteger) matricula :(NSInteger) idMateria{
    NSString  *insertarSQL = [NSString stringWithFormat:@"INSERT into MateriaAlumno(ID,matricula,materia) VALUES (null,%d,%d)",matricula, idMateria ];
    
    char *error;
    int resultado = sqlite3_exec(baseDeDatos, [insertarSQL UTF8String], NULL, NULL, &error);
    
    if ( resultado == SQLITE_OK) {
        NSLog(@"Registro insertado...");
    }
    else {
        NSLog(@"Error al insertar registro: %s", error);
    }
}

//_______________________________________________
/*
 PARAMETROS calificacion: calificación que obtuvo
 matricula: matricula del alumno (FK)
 numeroTarea: numero de la tarea calificada (FK)
 
 DESCRIPCIÓN
 cambia calificación
 */

-(void) calificar :(NSInteger)calificacion :(NSInteger) matricula :(NSInteger)numeroTarea{
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



-(NSMutableArray*) getMaterias {
    
    NSMutableArray *materias = [[NSMutableArray alloc] init] ;
    
    NSString *getMaterias = [NSString stringWithFormat:@"SELECT nombre from materia"];
    
    sqlite3_stmt *declaracion;
    
    
    if (sqlite3_prepare_v2(baseDeDatos, [getMaterias UTF8String],-1, &declaracion, nil) == SQLITE_OK){
        
        while (sqlite3_step(declaracion) == SQLITE_ROW) {
            char *alumnoSTR = (char *)sqlite3_column_text(declaracion, 0);
            NSString *alumno = [[NSString alloc] initWithUTF8String:alumnoSTR];
            [materias addObject:alumno];
        }
        
    }
    else{
        NSLog(@"error");
    }
    
    
    return materias;
    
}



-(NSMutableArray*) getAlumnos :(NSString*)nombreMateria{
    
    NSMutableArray *alumnosPorGrupo = [[NSMutableArray alloc] init] ;
    
    NSString *getId = [NSString stringWithFormat:@"SELECT ID from materia where nombre like '%@'",nombreMateria];
    
    sqlite3_stmt *declaracion;
    
    char *indiceStr = " ";
    if (sqlite3_prepare_v2(baseDeDatos, [getId UTF8String],-1, &declaracion, nil) == SQLITE_OK){
        while (sqlite3_step(declaracion)==SQLITE_ROW) {
            indiceStr = (char*)sqlite3_column_text(declaracion,0);
            NSString *indice = [[NSString alloc] initWithUTF8String:indiceStr];
            NSString *getAlumnosQuery  = [NSString stringWithFormat:@"SELECT nombre FROM alumno where matricula = (SELECT matricula from materiaAlumno where id = %@)",indice];
            
            sqlite3_stmt *declaracion2;
            if (sqlite3_prepare_v2(baseDeDatos, [getAlumnosQuery UTF8String],-1, &declaracion2, nil) == SQLITE_OK){
                
                while (sqlite3_step(declaracion2) == SQLITE_ROW) {
                    char *alumnoSTR = (char *)sqlite3_column_text(declaracion2, 0);
                    NSString *alumno = [[NSString alloc] initWithUTF8String:alumnoSTR];
                    [alumnosPorGrupo addObject:alumno];
                }
                
            }
            else{
                NSLog(@"error");
            }
            
        }
        
        
    }
    else{
        NSLog(@"error");
    }
    
    
    return alumnosPorGrupo;
    
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
