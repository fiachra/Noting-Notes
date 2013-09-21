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
    NSInteger letterChoice = [self randomValueBetween:0 and:5];
    NSInteger timeChoice = [self randomValueBetween:0 and:3];
    self.AnswerLetter = self.letters[letterChoice];
    [self.letters removeObject:self.AnswerLetter];
    
                            
    switch (nq) {
        case NQ_TREBLE_CLEF:
        {
            _QuestionImageLocation = [NSString stringWithFormat:@"%@%@-Natural-Middle-%@",
                                     _clefs[0], _AnswerLetter, _times[timeChoice]];
            break;
        }
        case NQ_BASS_CLEF:
        {
            _QuestionImageLocation = [NSString stringWithFormat:@"%@%@-Natural-Middle-%@",
                                      _clefs[0], _AnswerLetter, _times[timeChoice]];
            break;
        }
        case NQ_BOTH:
        {
            NSInteger clefChoice = [self randomValueBetween:0 and:1];
            _QuestionImageLocation = [NSString stringWithFormat:@"%@%@-Natural-Middle-%@",
                                      _clefs[clefChoice], _AnswerLetter, _times[timeChoice]];
            break;
        }
            
        default:
            break;
    }
    [self CompleteAnswerOptions];

}

- (void) generateKeyQuestion:(KeyQuestions)kq
{
    NSInteger letterChoice = [self randomValueBetween:0 and:6];
    self.AnswerLetter = self.letters[letterChoice];
    [self.letters removeObject:self.AnswerLetter];
    
    switch (kq) {
        case KQ_MAJOR_ONLY:
        {
            _QuestionImageLocation = [NSString stringWithFormat:@"Key-%@-%@-%@",
                                      _clefs[0], _AnswerLetter, _tones[0]];
            break;
        }
        case KQ_MINOR_ONLY:
        {
            _QuestionImageLocation = [NSString stringWithFormat:@"Key-%@-%@-%@",
                                      _clefs[0], _AnswerLetter, _tones[1]];
            break;
        }
        case KQ_BOTH:
        {
            NSInteger toneChoice = [self randomValueBetween:0 and:1];
            _QuestionImageLocation = [NSString stringWithFormat:@"Key-%@-%@-%@",
                                      _clefs[0], _AnswerLetter, _tones[toneChoice]];
            break;
        }
        default:
            break;
    }
    [self CompleteAnswerOptions];
    
}

- (void) CompleteAnswerOptions
{
    _CorrectAnswerIndex = [self randomValueBetween:0 and:2];
    _AnswerOptions = [[NSMutableArray alloc] init];
    
    for (NSUInteger i=0; i<3; i++) {
        
        if(i == _CorrectAnswerIndex)
        {
            [_AnswerOptions insertObject:[NSString stringWithFormat:@"%@", _AnswerLetter] atIndex:i];
        }
        else
        {
            NSInteger incorrectChoice = [self randomValueBetween:0 and:_letters.count];
            NSString *incorrectChoiceLetter = _letters[incorrectChoice];
            [_AnswerOptions insertObject:[NSString stringWithFormat:@"%@", incorrectChoiceLetter] atIndex:i];
            [_letters removeObject:incorrectChoiceLetter];
        }
    }
    
    NSLog(@"%@",_QuestionImageLocation);
}

- (NSInteger)randomValueBetween:(NSInteger)min and:(NSInteger)max {
    return (NSInteger)(min + arc4random_uniform(max - min + 1));
}

@end
