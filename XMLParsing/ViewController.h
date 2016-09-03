//
//  ViewController.h
//  XMLParsing
//
//  Created by Student P_02 on 31/08/16.
//  Copyright © 2016 Amol Dhage. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Employee.h"

@interface ViewController : UIViewController<NSXMLParserDelegate>

{
    NSXMLParser *parser;
    NSMutableString *dataString;
    NSMutableArray *employees;
    Employee *employeModel;
}





@end

