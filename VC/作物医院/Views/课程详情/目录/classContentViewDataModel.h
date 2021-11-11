//
//  classContentViewDataModel.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/8.
//

#import <Foundation/Foundation.h>
#import "classContentModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface classContentViewDataModel : NSObject
@property(nonatomic,assign)CGRect contentTextFrame;
@property(nonatomic,assign)CGRect LockTextFrame;
@property(nonatomic,assign)CGRect LockImageVFrame;

@property(nonatomic,assign)CGFloat contentCellHeight;
@property(nonatomic,retain)classContentModel * contentModel;
-(void)setContentFrames:(classContentModel*)contentModel;
@end

NS_ASSUME_NONNULL_END
