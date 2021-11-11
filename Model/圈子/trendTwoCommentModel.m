//
//  trendTwoCommentModel.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/11.
//

#import "trendTwoCommentModel.h"

@implementation trendTwoCommentModel
- (id)initWithData:(NSDictionary *)data
{
    self = [super init];
    
    if (self)
    {
        self.nameStr = data[@"nickname"];
        self.textStr = data[@"content"];
         
        
     }
    
    return self;
}
@end
