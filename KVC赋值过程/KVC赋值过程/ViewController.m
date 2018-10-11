//
//  ViewController.m
//  KVC基本使用
//
//  Created by Yuan Le on 2018/10/11.
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
    //赋值
    [per setValue:@"xyc" forKey:@"name"];
 
    //取值
    [per valueForKey:@"name"];
}


@end
