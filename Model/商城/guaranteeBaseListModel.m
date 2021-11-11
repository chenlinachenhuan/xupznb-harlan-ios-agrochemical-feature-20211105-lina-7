//
//  guaranteeBaseListModel.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/2.
//

#import "guaranteeBaseListModel.h"

@implementation guaranteeBaseListModel
-(id)initWithData:(NSDictionary*)dic{
    if (self==[super init]) {
        self.myId = dic[@"id"];
        self.dictValue = dic[@"dictValue"];
        self.remark = dic[@"remark"];

    }
    return self;
}
@end
