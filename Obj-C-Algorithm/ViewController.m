//
//  ViewController.m
//  Obj-C-Algorithm
//
//  Created by Ang Jian Yao on 06/02/2017.
//  Copyright © 2017 JayAng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    NSMutableArray *theArray = [[NSMutableArray alloc] initWithArray:@[@1, @10, @2, @42, @44, @78, @100, @90, @120]];
    [self performSelectionSort:theArray];
    [self performInsertionSort:theArray];
}

//MARK: Selection Sort
-(void)performSelectionSort:(NSMutableArray*)arrayToBeSorted {
    
    for (int i = 0; i < arrayToBeSorted.count; i++) {
        
        int minimum = i;
        
        for (int j = i + 1; j < arrayToBeSorted.count; j++) {
            if ([arrayToBeSorted objectAtIndex:j] < [arrayToBeSorted objectAtIndex:i]) {
                minimum = j;
            }
        }
        
        if (minimum != i) {
          [arrayToBeSorted exchangeObjectAtIndex:i withObjectAtIndex:minimum];
        }
    }
    NSLog(@"performSelectionSort %@", arrayToBeSorted);
}


//MARK: Insertion Sort
-(void)performInsertionSort:(NSMutableArray*)arrayToBeSorted {
    
    for (int i = 1; i < arrayToBeSorted.count; i++) {
        
        NSUInteger j = i-1;
        
        NSNumber *targetNumber = [arrayToBeSorted objectAtIndex:i];
        
        while (j > 0 && [targetNumber intValue] < [[arrayToBeSorted objectAtIndex:j] intValue]) {
            [arrayToBeSorted exchangeObjectAtIndex:i withObjectAtIndex:j];
            j--;
        }
        [arrayToBeSorted replaceObjectAtIndex:j + 1 withObject:targetNumber];
    }
    NSLog(@"performInsertionSort %@", arrayToBeSorted);
}



@end
