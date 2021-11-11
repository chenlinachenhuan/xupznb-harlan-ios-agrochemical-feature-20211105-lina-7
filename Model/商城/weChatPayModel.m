//
//  weChatPayParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/5.
//

#import "weChatPayModel.h"

@implementation weChatPayModel
-(id)initWithData:(NSDictionary*)dic{
    if (self==[super init]) {
        self.package = dic[@"package"];
        self.appid = dic[@"appid"];
        self.sign = dic[@"sign"];
        self.partnerid = dic[@"partnerid"];
        self.prepayid = dic[@"prepayid"];
        self.noncestr = dic[@"noncestr"];
        self.timestamp = dic[@"timestamp"];

    }
    return self;
}
@end
