/**
 * API Service
 * Handles all HTTP requests to the backend server
 */

const API_BASE_URL = 'http://localhost:5000/api';

/**
 * Fetch 5 random questions from the server
 * @returns {Promise<Array>} Array of question objects
 */
export const fetchRandomQuestions = async () => {
  try {
    const response = await fetch(`${API_BASE_URL}/questions/random`);
    
    if (!response.ok) {
      throw new Error('Failed to fetch questions');
    }
    
    const data = await response.json();
    return data.data;
  } catch (error) {
    console.error('Error fetching questions:', error);
    throw error;
  }
};

/**
 * Submit quiz answers to the server for evaluation
 * @param {Array} answers - Array of {questionId, selectedAnswer} objects
 * @returns {Promise<Object>} Result object with score and detailed results
 */
export const submitQuizAnswers = async (answers) => {
  try {
    const response = await fetch(`${API_BASE_URL}/questions/submit`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ answers }),
    });
    
    if (!response.ok) {
      throw new Error('Failed to submit answers');
    }
    
    const data = await response.json();
    return data;
  } catch (error) {
    console.error('Error submitting answers:', error);
    throw error;
  }
};