//
//  trendCommentTwoFrameModel.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/11.
//

#import <Foundation/Foundation.h>
#import "trendTwoCommentModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface trendCommentTwoFrameModel : NSObject
@property(nonatomic,assign)CGRect nameAndTextFrame;
@property(nonatomic,assign)CGFloat cellHeight;
@property(nonatomic,retain)trendTwoCommentModel * model ;

//-(void)setTowCommentFrames:(trendTwoCommentModel*)model;
@end

NS_ASSUME_NONNULL_END
