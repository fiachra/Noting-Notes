//
//  QuizQuestion.h
//  SpriteKitTest
//
//  Created by Meagan Matthews on 21/09/2013.
//  Copyright (c) 2013 Fiachra Matthews. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, KeyQuestions) {
    KQ_MAJOR_ONLY,
    KQ_MINOR_ONLY,
    KQ_BOTH
};

typedef NS_ENUM(NSUInteger, NoteQuestions) {
    NQ_TREBLE_CLEF,
    NQ_BASS_CLEF,
    NQ_BOTH
};

typedef NS_ENUM(NSUInteger, QuestionType) {
    QT_NOTES_ONLY,
    QT_KEYS_ONLY,
    QT_BOTH
};


@interface QuizQuestion : NSObject

-(id) initWithQuestion:(QuestionType)qt Note:(NoteQuestions)nq andKey:(KeyQuestions)kq;

@property (strong, nonatomic) NSMutableArray *letters;
@property (strong, nonatomic) NSMutableArray *clefs;
@property (strong, nonatomic) NSMutableArray *times;
@property (strong, nonatomic) NSMutableArray *tones;

@property (strong, nonatomic) NSString *QuestionImageLocation;
@property (strong, nonatomic) NSString *AnswerLetter;

@property (nonatomic) NSInteger CorrectAnswerIndex;
@property (strong, nonatomic) NSMutableArray *AnswerOptions;



@end
