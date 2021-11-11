//
//  trendCreateParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/21.
//

#import "trendCreateParser.h"

@implementation trendCreateParser
-(void)requestAlbumPics:(NSString*)albumPics content:(NSString*)content typeId:(NSInteger)typeId title:(NSString*)title{
    NSDictionary* dic = @{@"albumPics":albumPics,@"content":content,@"typeId":[NSNumber numberWithInteger:typeId],@"title":title};
    [self PostRequestDataWithControlParam:dic url:Request_trendCreate BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
        if ([dataDic[@"code"] intValue]==200) {
            [self.myDelegate successCreateTrend];

        }else{
            [[ChrysanthemumIndexView sharedMasterUser]remove];
            [self.myDelegate failedMethod:dataDic[@"message"]];

        }
     }];
}
@end
