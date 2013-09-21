//
//  QuizQuestion.m
//  SpriteKitTest
//
//  Created by Meagan Matthews on 21/09/2013.
//  Copyright (c) 2013 Fiachra Matthews. All rights reserved.
//

#import "QuizQuestion.h"

@implementation QuizQuestion

-(id) initWithQuestion:(QuestionType)qt Note:(NoteQuestions)nq andKey:(KeyQuestions)kq
{
    _letters = [[NSMutableArray alloc] initWithObjects:@"A",@"B",@"C",@"D",@"E",@"F",@"G", nil];
    _clefs = [[NSMutableArray alloc] initWithObjects:@"treble",@"bass", nil];
    _times = [[NSMutableArray alloc] initWithObjects:@"1",@"2",@"4",@"8", nil];
    _tones = [[NSMutableArray alloc] initWithObjects:@"Major",@"Minor", nil];
    
    switch (qt) {
        case QT_KEYS_ONLY:
        {
            [self generateKeyQuestion:kq];
            break;
        }
        case QT_NOTES_ONLY:
        {
            [self generateNoteQuestion:nq];
            break;
        }
        case QT_BOTH:
        {
            if([self randomValueBetween:0 and:1] == 0)
            {
                [self generateKeyQuestion:kq];
            }
            else
            {
                [self generateNoteQuestion:nq];
            }
            break;
        }
            
        default:
            break;
    }
    
    return self;
}


- (void) generateNoteQuestion:(NoteQuestions)nq
{
    switch (nq) {
        case NQ_NON_LEDGER:
        {
            break;
        }
        case NQ_LEDGER_ONLY:
        {
            break;
        }
        case NQ_BOTH:
        {
            break;
        }
            
        default:
            break;
    }

}

- (void) generateKeyQuestion:(KeyQuestions)kq
{
    switch (kq) {
        case KQ_MAJOR_ONLY:
        {
            break;
        }
        case KQ_MINOR_ONLY:
        {
            break;
        }
        case KQ_BOTH:
        {
            break;
        }
        default:
            break;
    }
    
}

- (NSInteger)randomValueBetween:(NSInteger)min and:(NSInteger)max {
    return (NSInteger)(min + arc4random_uniform(max - min + 1));
}

@end
