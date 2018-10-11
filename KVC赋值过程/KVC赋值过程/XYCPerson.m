//
//  XYCPerson.m
//  KVC基本使用
//
//  Created by Yuan Le on 2018/10/11.
//  Copyright © 2018年 Yuan Le. All rights reserved.
//

#import "XYCPerson.h"

@implementation XYCPerson

//赋值
//-(void)setName:(NSString*)name{
//    NSLog(@"%s",__func__);
//}

-(void)_setName:(NSString*)name{
    NSLog(@"%s",__func__);
}

-(void)setIsName:(NSString*)name{
    NSLog(@"%s",__func__);
}


//取值
//-(NSString*)getName{
//    NSLog(@"%s",__func__);
//    return @"getName";
//}

-(NSString*)name{
    NSLog(@"%s",__func__);
    return @"name";
}

//是否充许访问变量
//+(BOOL)accessInstanceVariablesDirectly{
//    return NO;
//}

@end
