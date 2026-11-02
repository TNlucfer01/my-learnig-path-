import mongoose from 'mongoose';
import dotenv from 'dotenv';
import Question from './models/Question.js';
import connectDatabase from './config/database.js';

dotenv.config();

/**
 * Sample questions to populate the database
 * Add more questions as needed for variety
 */
const sampleQuestions = [
  {
    question: 'What is the capital of France?',
    options: ['London', 'Berlin', 'Paris', 'Madrid'],
    correctAnswer: 2,
    category: 'Geography',
    difficulty: 'Easy',
  },
  {
    question: 'Which planet is known as the Red Planet?',
    options: ['Venus', 'Mars', 'Jupiter', 'Saturn'],
    correctAnswer: 1,
    category: 'Science',
    difficulty: 'Easy',
  },
  {
    question: 'What is the largest ocean on Earth?',
    options: ['Atlantic Ocean', 'Indian Ocean', 'Arctic Ocean', 'Pacific Ocean'],
    correctAnswer: 3,
    category: 'Geography',
    difficulty: 'Medium',
  },
  {
    question: 'Who wrote the play "Romeo and Juliet"?',
    options: ['Charles Dickens', 'William Shakespeare', 'Jane Austen', 'Mark Twain'],
    correctAnswer: 1,
    category: 'General Knowledge',
    difficulty: 'Easy',
  },
  {
    question: 'What is the speed of light in vacuum?',
    options: ['300,000 km/s', '150,000 km/s', '450,000 km/s', '200,000 km/s'],
    correctAnswer: 0,
    category: 'Science',
    difficulty: 'Medium',
  },
  {
    question: 'In which year did World War II end?',
    options: ['1943', '1944', '1945', '1946'],
    correctAnswer: 2,
    category: 'History',
    difficulty: 'Medium',
  },
  {
    question: 'What is the square root of 144?',
    options: ['10', '11', '12', '13'],
    correctAnswer: 2,
    category: 'Mathematics',
    difficulty: 'Easy',
  },
  {
    question: 'Which programming language is known as the "language of the web"?',
    options: ['Python', 'JavaScript', 'Java', 'C++'],
    correctAnswer: 1,
    category: 'Technology',
    difficulty: 'Easy',
  },
  {
    question: 'What is the chemical symbol for Gold?',
    options: ['Go', 'Gd', 'Au', 'Ag'],
    correctAnswer: 2,
    category: 'Science',
    difficulty: 'Medium',
  },
  {
    question: 'Mount Everest is located in which mountain range?',
    options: ['Andes', 'Rockies', 'Alps', 'Himalayas'],
    correctAnswer: 3,
    category: 'Geography',
    difficulty: 'Easy',
  },
  {
    question: 'What is the value of Pi (π) up to two decimal places?',
    options: ['3.12', '3.14', '3.16', '3.18'],
    correctAnswer: 1,
    category: 'Mathematics',
    difficulty: 'Easy',
  },
  {
    question: 'Who painted the Mona Lisa?',
    options: ['Vincent van Gogh', 'Pablo Picasso', 'Leonardo da Vinci', 'Michelangelo'],
    correctAnswer: 2,
    category: 'General Knowledge',
    difficulty: 'Easy',
  },
  {
    question: 'What does HTTP stand for?',
    options: [
      'HyperText Transfer Protocol',
      'HighText Transfer Protocol',
      'HyperText Transmission Protocol',
      'HighText Transmission Protocol',
    ],
    correctAnswer: 0,
    category: 'Technology',
    difficulty: 'Medium',
  },
  {
    question: 'Which element has the atomic number 1?',
    options: ['Helium', 'Hydrogen', 'Oxygen', 'Carbon'],
    correctAnswer: 1,
    category: 'Science',
    difficulty: 'Easy',
  },
  {
    question: 'In which year did India gain independence?',
    options: ['1945', '1946', '1947', '1948'],
    correctAnswer: 2,
    category: 'History',
    difficulty: 'Easy',
  },
];

/**
 * Seed the database with sample questions
 */
const seedDatabase = async () => {
  try {
    // Connect to database
    await connectDatabase();

    // Clear existing questions
    await Question.deleteMany({});
    console.log('Existing questions cleared');

    // Insert sample questions
    await Question.insertMany(sampleQuestions);
    console.log(`${sampleQuestions.length} questions added successfully`);

    console.log('Database seeding completed!');
    process.exit(0);
  } catch (error) {
    console.error('Error seeding database:', error);
    process.exit(1);
  }
};

// Run the seed function
seedDatabase();