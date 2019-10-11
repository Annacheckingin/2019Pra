//
//  FileManager.h
//  eCity_T
//
//  Created by lpw on 11-9-19.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileManager : NSObject
{
	NSUserDefaults *defaults;
}

@property (nonatomic,retain)NSMutableArray *addressBooks;

+(FileManager*) shareInstance;
+ (NSString *)defaultUserDataPath;
+ (void)createDirectory;
+ (void)removeUserDataWithUserID:(NSString *)userID;






+ (NSString *)defaultPath;


// 存取
- (void)SavewithData:(id)_data withDate_ID:(NSString*)_id;

// 读取
- (id)ReadDataWithId:(NSString*)_ID;

- (void)refresh;





/* 使用默认路径保存
 key 文件名
 */
+ (NSMutableDictionary *)readDicWithKey:(NSString *)key;
+ (NSMutableArray *)readArrayWithKey:(NSString *)key;

/* 给出指定路径保存 */
+ (NSMutableDictionary *)readDicWithPath:(NSString *)path key:(NSString *)key;
+ (NSMutableArray *)readArrayWithPath:(NSString *)path key:(NSString *)key;

/* 给出指定路径保存
 key 既是文件名 也是关键字
 如果使用writeDataWithNOSerializeObject保存 则使用该方法读取
 */
+ (id)readNOSerializeDataWithPath:(NSString *)path key:(NSString *)key;




/* 读取默认路径数据
 key 文件名
 */
+ (BOOL)writeDataWithObject:(id)object key:(NSString *)key;

/* 读取指定路径数据 */
+ (BOOL)writeDataWithObject:(id)object path:(NSString *)path key:(NSString *)key;

/* 给出指定路径保存
 key 既是文件名 也是关键字
 object 可以使任意对象 前两个方法的object必须是属性列表类
 */
+ (BOOL)writeDataWithNOSerializeObject:(id)object path:(NSString *)path key:(NSString *)key;


@end
