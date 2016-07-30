//
//  IHandler.m
//  ChainOfResponsibilityPattern
//
//  Created by hairong chen on 16/7/29.
//  Copyright © 2016年 hairong chen. All rights reserved.
//

#import "IHandler.h"

@interface IHandler ()

@property (nonatomic,assign)NSInteger level;
@property (nonatomic,strong)IHandler *nextHandler;

@end

@implementation IHandler

- (instancetype)initWihtLevel:(NSInteger)level {
    if (self = [super init]) {
        self.level = level;
    }
    return self;
}


- (void)handleMessage:(IWomen *)women {
    
     NSLog(@"=======level =========>>>> %ld",self.level);
    if (women.type == self.level) {
        [self response:women];
    }else {
        if (self.nextHandler != nil) {// 有后续环节，才把请求往后递送
            [self.nextHandler handleMessage:women];
        }else { // 已经没有后续处理人了，不用处理
            NSLog(@"---没有地方请求了，按不同意处理---");
        }
    }
}

- (void)setNext:(IHandler *)handler {
    self.nextHandler = handler;
}

- (void)response:(IWomen *)women {
    
}

@end