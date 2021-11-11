//
//  subClassDetailParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/10.
//

#import "subClassDetailParser.h"

@implementation subClassDetailParser
-(void)requestSubClassDetail:(NSInteger)myId{
    NSDictionary * dic = @{@"id":[NSNumber numberWithInteger:myId]};
    [self GetRequestDataWithControlParam:dic url:[NSString stringWithFormat:@"%@%ld",Request_subClassDetail,(long)myId] BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
        subClassDetailModel * model = [[subClassDetailModel alloc] initWithData:dataDic[@"data"]];
        [self.myDelegate successGetSubClassDetail:model];
    }];
}
@end
