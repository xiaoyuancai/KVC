//
//  XYCPerson.h
//  KVC进阶使用
//
//  Created by Yuan Le on 2018/10/12.
//  Copyright © 2018年 Yuan Le. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYCPerson : NSObject

@property (nonatomic,copy)NSString* name;

@property (nonatomic,assign)int age;

@property (nonatomic,strong)NSString* nick;

@property (nonatomic, assign) float height;

@end
