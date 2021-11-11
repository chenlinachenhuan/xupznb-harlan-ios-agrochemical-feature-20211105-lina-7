//
//  rankingListModel.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface rankingListModel : NSObject
@property(nonatomic,retain)NSString * myId;
@property(nonatomic,retain)NSString * showStatus;
@property(nonatomic,retain)NSString * title;
- (id)initWithData:(NSDictionary *)data;
@end

NS_ASSUME_NONNULL_END
