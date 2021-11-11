//
//  policyCommentListModel.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface policyCommentListModel : NSObject
@property(nonatomic,retain)NSString*avatar;
@property(nonatomic,retain)NSString*content;
@property(nonatomic,retain)NSString*fabulousNum;
@property(nonatomic,retain)NSString*fabulousStatus;
@property(nonatomic,retain)NSString*pubTimeOffsetDesc;
@property(nonatomic,retain)NSString*myId;
@property(nonatomic,retain)NSString*memberId;
@property(nonatomic,retain)NSString*nickname;
@property(nonatomic,retain)NSString*pubTime;
-(id)initWithData:(NSDictionary*)dic;
@end

NS_ASSUME_NONNULL_END
