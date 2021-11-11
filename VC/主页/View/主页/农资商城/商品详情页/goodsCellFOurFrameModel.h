//
//  goodsCellFOurFrameModel.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/13.
//

#import <Foundation/Foundation.h>
#import "goodsDetailModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface goodsCellFOurFrameModel : NSObject
@property(nonatomic,retain)goodsDetailModel * textModel;
@property(nonatomic,assign)CGRect imageVFrame;
@property(nonatomic,assign)CGRect storeNameFrame;
@property(nonatomic,assign)CGRect scoreL1Frame;
@property(nonatomic,assign)CGRect scoreL2Frame;
@property(nonatomic,assign)CGRect allGoodsLFrame;
@property(nonatomic,assign)CGRect newGoodsLFrame;
@property(nonatomic,assign)CGRect collectionLFrame;
@property(nonatomic,assign)CGRect label1Frame;
@property(nonatomic,assign)CGRect label2Frame;
@property(nonatomic,assign)CGRect label3Frame;
@property(nonatomic,assign)CGRect sortButtonFrame;
@property(nonatomic,assign)CGRect goToButtonFrame;
@property(nonatomic,assign)CGFloat cellHeight;
-(void)setCellFOurFrames:(goodsDetailModel*)textModel;
@end

NS_ASSUME_NONNULL_END
