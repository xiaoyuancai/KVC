//
//  ViewController.m
//  KVC异常处理及正确性验证
//
//  Created by Yuan Le on 2018/10/12.
//  Copyright © 2018年 Yuan Le. All rights reserved.
//

#import "ViewController.h"
#import "XYCPerson.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    XYCPerson* per = [XYCPerson new];
    
    //为非对象赋值nil，会调用setNilValueForKey
    [per setValue:nil forKey:@"age"];
    
    //捕获使用不存在的key进行赋值,会调用setValue:forUndefinedKey:
    [per setValue:@"xycValue" forKey:@"xyc"];
    
    //捕获使用不存在的key进行取值,会调用valueForUndefinedKey
    [per valueForKey:@"xyc"];
    
}

@end
