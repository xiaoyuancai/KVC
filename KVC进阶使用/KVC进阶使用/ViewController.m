//
//  ViewController.m
//  KVC进阶使用
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
    
    //kvc的字典操作
//    [self dictionayTest];
    
    //kvc消息传递
//    [self arrayTest];
    
    //kvc集合操作
    [self containerNestingTest1];
}

//kvc集合操作，主要有五种操作，分别是 聚合操作、数组操作、嵌套集合操作
// 聚合操作有五种：@avg、@count、@max、@min、@sum
- (void) contrainerTest {
    
    NSMutableArray* students = [NSMutableArray array];
    for (int i = 0; i < 6; i++) {
        XYCPerson* student = [XYCPerson new];
        NSDictionary* dict = @{
                               @"name":@"Tom",
                               @"age":@(18+i),
                               @"nick":@"Cat",
                               @"height":@(1.65 + 0.02*arc4random_uniform(6)),
                               };
        [student setValuesForKeysWithDictionary:dict];
        [students addObject:student];
    }
    
    NSLog(@"%@", [students valueForKey:@"height"]);
    
    /// 平均身高
    float avg = [[students valueForKeyPath:@"@avg.height"] floatValue];
    NSLog(@"%f", avg);
    
}

/// 数组操作符 @distinctUnionOfObjects @unionOfObjects
- (void) contrainerArrayTest {
    
    NSMutableArray* students = [NSMutableArray array];
    for (int i = 0; i < 6; i++) {
        XYCPerson* student = [XYCPerson new];
        NSDictionary* dict = @{
                               @"name":@"Tom",
                               @"age":@(18+i),
                               @"nick":@"Cat",
                               @"height":@(1.65 + 0.02*arc4random_uniform(6)),
                               };
        [student setValuesForKeysWithDictionary:dict];
        [students addObject:student];
    }
    
    
    NSArray* arr = [students valueForKeyPath:@"@distinctUnionOfObjects.height"];
    NSLog(@"arr = %@", arr);
    
    NSArray* arr1 = [students valueForKeyPath:@"@unionOfObjects.height"];
    NSLog(@"arr1 = %@", arr1);
}

/// 嵌套集合(array&set)操作 @distinctUnionOfArrays @unionOfArrays @distinctUnionOfSets
- (void) containerNestingTest {
    
    NSMutableArray* students = [NSMutableArray array];
    for (int i = 0; i < 6; i++) {
        XYCPerson* student = [XYCPerson new];
        NSDictionary* dict = @{
                               @"name":@"Tom",
                               @"age":@(18+i),
                               @"nick":@"Cat",
                               @"height":@(1.65 + 0.02*arc4random_uniform(6)),
                               };
        [student setValuesForKeysWithDictionary:dict];
        [students addObject:student];
    }
    
    NSMutableArray* students1 = [NSMutableArray array];
    for (int i = 0; i < 6; i++) {
        XYCPerson* student = [XYCPerson new];
        NSDictionary* dict = @{
                               @"name":@"Tom",
                               @"age":@(18+i),
                               @"nick":@"Cat",
                               @"height":@(1.65 + 0.02*arc4random_uniform(6)),
                               };
        [student setValuesForKeysWithDictionary:dict];
        [students1 addObject:student];
    }
    
    // 嵌套数组
    NSArray* nestArr = @[students, students1];
    
    //
    NSArray* arr = [nestArr valueForKeyPath:@"@distinctUnionOfArrays.height"];
    NSLog(@"arr = %@", arr);
    
    NSArray* arr1 = [nestArr valueForKeyPath:@"@unionOfArrays.height"];
    NSLog(@"arr1 = %@", arr1);
    
}

- (void) containerNestingTest1 {
    
    NSMutableSet* students = [NSMutableSet set];
    for (int i = 0; i < 6; i++) {
        XYCPerson* student = [XYCPerson new];
        NSDictionary* dict = @{
                               @"name":@"Tom",
                               @"age":@(18+i),
                               @"nick":@"Cat",
                               @"height":@(1.65 + 0.02*arc4random_uniform(6)),
                               };
        [student setValuesForKeysWithDictionary:dict];
        [students addObject:student];
    }
    
    
    NSMutableSet* students1 = [NSMutableSet set];
    for (int i = 0; i < 6; i++) {
        XYCPerson* student = [XYCPerson new];
        NSDictionary* dict = @{
                               @"name":@"Tom",
                               @"age":@(18+i),
                               @"nick":@"Cat",
                               @"height":@(1.65 + 0.02*arc4random_uniform(6)),
                               };
        [student setValuesForKeysWithDictionary:dict];
        [students1 addObject:student];
    }
    
    
    NSSet* nestSet = [NSSet setWithObjects:students, students1, nil];
    NSArray* arr1 = [nestSet valueForKeyPath:@"@distinctUnionOfSets.height"];
    NSLog(@"arr1 = %@", arr1);
}





//消息传递
-(void)arrayTest{
    NSArray* ary = @[@"xiao",@"yuan",@"cai"];
    //相当于给ary每一个成员发一个length消息
    NSArray* lengthAry = [ary valueForKey:@"length"];
    NSLog(@"length = %@",lengthAry);
    
    //相当于给ary每一个成员发一个uppercaseString消息
    NSArray* uppercaseStringAry = [ary valueForKey:@"uppercaseString"];
    NSLog(@"uppercaseString = %@",uppercaseStringAry);
}

//kvc的字典操作
-(void)dictionayTest{
    XYCPerson* per = [XYCPerson new];
    NSDictionary* dic = @{
                          @"name":@"xyc",
                          @"age":@29,
                          @"nick":@"xiaoyuancai",
                          @"value":@"test"
                          };
    //为per赋值
    [per setValuesForKeysWithDictionary:dic];
    NSLog(@"name = %@\n age = %d\n nick = %@\n",per.name,per.age,per.nick);
    
    NSArray* ary = @[@"name",@"age",@"nick",@"test"];
    //拿到结果
    NSDictionary* result = [per dictionaryWithValuesForKeys:ary];
    NSLog(@"rs = %@",result);
}


@end
