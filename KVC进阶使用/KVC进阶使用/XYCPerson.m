//
//  XYCPerson.m
//  KVC进阶使用
//
//  Created by Yuan Le on 2018/10/12.
//  Copyright © 2018年 Yuan Le. All rights reserved.
//

#import "XYCPerson.h"

@implementation XYCPerson

//赋值key不存在
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    NSLog(@"key = %@  不存在",key);
}

//取值key不存在
-(id)valueForUndefinedKey:(NSString *)key{
    NSLog(@"取值key = %@ 不存在",key);
    return nil;
}
@end
