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

    [self findTheFactorialOf:5];
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

//MARK: Palindrome
-(void)performPalindromeCheckOn:(NSString*)word {
    
    if (word != nil && word.length > 0) {
        
        NSMutableString *reversedString = [NSMutableString new];
        for (int i = (int)word.length - 1; i >= 0; i--) {
            char singleCharacterInWord = [word characterAtIndex:i];
            [reversedString appendFormat:@"%c",singleCharacterInWord];
        }
        
        word = [word lowercaseString];
        reversedString = [[NSMutableString alloc] initWithString:[reversedString lowercaseString]];
        
        if (reversedString.length > 0 && [reversedString isEqualToString:word]) {
            NSLog(@"Yes, %@ is a palindrome", word);
        } else {
            NSLog(@"Nope, %@ is NOT a palindrome", word);
        }
    }
}

//MARK: reverse string
-(void)reverseThisString:(NSString*)stringToBeReversed {
    
    if (stringToBeReversed.length > 0) {
        int i = (int)stringToBeReversed.length;
        
        NSMutableString *reversedString = [NSMutableString new];
        while (i >= 0) {
            i--;
            char singleCharacter = [stringToBeReversed characterAtIndex:i];
            [reversedString appendFormat:@"%c", singleCharacter];
        }
        
        NSLog(@"The reversed string of %@ is %@", stringToBeReversed, reversedString);
    }
}


//MARK: Fibonnaci Series
-(void)listOutTheFibonacciSeriesOf:(int)lastIndex  {
    
    NSMutableArray *fibonnaci = [NSMutableArray new];
    
    for (int i = 0; i < lastIndex; i++) {
        if (i < 2) {
            [fibonnaci addObject:[NSNumber numberWithInt:i]];
            continue;
        } else {
            int nextNumber = [[fibonnaci objectAtIndex:i -2] intValue] + [[fibonnaci objectAtIndex:i-1] intValue];
            [fibonnaci addObject:[NSNumber numberWithInt:nextNumber]];
        }
    }
    NSLog(@"The Fibonacci series at index %i is: \n%@", lastIndex, fibonnaci);
}

//MARK : Odd or even numbers
-(void)checkIfNumberIsEvenOrOdd:(int)number {
    
    if (number % 2 == 0) {
        NSLog(@"%i is an even number", number);
    } else {
        NSLog(@"%i is an odd number", number);
    }
}

//MARK: Factorial
-(int)findTheFactorialOf:(int)number {
    
    if (number == 0) {
        return 1;
    } else {
        int factorial = number * [self findTheFactorialOf:number - 1];
        return factorial;
    }
}

//MARK: Binary Search
-(void)performBinarySearchOn:(NSArray*)sortedArray toLookFor:(NSNumber*)numberToLookFor {
    
    if (sortedArray.count > 0) {
        
        int startPosition = 0;
        int endPosition = (int)sortedArray.count - 1;
        
        while (startPosition <= endPosition) {
            
            int middlePosition = ((startPosition + endPosition) / 2);
            NSNumber *middlePositionValue = [sortedArray objectAtIndex:middlePosition];
            
            if (numberToLookFor > middlePositionValue) {
                startPosition = middlePosition + 1;
            } else if (numberToLookFor < middlePositionValue) {
                endPosition = middlePosition - 1;
            } else {
                NSLog(@"The position of %@ is at index %i", numberToLookFor, middlePosition);
                break;
            }
        }
    }
}

//MARK: Linear search
-(void)performLinearSearchOn:(NSArray*)numbersInArray toLookFor:(NSNumber*)numberToLookFor {
    
    if (numbersInArray.count > 0) {
        
        for (int i = 0; i < numbersInArray.count; i++) {
            
            NSNumber *numberAtIndex = [numbersInArray objectAtIndex:i];
            
            if ([numberAtIndex isEqualToNumber:numberToLookFor]) {
                NSLog(@"The number %@ is at index %i", numberToLookFor, i);
            }
        }
    }
}





@end
