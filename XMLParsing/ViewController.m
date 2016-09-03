//
//  ViewController.m
//  XMLParsing
//
//  Created by Student P_02 on 31/08/16.
//  Copyright © 2016 Amol Dhage. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSURL *xmlURL = [[NSBundle mainBundle]URLForResource:@"Employee" withExtension:@"xml"];
    
    parser = [[NSXMLParser alloc]initWithContentsOfURL:xmlURL];
    parser.delegate = self;
    [parser parse];
    
    employees = [[NSMutableArray alloc]init];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

-(void)showEmployeeOnConsole:(NSMutableArray *)array  {
    if (array.count > 0) {
    
        NSLog(@"Count : %lu",(unsigned long)array.count);
            
        for (Employee *e in array)
            {
                NSLog(@"\nEMP_ID : %@\nNAME : %@\nDESIGNATION : %@\nCONTACT : %@\n",e.emp_id,e.name,e.designation,e.contact);
        }
    }
}



#pragma mark NSXMLParser Delegate Methods
    
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {
        
    if ([elementName isEqualToString:@"root"]) {
         employees = [[NSMutableArray alloc]init];
            
    } else if ([elementName isEqualToString:@"Employee"]) {
            
        employeModel = [[Employee alloc]init];
        employeModel.emp_id = [attributeDict valueForKey:@"id"];
            
    } else if ([elementName isEqualToString:@"Name"]) {
            
        dataString = [[NSMutableString alloc]init];
            
    }
      else if ([elementName isEqualToString:@"Designation"]) {
            
        dataString = [[NSMutableString alloc]init];
            
    }
      else if ([elementName isEqualToString:@"ContactNo"]) {
            
        dataString = [[NSMutableString alloc]init];
            
    }
        
}
    
    
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
        
        [dataString appendString:string];
    }
    
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
        
    if ([elementName isEqualToString:@"Name"]) {
        employeModel.name = dataString;
    }
    else if ([elementName isEqualToString:@"Designation"]) {
        employeModel.designation = dataString;
    }
    else if ([elementName isEqualToString:@"ContactNo"]) {
        employeModel.contact = dataString;
    }
    else if ([elementName isEqualToString:@"Employee"]){
         [employees addObject:employeModel];
    }
    else if ([elementName isEqualToString:@"root"]) {
    
      [self showEmployeeOnConsole:employees];
    }
}

@end
