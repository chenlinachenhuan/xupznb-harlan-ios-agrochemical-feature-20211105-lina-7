//
//  goodsCellOneFrameModel.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/12.
//

#import <Foundation/Foundation.h>
#import "productDetailModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface goodsCellOneFrameModel : NSObject
@property(nonatomic,retain)productDetailModel * textModel;
@property(nonatomic,assign)CGRect moneyUnitLFrame;
@property(nonatomic,assign)CGRect moneyLFrame;
@property(nonatomic,assign)CGRect moneyRangeLFrame;
@property(nonatomic,assign)CGRect typeLFrame;
@property(nonatomic,assign)CGRect numberLFrame;
@property(nonatomic,assign)CGRect titleLFrame;
@property(nonatomic,assign)CGRect shareBFrame;
@property(nonatomic,assign)CGRect shareLFrame;
@property(nonatomic,assign)CGFloat cellOneHeight;
-(void)setGoodsFrams:(productDetailModel*)textModel;
@end

NS_ASSUME_NONNULL_END
