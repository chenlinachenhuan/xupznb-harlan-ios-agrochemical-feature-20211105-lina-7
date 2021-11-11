//
//  goodsCellTwoView.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/12.
//

#import <UIKit/UIKit.h>
#import "goodsCellTwoFrameModel.h"
#import "goodTypeTextModel.h"
NS_ASSUME_NONNULL_BEGIN
@interface goodsCellTwoView : UIView{
    CGFloat recordX;
}
@property(nonatomic,retain)UILabel * typeTextL;
@property(nonatomic,retain)UIView * typeV;
@property(nonatomic,retain)goodsCellTwoFrameModel * frameModel;
-(void)createCellTwoView:(goodsCellTwoFrameModel *)frameModel;

@end
 
NS_ASSUME_NONNULL_END
