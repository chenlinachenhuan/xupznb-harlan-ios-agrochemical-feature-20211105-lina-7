//
//  regionModel.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/28.
//

#import "regionModel.h"

@implementation regionModel
-(id)initWithData:(NSDictionary*)dic{
    if (self==[super init]) {
        self.region = dic[@"region"];
        self.firstWord = dic[@"firstWorld"];
        self.myId =dic[@"id"];
        self.level = dic[@"level"];

    }
    return self;
}
@end
