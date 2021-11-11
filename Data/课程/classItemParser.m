//
//  classItemParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/10.
//

#import "classItemParser.h"

@implementation classItemParser
-(void)requestItem:(NSInteger)myId{
    NSDictionary * dic = @{@"id":[NSNumber numberWithInteger:myId]};
    [self GetRequestDataWithControlParam:dic url:[NSString stringWithFormat:@"%@%ld",Request_classItem,(long)myId] BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
        classDetailIntroduceModel * model = [[classDetailIntroduceModel alloc] initWithData:dataDic[@"data"]];
        [self.myDelegate successGetItem:model];

    }];
 }
@end
