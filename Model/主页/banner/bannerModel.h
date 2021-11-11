//
//  bannerModel.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface bannerModel : NSObject
@property(nonatomic,retain)NSString * myId;
@property(nonatomic,retain)NSString * title;
@property(nonatomic,retain)NSString * pic;
@property(nonatomic,retain)NSString * link;
-(id)initWithData:(NSDictionary*)dic;
@end

NS_ASSUME_NONNULL_END
