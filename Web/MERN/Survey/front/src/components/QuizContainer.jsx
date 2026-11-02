import React, { useState, useEffect } from 'react';
import { fetchRandomQuestions, submitQuizAnswers } from '../services/Api';
import QuestionCard from './QuestionCard';
import ResultCard from './ResultCard';
import LoadingSpinner from './LoadingSpinner';
import { AlertCircle, Send } from 'lucide-react';

/**
 * Quiz Container Component
 * Main component that manages quiz state and logic
 */
const QuizContainer = () => {
  const [questions, setQuestions] = useState([]);
  const [userAnswers, setUserAnswers] = useState({});
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [quizSubmitted, setQuizSubmitted] = useState(false);
  const [results, setResults] = useState(null);

  /**
   * Load questions when component mounts
   */
  useEffect(() => {
    loadQuestions();
  }, []);

  /**
   * Fetch questions from API
   */
  const loadQuestions = async () => {
    try {
      setLoading(true);
      setError(null);
      const data = await fetchRandomQuestions();
      setQuestions(data);
      setUserAnswers({});
      setQuizSubmitted(false);
      setResults(null);
    } catch (err) {
      setError('Failed to load questions. Please try again.');
      console.error('Error loading questions:', err);
    } finally {
      setLoading(false);
    }
  };

  /**
   * Handle answer selection for a question
   * @param {string} questionId - ID of the question
   * @param {number} answerIndex - Index of selected answer
   */
  const handleAnswerSelect = (questionId, answerIndex) => {
    setUserAnswers(prev => ({
      ...prev,
      [questionId]: answerIndex,
    }));
  };

  /**
   * Submit quiz answers for evaluation
   */
  const handleSubmitQuiz = async () => {
    // Validate all questions are answered
    if (Object.keys(userAnswers).length !== questions.length) {
      alert('Please answer all questions before submitting!');
      return;
    }

    try {
      setLoading(true);
      
      // Format answers for API
      const formattedAnswers = questions.map(q => ({
        questionId: q._id,
        selectedAnswer: userAnswers[q._id],
      }));

      // Submit to backend
      const result = await submitQuizAnswers(formattedAnswers);
      
      // Update questions with correct answers
      const updatedQuestions = questions.map(q => {
        const resultItem = result.results.find(r => r.questionId === q._id);
        return {
          ...q,
          correctAnswer: resultItem.correctAnswer,
        };
      });

      setQuestions(updatedQuestions);
      setResults(result);
      setQuizSubmitted(true);
    } catch (err) {
      setError('Failed to submit quiz. Please try again.');
      console.error('Error submitting quiz:', err);
    } finally {
      setLoading(false);
    }
  };

  /**
   * Calculate progress percentage
   */
  const progressPercentage = (Object.keys(userAnswers).length / questions.length) * 100;

  // Show loading spinner
  if (loading && questions.length === 0) {
    return <LoadingSpinner />;
  }

  // Show error state
  if (error && questions.length === 0) {
    return (
      <div className="min-h-screen bg-gradient-to-br from-blue-50 to-indigo-100 flex items-center justify-center p-4">
        <div className="bg-white rounded-xl shadow-lg p-8 max-w-md text-center">
          <AlertCircle className="w-16 h-16 text-red-500 mx-auto mb-4" />
          <h2 className="text-2xl font-bold text-gray-800 mb-2">Oops!</h2>
<p className="text-gray-600 mb-6">{error}</p>
          <button
            onClick={loadQuestions}
            className="bg-blue-600 text-white px-6 py-3 rounded-lg font-semibold hover:bg-blue-700 transition-colors"
          >
            Try Again
          </button>
        </div>
      </div>
    );
  }

  // Show results screen after submission
  if (quizSubmitted && results) {
    return (
      <ResultCard
        score={results.score}
        correctAnswers={results.correctAnswers}
        totalQuestions={results.totalQuestions}
        onRetake={loadQuestions}
      />
    );
  }

  // Main quiz interface
  return (
    <div className="min-h-screen bg-gradient-to-br from-blue-50 to-indigo-100 py-8 px-4">
      <div className="max-w-3xl mx-auto">
        {/* Header */}
        <div className="bg-white rounded-xl shadow-lg p-6 mb-6">
          <h1 className="text-3xl font-bold text-gray-800 mb-2 text-center">
            Quiz Application
          </h1>
          <p className="text-gray-600 text-center mb-4">
            Answer all 5 questions and submit to see your results
          </p>
          
          {/* Progress Bar */}
          <div className="w-full bg-gray-200 rounded-full h-3 overflow-hidden">
            <div
              className="bg-gradient-to-r from-blue-600 to-indigo-600 h-full transition-all duration-300"
              style={{ width: `${progressPercentage}%` }}
            />
          </div>
          <p className="text-sm text-gray-600 text-center mt-2">
            {Object.keys(userAnswers).length} of {questions.length} questions answered
          </p>
        </div>

        {/* Questions List */}
        {questions.map((question, index) => (
          <QuestionCard
            key={question._id}
            question={question}
            questionNumber={index + 1}
            selectedAnswer={userAnswers[question._id]}
            onAnswerSelect={(answerIndex) => handleAnswerSelect(question._id, answerIndex)}
            showResult={quizSubmitted}
          />
        ))}

        {/* Submit Button */}
        {!quizSubmitted && (
          <div className="sticky bottom-6 mt-8">
            <button
              onClick={handleSubmitQuiz}
              disabled={Object.keys(userAnswers).length !== questions.length || loading}
              className={`w-full py-4 rounded-xl font-bold text-white text-lg flex items-center justify-center gap-2 shadow-xl transition-all duration-200 ${
                Object.keys(userAnswers).length === questions.length && !loading
                  ? 'bg-gradient-to-r from-green-600 to-emerald-600 hover:from-green-700 hover:to-emerald-700 cursor-pointer'
                  : 'bg-gray-400 cursor-not-allowed'
              }`}
            >
              <Send className="w-5 h-5" />
              {loading ? 'Submitting...' : 'Submit Quiz'}
            </button>
          </div>
        )}

        {/* Show detailed results after submission */}
        {quizSubmitted && (
          <div className="mt-8 bg-white rounded-xl shadow-lg p-6">
            <h2 className="text-2xl font-bold text-gray-800 mb-4 text-center">
              Review Your Answers
            </h2>
            <p className="text-center text-gray-600 mb-6">
              Scroll up to see which answers were correct
            </p>
            <button
              onClick={loadQuestions}
              className="w-full bg-blue-600 text-white py-3 rounded-lg font-semibold hover:bg-blue-700 transition-colors"
            >
              Start New Quiz
            </button>
          </div>
        )}
      </div>
    </div>
  );
};

export default QuizContainer;