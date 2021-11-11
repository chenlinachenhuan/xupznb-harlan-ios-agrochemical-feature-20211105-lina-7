//
//  classCommentModel.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/28.
//

#import "classCommentModel.h"

@implementation classCommentModel
- (id)initWithData:(NSDictionary *)data
{
    self = [super init];
    
    if (self)
    {
        self.scoreStr = @"4.8";
        self.dateStr = @"2021-09-22";
        self.textStr = @"第一个方面呢就是肉品的问题，很多烧";
        self.headImage = [UIImage imageNamed:@"u=2621658848,3952322712&fm=193&f=GIF.jpeg"];
        self.nameStr = @"王钢蛋";
        
     }
    
    return self;
}
@end
