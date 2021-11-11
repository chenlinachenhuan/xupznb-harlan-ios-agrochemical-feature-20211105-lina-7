//
//  goodsCellThreeFrameModel.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/13.
//

#import <Foundation/Foundation.h>
#import "goodsDetailCommentModel.h"
#import "goodsDetailModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface goodsCellThreeFrameModel : NSObject
@property(nonatomic,retain)goodsDetailCommentModel * textModel;
@property(nonatomic,retain)goodsDetailModel * dModel;

@property(nonatomic,assign)CGRect headImgVFrame;
@property(nonatomic,assign)CGRect nameLFrame;
@property(nonatomic,assign)CGRect dateLFrame;
@property(nonatomic,assign)CGRect textLFrame;
@property(nonatomic,assign)CGRect typeLFrame;
@property(nonatomic,assign)CGRect imageVFrame;

@property(nonatomic,assign)CGFloat cellHeight;
-(void)setCellThreeFrames:(goodsDetailCommentModel*)textModel;
@end

NS_ASSUME_NONNULL_END
