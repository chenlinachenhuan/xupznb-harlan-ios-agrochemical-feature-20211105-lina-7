//
//  goodsDetailModel.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/12.
//

#import "goodsDetailModel.h"

@implementation goodsDetailModel
- (id)initWithData:(NSDictionary *)data{
    if (self==[super init]) {
        self.moneyStr = @"30";
        self.moneyRangeStr = @"12.8-42.8";
        self.typeStr = @"自营";
        self.numberStr = @"10000";
        self.titleStr = @"论科学种植的重要性论科学种植的重要重要重论科学种植的重要性论科学种要重";
        self.goodsTypeStr = @"肥料";
        self.addressStr = @"浙江宁波";
        self.sendMoneyStr = @"免运费";
        self.reserveStr = @"256";
        self.storeImage = [UIImage imageNamed:testImage];
        self.storeNameStr = @"化浪农业旗舰店";
        self.score1Str = @"4.8";
        self.score2Str = @"4.7";
        self.allGoodsStr = @"222";
        self.newgoodsStr = @"22";
        self.collectionStr = @"33.7万";
        self.goodsTypeArr = [[NSMutableArray alloc] init];
        for (int i=0; i<5; i++) {
            goodTypeTextModel * model = [[goodTypeTextModel alloc] initWithData:[[NSDictionary alloc]init]];
            if (i==0) {
                model.nameStr = @"正品保证正品保证";
            }
            [self.goodsTypeArr addObject:model];
        }
        self.goodsEnsureDic = [[NSDictionary alloc] initWithObjectsAndKeys:@"正品保证，假一赔四",@"正品保证",@"付款后24小时内发货，逾期赔付",@"24小时发货",@"满足相应条件时，诚信用户再退货寄出后，享受极速退款到账",@"极速退款",@"满足相应条件时，消费者可申请“七天无理由退换货”",@"七天退换", nil];
        self.goodsparameterDic = [[NSDictionary alloc] initWithObjectsAndKeys:@"2021年08月30日至2021年09月24日",@"生产日期",@"化浪农业",@"品牌",@"这里是货号",@"货号",@"中国大陆",@"产地", nil];
        self.goodsCommentArr = [[NSMutableArray alloc] init];
        int count = arc4random()%100;
        for (int i=0; i<count; i++) {
            goodsDetailCommentModel * cModel = [[goodsDetailCommentModel alloc] initWithData:[[NSDictionary alloc]init]];
            [self.goodsCommentArr addObject:cModel];
        }
    
    }
    return self;
}
@end
