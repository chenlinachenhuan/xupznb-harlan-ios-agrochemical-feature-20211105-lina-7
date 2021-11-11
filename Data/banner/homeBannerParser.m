//
//  homeBannerParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/5.
//

#import "homeBannerParser.h"

@implementation homeBannerParser
-(void)requestBannerPosition:(NSInteger)position num:(NSInteger)num{
    NSDictionary * dic = @{@"num":[NSNumber numberWithInteger:num],@"position":[NSNumber numberWithInteger:position]};
    [self GetRequestDataWithControlParam:dic url:[NSString stringWithFormat:@"%@%ld/%ld",Request_bannerCommon,(long)position,(long)num] BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
        NSMutableArray * arr = [[NSMutableArray alloc] init];
        for (NSDictionary*dicc in dataDic[@"data"]) {
            bannerModel * model = [[bannerModel alloc] initWithData:dicc];
            [arr addObject:model];
        }
        [self.myDelegate successGetCommonBanner:arr];
    }];
}
@end
