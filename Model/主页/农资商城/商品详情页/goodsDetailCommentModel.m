//
//  goodsDetailCommentModel.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/13.
//

#import "goodsDetailCommentModel.h"

@implementation goodsDetailCommentModel
- (id)initWithData:(NSDictionary *)data{
    if (self==[super init]) {
        self.headImg = [UIImage imageNamed:testImage];
        self.nameStr = @"买哪";
        self.dateStr = @"2020.10.10";
        self.textStr = @"论科学种植的重要性论科学种植的重要性论科学种植的重要性论科学种植的重要性论科学种植的重要性论科学种植的重要性论科学种植的重要性";
        self.typeStr = @"规格分类：小包 15克 ";
        self.imageArr = [[NSMutableArray alloc] init];
        for (int i =0; i<9; i++) {
            [self.imageArr addObject:[UIImage imageNamed:testImage]];
        }
    }
    return self;
}
@end
