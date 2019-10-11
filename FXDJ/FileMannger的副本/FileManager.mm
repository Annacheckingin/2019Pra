//
//  FileManager.m
//  eCity_T
//
//  Created by lpw on 11-9-19.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//


#import "FileManager.h"
#import <AddressBookUI/AddressBookUI.h>
#import <sqlite3.h>


static FileManager* filemanager;

@implementation FileManager

@synthesize addressBooks = _addressBooks;

+(FileManager*) shareInstance
{
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        if (!filemanager) {
            filemanager = [[FileManager alloc] init];
        }
    });
    [self createDirectory];
    return filemanager;
}

-(id)init
{
    self = [super init];
    if (self)
    {
        defaults = [NSUserDefaults standardUserDefaults];
    }
    return self;
}

// 存取
- (void)SavewithData:(id)_data withDate_ID:(NSString*)_id
{
    if (_data) {
        [defaults setObject:_data forKey:_id];
        [defaults  synchronize];
    }
}

// 读取
- (id)ReadDataWithId:(NSString*)_ID
{
    return [defaults objectForKey:_ID];
}


+ (NSString *)defaultUserDataPath {
    
    NSString *str = [[NSUserDefaults standardUserDefaults] objectForKey:@"username"];
    if (!str || str.length == 0) {
        return NSTemporaryDirectory();
    }
    NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString *filepath = [NSString stringWithFormat:@"%@/%@", documentsDirectory, [[NSUserDefaults standardUserDefaults] objectForKey:@"username"]];
    BOOL isDir = NO;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL existed = [fileManager fileExistsAtPath:filepath isDirectory:&isDir];
    if (!(isDir == YES && existed == YES)) {
        [fileManager createDirectoryAtPath:filepath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    return filepath;
}
+ (void)createDirectory {
    
    NSString *str = [[NSUserDefaults standardUserDefaults] objectForKey:@"username"];
    if (!str || str.length == 0) {
        return;
    }
    //创建信息数据库表
    sqlite3 *database;
    NSString *documentsDirectory = [self defaultUserDataPath];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"user.sql"];
    if (sqlite3_open([path UTF8String], &database) == SQLITE_OK)
    {
        char *errmsg;
        const char *createtable = "CREATE TABLE IF NOT EXISTS messages (id INTEGER PRIMARY KEY AUTOINCREMENT, msgid varchar(50),date double, measage text, isRead int,title text,pop text)";
        if (sqlite3_exec(database, createtable, NULL, NULL, &errmsg) == SQLITE_OK) {
            NSLog(@"create messages ok");
        }
        
        createtable = "CREATE TABLE IF NOT EXISTS recentcalls (id INTEGER PRIMARY KEY AUTOINCREMENT,date double, number varchar(50), name varchar(50), count varchar(50), type varchar(50), uid varchar(50), identifier varchar(50))";
        if (sqlite3_exec(database, createtable, NULL, NULL, &errmsg) == SQLITE_OK) {
            NSLog(@"create recentcalls ok");
        }
    }
    sqlite3_close(database);
}

//移除数据
+ (void)removeUserDataWithUserID:(NSString *)userID {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
       NSString *cachPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
       NSArray *files = [[NSFileManager defaultManager] subpathsAtPath:cachPath];
       for (NSString *p in files) {
           if ([p isEqualToString:userID]) {
               NSError *error;
               NSString *path = [cachPath stringByAppendingPathComponent:p];
               if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
                   [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
               }
               break;
           }
       }
   });
}













+ (NSString *)defaultPath {
    
    return [NSString stringWithFormat:@"%@/Documents", NSHomeDirectory()];;
}


+ (NSMutableArray *)readArrayWithKey:(NSString *)key {
    
    return [self readArrayWithPath:[self defaultPath] key:key];
}

+ (NSMutableDictionary *)readDicWithKey:(NSString *)key {
    
    return [self readDicWithPath:[self defaultPath] key:key];
}


+ (NSMutableArray *)readArrayWithPath:(NSString *)path key:(NSString *)key {
    
    NSString *cachesPath = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist", key]];
    
    // 判断文件是否存在
    NSFileManager *manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:cachesPath isDirectory:nil]) {
        BOOL success = [[NSMutableArray array] writeToFile:cachesPath atomically:YES];
        NSAssert(success, @"Write to file '%@' failed.", cachesPath);
    }
    
    NSMutableArray *array = [NSMutableArray arrayWithContentsOfFile:cachesPath];
    
    return array;
}

+ (NSMutableDictionary *)readDicWithPath:(NSString *)path key:(NSString *)key {
    
    NSString *cachesPath = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist", key]];
    
    // 判断文件是否存在
    NSFileManager *manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:cachesPath isDirectory:nil]) {
        BOOL success = [[NSMutableDictionary dictionary] writeToFile:cachesPath atomically:YES];
        NSAssert(success, @"Write to file '%@' failed.", cachesPath);
    }
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithContentsOfFile:cachesPath];
    
    return dic;
}



+ (id)readNOSerializeDataWithPath:(NSString *)path key:(NSString *)key {
    
    NSString *cachesPath = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist", key]];
    
    
    // 判断文件是否存在
    NSFileManager *manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:cachesPath isDirectory:nil]) {
        BOOL success = [[NSData data] writeToFile:cachesPath atomically:YES];
        NSAssert(success, @"Write to file '%@' failed.", cachesPath);
    }
    
    NSData *readData = [NSData dataWithContentsOfFile:cachesPath];
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:readData];
    id object = [unarchiver decodeObjectForKey:key];

    return object;
}




+ (BOOL)writeDataWithObject:(id)object key:(NSString *)key {
    
    return [self writeDataWithObject:object path:[self defaultPath] key:key];
}

+ (BOOL)writeDataWithObject:(id)object path:(NSString *)path key:(NSString *)key {
    
    NSString *cachesPath = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist", key]];
    
    BOOL success = [object writeToFile:cachesPath atomically:YES];
    NSAssert(success, @"Write to file '%@' failed.", cachesPath);
    return success;
}

+ (BOOL)writeDataWithNOSerializeObject:(id)object path:(NSString *)path key:(NSString *)key {
    
    NSMutableData *saveData = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:saveData];
    [archiver encodeObject:object forKey:key];
    [archiver finishEncoding];
    
    return [self writeDataWithObject:saveData path:path key:key];
}




//读通讯录
//- (void)readContact
//{
//    NSMutableArray *addressBookTemp = [NSMutableArray array];
//    //添加判断系统版本 要求是否授权获取通讯录 wjj 1.10
//    __block bool accessGranted = NO;
//    ABAddressBookRef addressBooks = nil;
//    if ([[UIDevice currentDevice].systemVersion floatValue] >= 6.0) {
//        addressBooks = ABAddressBookCreateWithOptions(NULL, NULL);
//        //获取权限
//        dispatch_semaphore_t sema = dispatch_semaphore_create(0);
//        ABAddressBookRequestAccessWithCompletion(addressBooks, ^(bool granted, CFErrorRef error){
//            accessGranted = granted;
//            dispatch_semaphore_signal(sema);
//        });
//        dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
//        dispatch_release(sema);
//    }
//    else{
//        accessGranted = YES;
//        addressBooks = ABAddressBookCreate();
//    }
//    if (!accessGranted) {
//        return;
//    }
//
//    CFArrayRef allPeople = ABAddressBookCopyArrayOfAllPeople(addressBooks);
//    CFIndex nPeople = ABAddressBookGetPersonCount(addressBooks);
//
//    for (NSInteger i = 0; i < nPeople; i++)
//    {
//        TKAddressBook *addressBook = [[TKAddressBook alloc] init];
//        ABRecordRef person = CFArrayGetValueAtIndex(allPeople, i);
//        CFStringRef abName = (CFStringRef)ABRecordCopyValue(person, kABPersonFirstNameProperty);
//        CFStringRef abLastName = (CFStringRef)ABRecordCopyValue(person, kABPersonLastNameProperty);
//        CFStringRef abFullName = ABRecordCopyCompositeName(person);
//
//        NSString *nameString = (NSString *)abName;
//        NSString *lastNameString = (NSString *)abLastName;
//
//        if ((id)abFullName != nil) {
//            nameString = (NSString *)abFullName;
//        } else {
//            if ((id)abLastName != nil)
//            {
//                nameString = [NSString stringWithFormat:@"%@ %@", nameString, lastNameString];
//            }
//        }
//
//        addressBook.name = nameString;
//        addressBook.recordID = (int)ABRecordGetRecordID(person);
//        addressBook.rowSelected = NO;
//
//        ABPropertyID multiProperties[] = {
//            kABPersonPhoneProperty,
//            kABPersonEmailProperty
//        };
//        NSInteger multiPropertiesTotal = sizeof(multiProperties) / sizeof(ABPropertyID);
//        for (NSInteger j = 0; j < multiPropertiesTotal; j++) {
//            ABPropertyID property = multiProperties[j];
//            ABMultiValueRef valuesRef = ABRecordCopyValue(person, property);
//            NSInteger valuesCount = 0;
//            if (valuesRef != nil) valuesCount = ABMultiValueGetCount(valuesRef);
//
//            if (valuesCount == 0) {
//                CFRelease(valuesRef);
//                continue;
//            }
//
//            for (NSInteger k = 0; k < valuesCount; k++) {
//                CFStringRef value = (CFStringRef)ABMultiValueCopyValueAtIndex(valuesRef, k);
//                switch (j) {
//                    case 0: {// Phone number
//                        TKAddressNum *num = [[TKAddressNum alloc] init];
//                        num.tel = [(NSString*)value telephoneWithReformat];
//                        num.isfriend = NO;
//                        [addressBook.tels addObject:num];
//                        break;
//                    }
//                    case 1: {// Email
//                        addressBook.email = (NSString*)value;
//                        break;
//                    }
//                }
//                CFRelease(value);
//            }
//            CFRelease(valuesRef);
//        }
//
//        [addressBookTemp addObject:addressBook];
//        [addressBook release];
//        if (abName) CFRelease(abName);
//        if (abLastName) CFRelease(abLastName);
//        if (abFullName) CFRelease(abFullName);
//    }
//
//    CFRelease(allPeople);
//    CFRelease(addressBooks);
//
//    _addressBooks = [[NSMutableArray alloc] initWithArray:addressBookTemp];
//}

//- (void)refresh
//{
//    [self readContact];
//}

@end
