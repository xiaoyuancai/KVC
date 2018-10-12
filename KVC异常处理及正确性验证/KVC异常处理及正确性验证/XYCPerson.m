//
//  XYCPerson.m
//  KVC异常处理及正确性验证
//
//  Created by Yuan Le on 2018/10/12.
//  Copyright © 2018年 Yuan Le. All rights reserved.
//

#import "XYCPerson.h"

@implementation XYCPerson

//捕获对非对象类型赋值nil
-(void)setNilValueForKey:(NSString *)key{
    NSLog(@"%@ 不能为nil",key);
}

//捕获使用不存在的key进行赋值
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    NSLog(@"赋值key:%@ 不存在",key);
}

//捕获使用不存在的key进行取值
-(id)valueForUndefinedKey:(NSString *)key{
    NSLog(@"取值key:%@ 不存在",key);
    return nil;
}
@end
