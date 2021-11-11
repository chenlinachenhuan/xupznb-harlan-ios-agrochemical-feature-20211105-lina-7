//
//  goodTypeTextModel.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/14.
//

#import "goodTypeTextModel.h"

@implementation goodTypeTextModel
- (id)initWithData:(NSDictionary *)data{
    if (self==[super init]) {
        self.typeImage = [UIImage imageNamed:testImage];
        self.moneyStr = @"25";
        self.typeStr = @"肥料";
        self.nameStr = @"这里是规格名称这里是规格名称这里是规格名称这里是规格名称";
        self.countStr = @"122";
    }
    return self;
}
@end
