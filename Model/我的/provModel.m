//
//  provModel.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/28.
//

#import "provModel.h"

@implementation provModel
-(id)initWithData:(NSDictionary*)dic{
    if (self==[super init]) {
        self.prov = dic[@"prov"];
        self.firstWord = dic[@"firstWorld"];
        self.level = dic[@"level"];
        self.myId =dic[@"id"];
    }
    return self;
}
@end
