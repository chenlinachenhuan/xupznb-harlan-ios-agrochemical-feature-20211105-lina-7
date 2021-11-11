//
//  publishVIew.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol publishVIewDelegate;
@interface publishVIew : UIView
@property(nonatomic,retain)UIView * shadowView;
@property(nonatomic,retain)UIView * bgView;
@property(nonatomic,weak)id<publishVIewDelegate>myDelegate;
@property(nonatomic,retain)NSArray * titleArr;

-(void)createPublishView:(NSArray*)titleArr;
@end
@protocol publishVIewDelegate <NSObject>

-(void)publishTypeButtonMethod:(NSInteger)tag;

@end
NS_ASSUME_NONNULL_END
