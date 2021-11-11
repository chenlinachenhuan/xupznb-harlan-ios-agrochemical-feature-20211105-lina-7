//
//  goodsParentListModel.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface goodsParentListModel : NSObject
@property(nonatomic,retain)NSString * myId;
@property(nonatomic,retain)NSString * name;
@property(nonatomic,retain)NSMutableArray *childArr;

-(id)initWithData:(NSDictionary*)dic;
@end

NS_ASSUME_NONNULL_END
