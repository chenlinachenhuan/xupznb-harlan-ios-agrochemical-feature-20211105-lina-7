//
//  newsParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/15.
//

#import "newsParser.h"
 
@implementation newsParser
-(instancetype)initWithViewProtocol:(id)newsViewProtocol;
{
    self=[super init];
    if(self)
    {
        _newsProtocol=newsViewProtocol;
      
    }
    return self;
}
-(void)requestWithCat2Id:(UInt64)cat2Id withCatId:(UInt64)catId withKeyWord:(NSString*)keyWord withPageNum:(UInt32)pageNum withPageSize:(UInt32)pageSize withShowStatus:(UInt32)showStatus{
    NSDictionary * dic=@{@"cat2Id":[commonMethod transIntToNSNumber64:cat2Id],@"catId":[commonMethod transIntToNSNumber64:catId],@"keyword":keyWord,@"pageNum":[commonMethod transIntToNSNumber32:pageNum],@"pageSize":[commonMethod transIntToNSNumber32:pageSize],@"showStatus":[commonMethod transIntToNSNumber32:showStatus]};
    NSMutableArray * dataArr = [[NSMutableArray alloc] init];
    [self PostRequestDataWithControlParam:dic url:Request_news BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
        if ([dataDic[@"code"] intValue]==200) {
            [dataDic objectForKey:@"data"];
            for (NSDictionary * dic in [[dataDic objectForKey:@"data"] objectForKey:@"list"]) {
                NewsTextMedel * model = [[NewsTextMedel alloc] initWithData:dic];
                [dataArr addObject:model];
             
            }
            [self.newsProtocol success:dataArr total:[dataDic[@"data"][@"total"] integerValue]];
        }else{
            [self.newsProtocol failedMethod:dataDic[@"message"]];
 
        }
    }];
}
@end
