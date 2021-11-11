//
//  cityModel.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/28.
//

#import "cityModel.h"

@implementation cityModel
-(id)initWithData:(NSDictionary*)dic{
    if (self==[super init]) {
        self.city = dic[@"city"];
        self.firstWord = dic[@"firstWorld"];
        self.myId =dic[@"id"];
        self.level = dic[@"level"];

    }
    return self;
}
@end
