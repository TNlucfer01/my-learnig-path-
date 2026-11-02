import express from 'express';
import {
  getRandomQuestions,
  submitQuizAnswers,
  getAllQuestions,
  createQuestion,
} from '../controllers/questionController.js';

const router = express.Router();

/**
 * Question Routes
 * Defines API endpoints for question operations
 */

// Get 5 random questions for quiz
router.get('/random', getRandomQuestions);

// Submit quiz answers and get results
router.post('/submit', submitQuizAnswers);

// Get all questions (admin/testing purposes)
router.get('/', getAllQuestions);

// Create new question
router.post('/', createQuestion);

export default router;