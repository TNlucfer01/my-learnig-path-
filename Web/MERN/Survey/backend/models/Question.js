import mongoose from 'mongoose';

/**
 * Question Schema Definition
 * Defines the structure for quiz questions in MongoDB
 */
const questionSchema = new mongoose.Schema(
  {
    question: {
      type: String,
      required: [true, 'Question text is required'],
      trim: true,
      minlength: [10, 'Question must be at least 10 characters long'],
    },
    options: {
      type: [String],
      required: [true, 'Options are required'],
      validate: {
        validator: function(arr) {
          return arr.length === 4; // Ensure exactly 4 options
        },
        message: 'Each question must have exactly 4 options',
      },
    },
    correctAnswer: {
      type: Number,
      required: [true, 'Correct answer index is required'],
      min: [0, 'Answer index must be between 0 and 3'],
      max: [3, 'Answer index must be between 0 and 3'],
    },
    category: {
      type: String,
      required: [true, 'Category is required'],
      trim: true,
      enum: ['Science', 'Technology', 'Mathematics', 'General Knowledge', 'History', 'Geography'],
    },
    difficulty: {
      type: String,
      enum: ['Easy', 'Medium', 'Hard'],
      default: 'Medium',
    },
  },
  {
    timestamps: true, // Automatically adds createdAt and updatedAt fields
  }
);

// Create indexes for better query performance
questionSchema.index({ category: 1 });
questionSchema.index({ difficulty: 1 });

const Question = mongoose.model('Question', questionSchema);

export default Question;
