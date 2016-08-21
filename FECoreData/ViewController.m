//
//  ViewController.m
//  FECoreData
//
//  Created by keso on 16/8/21.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

#import "ViewController.h"
#import "Book.h"
#import "Book+CoreDataProperties.h"
#import <MagicalRecord/MagicalRecord.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self createData];
    [self searchData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - SetUp

- (void)createData {
    NSLog(@"%@",NSHomeDirectory());
    NSManagedObjectContext *context = [NSManagedObjectContext MR_defaultContext];
    Book *book =[Book MR_createEntity];
    book.bookName = [NSString stringWithFormat:@"花样年华-%@",@(2)];
    book.address = @"北京";
    [context MR_saveToPersistentStoreAndWait];
}

- (void)searchData {
    NSArray *books = [Book MR_findAll];
    for (NSInteger i=0; i<[books count]; i++) {
        Book *book = [books objectAtIndex:i];
        NSLog(@"%@---%@",book.bookName,book.address);
    }
}

- (void)deleteData {
    
}

@end
