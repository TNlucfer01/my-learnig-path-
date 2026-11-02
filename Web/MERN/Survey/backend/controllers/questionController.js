
import Question from '../models/Question.js';

/**
 * Controller for handling question-related operations
 * Contains business logic separated from route handlers
 */

/**
 * @desc    Get random 5 questions for quiz
 * @route   GET /api/questions/random
 * @access  Public
 */
export const getRandomQuestions = async (req, res) => {
  try {
    // Aggregate pipeline to get 5 random questions
    const questions = await Question.aggregate([
      { $sample: { size: 5 } }, // MongoDB's efficient random sampling
    ]);

    if (questions.length === 0) {
      return res.status(404).json({
        success: false,
        message: 'No questions found in database',
      });
    }

    // Return questions without exposing correct answers initially
    const questionsWithoutAnswers = questions.map(q => ({
      _id: q._id,
      question: q.question,
      options: q.options,
      category: q.category,
      difficulty: q.difficulty,
    }));

    res.status(200).json({
      success: true,
      count: questionsWithoutAnswers.length,
      data: questionsWithoutAnswers,
    });
  } catch (error) {
    console.error('Error fetching random questions:', error);
    res.status(500).json({
      success: false,
      message: 'Server error while fetching questions',
      error: error.message,
    });
  }
};

/**
 * @desc    Submit quiz answers and get results
 * @route   POST /api/questions/submit
 * @access  Public
 */
export const submitQuizAnswers = async (req, res) => {
  try {
    const { answers } = req.body; // Array of {questionId, selectedAnswer}

    if (!answers || !Array.isArray(answers)) {
      return res.status(400).json({
        success: false,
        message: 'Invalid answers format. Expected array of answers.',
      });
    }

    // Extract question IDs from submitted answers
    const questionIds = answers.map(a => a.questionId);

    // Fetch correct answers from database
    const questions = await Question.find({ _id: { $in: questionIds } });

    if (questions.length !== answers.length) {
      return res.status(400).json({
        success: false,
        message: 'Some questions not found in database',
      });
    }

    // Calculate score and prepare detailed results
    let correctCount = 0;
    const results = answers.map(userAnswer => {
      const question = questions.find(
        q => q._id.toString() === userAnswer.questionId
      );

      const isCorrect = question.correctAnswer === userAnswer.selectedAnswer;
      if (isCorrect) correctCount++;

      return {
        questionId: question._id,
        question: question.question,
        options: question.options,
        userAnswer: userAnswer.selectedAnswer,
        correctAnswer: question.correctAnswer,
        isCorrect,
        category: question.category,
      };
    });

    const score = (correctCount / answers.length) * 100;

    res.status(200).json({
      success: true,
      score: Math.round(score),
      correctAnswers: correctCount,
      totalQuestions: answers.length,
      results,
    });
  } catch (error) {
    console.error('Error submitting quiz answers:', error);
    res.status(500).json({
      success: false,
      message: 'Server error while processing answers',
      error: error.message,
    });
  }
};

/**
 * @desc    Get all questions (for admin purposes)
 * @route   GET /api/questions
 * @access  Public
 */
export const getAllQuestions = async (req, res) => {
  try {
    const questions = await Question.find().sort({ createdAt: -1 });

    res.status(200).json({
      success: true,
      count: questions.length,
      data: questions,
    });
  } catch (error) {
    console.error('Error fetching all questions:', error);
    res.status(500).json({
      success: false,
      message: 'Server error while fetching questions',
      error: error.message,
    });
  }
};

/**
 * @desc    Create new question
 * @route   POST /api/questions
 * @access  Public
 */
export const createQuestion = async (req, res) => {
  try {
    const question = await Question.create(req.body);

    res.status(201).json({
      success: true,
      message: 'Question created successfully',
      data: question,
    });
  } catch (error) {
    console.error('Error creating question:', error);
    res.status(400).json({
      success: false,
      message: 'Error creating question',
      error: error.message,
    });
  }
};