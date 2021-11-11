//
//  knowledgeCatListModel.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface knowledgeCatListModel : NSObject
@property(nonatomic,retain)NSString * myId;
@property(nonatomic,retain)NSString * dictValue;
@property(nonatomic,assign)uint32_t pageSize;

- (id)initWithData:(NSDictionary *)data;
@end

NS_ASSUME_NONNULL_END
