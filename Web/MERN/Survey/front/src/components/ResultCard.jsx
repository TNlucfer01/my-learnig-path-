import React from 'react';
import { Trophy, RotateCcw, CheckCircle, XCircle } from 'lucide-react';

/**
 * Result Card Component
 * Displays quiz results with score and performance summary
 * @param {number} score - Percentage score
 * @param {number} correctAnswers - Number of correct answers
 * @param {number} totalQuestions - Total number of questions
 * @param {Function} onRetake - Callback to retake quiz
 */
const ResultCard = ({ score, correctAnswers, totalQuestions, onRetake }) => {
  // Determine performance level
  const getPerformanceMessage = () => {
    if (score >= 80) return { message: 'Excellent!', color: 'text-green-600', emoji: '🎉' };
    if (score >= 60) return { message: 'Good Job!', color: 'text-blue-600', emoji: '👍' };
    if (score >= 40) return { message: 'Keep Practicing!', color: 'text-yellow-600', emoji: '📚' };
    return { message: 'Need Improvement', color: 'text-red-600', emoji: '💪' };
  };

  const performance = getPerformanceMessage();

  return (
    <div className="min-h-screen bg-gradient-to-br from-blue-50 to-indigo-100 flex items-center justify-center p-4">
      <div className="bg-white rounded-2xl shadow-2xl p-8 max-w-md w-full text-center">
        {/* Trophy Icon */}
        <div className="flex justify-center mb-6">
          <div className="bg-gradient-to-br from-yellow-400 to-yellow-600 rounded-full p-6">
            <Trophy className="w-16 h-16 text-white" />
          </div>
        </div>

        {/* Performance Message */}
        <h2 className={`text-3xl font-bold mb-2 ${performance.color}`}>
          {performance.message} {performance.emoji}
        </h2>

        {/* Score Display */}
        <div className="my-8">
          <div className="text-6xl font-bold text-gray-800 mb-2">
            {score}%
          </div>
          <p className="text-gray-600 text-lg">Your Score</p>
        </div>

        {/* Statistics */}
        <div className="grid grid-cols-2 gap-4 mb-8">
          <div className="bg-green-50 rounded-lg p-4">
            <CheckCircle className="w-8 h-8 text-green-600 mx-auto mb-2" />
            <div className="text-2xl font-bold text-green-700">{correctAnswers}</div>
            <div className="text-sm text-gray-600">Correct</div>
          </div>
          <div className="bg-red-50 rounded-lg p-4">
            <XCircle className="w-8 h-8 text-red-600 mx-auto mb-2" />
            <div className="text-2xl font-bold text-red-700">
              {totalQuestions - correctAnswers}
            </div>
            <div className="text-sm text-gray-600">Incorrect</div>
          </div>
        </div>

        {/* Retake Button */}
        <button
          onClick={onRetake}
          className="w-full bg-gradient-to-r from-blue-600 to-indigo-600 text-white py-4 rounded-lg font-semibold hover:from-blue-700 hover:to-indigo-700 transition-all duration-200 flex items-center justify-center gap-2 shadow-lg"
        >
          <RotateCcw className="w-5 h-5" />
          Take Another Quiz
        </button>
      </div>
    </div>
  );
};

export default ResultCard;