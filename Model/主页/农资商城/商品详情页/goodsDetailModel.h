//
//  goodsDetailModel.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/12.
//

#import <Foundation/Foundation.h>
#import "goodsDetailCommentModel.h"
#import "goodTypeTextModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface goodsDetailModel : NSObject
@property(nonatomic,retain)NSString * moneyStr;
@property(nonatomic,retain)NSString * moneyRangeStr;
@property(nonatomic,retain)NSString * typeStr;//自营
@property(nonatomic,retain)NSString * numberStr;
@property(nonatomic,retain)NSString * titleStr;
@property(nonatomic,retain)NSString * goodsTypeStr;
@property(nonatomic,retain)NSMutableArray * goodsTypeArr;
@property(nonatomic,retain)NSString * addressStr;
@property(nonatomic,retain)NSString * reserveStr;

@property(nonatomic,retain)NSString * sendMoneyStr;//快递
@property(nonatomic,retain)NSDictionary * goodsEnsureDic;//保障
@property(nonatomic,retain)NSDictionary * goodsparameterDic;//参数
@property(nonatomic,retain)NSMutableArray * goodsCommentArr;
@property(nonatomic,retain)UIImage * storeImage;
@property(nonatomic,retain)NSString * storeNameStr;
@property(nonatomic,retain)NSString * score1Str;
@property(nonatomic,retain)NSString * score2Str;
@property(nonatomic,retain)NSString * allGoodsStr;
@property(nonatomic,retain)NSString * newgoodsStr;
@property(nonatomic,retain)NSString * collectionStr;

- (id)initWithData:(NSDictionary *)data;


@end

NS_ASSUME_NONNULL_END
