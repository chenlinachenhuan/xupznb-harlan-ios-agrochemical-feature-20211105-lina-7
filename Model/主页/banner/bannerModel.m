//
//  bannerModel.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/5.
//

#import "bannerModel.h"

@implementation bannerModel
-(id)initWithData:(NSDictionary*)dic{
    if (self==[super init]) {
        self.myId = dic[@"id"];
        self.title = dic[@"title"];
        self.pic = dic[@"pic"];
        self.link = dic[@"link"];

    }
    return self;
}
@end
