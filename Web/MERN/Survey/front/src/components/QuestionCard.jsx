import React from 'react';
import { CheckCircle2, XCircle } from 'lucide-react';

/**
 * Question Card Component
 * Displays a single question with multiple choice options
 * @param {Object} question - Question data
 * @param {number} questionNumber - Current question number
 * @param {number|null} selectedAnswer - User's selected answer index
 * @param {Function} onAnswerSelect - Callback when answer is selected
 * @param {boolean} showResult - Whether to show correct/incorrect indicators
 */
const QuestionCard = ({ 
  question, 
  questionNumber, 
  selectedAnswer, 
  onAnswerSelect,
  showResult = false 
}) => {
  return (
    <div className="bg-white rounded-xl shadow-lg p-8 mb-6 border border-gray-200">
      {/* Question Header */}
      <div className="flex items-start mb-6">
        <span className="bg-blue-600 text-white text-sm font-bold px-3 py-1 rounded-full mr-4">
          Q{questionNumber}
        </span>
        <div className="flex-1">
          <p className="text-lg font-semibold text-gray-800 leading-relaxed">
            {question.question}
          </p>
          <div className="flex gap-2 mt-2">
            <span className="text-xs bg-purple-100 text-purple-700 px-2 py-1 rounded">
              {question.category}
            </span>
            <span className="text-xs bg-green-100 text-green-700 px-2 py-1 rounded">
              {question.difficulty}
            </span>
          </div>
        </div>
      </div>

      {/* Answer Options */}
      <div className="space-y-3">
        {question.options.map((option, index) => {
          const isSelected = selectedAnswer === index;
          const isCorrect = showResult && question.correctAnswer === index;
          const isWrong = showResult && isSelected && !isCorrect;

          let buttonClasses = "w-full text-left p-4 rounded-lg border-2 transition-all duration-200 ";
          
          if (showResult) {
            if (isCorrect) {
              buttonClasses += "border-green-500 bg-green-50 ";
            } else if (isWrong) {
              buttonClasses += "border-red-500 bg-red-50 ";
            } else {
              buttonClasses += "border-gray-200 bg-gray-50 ";
            }
          } else {
            if (isSelected) {
              buttonClasses += "border-blue-600 bg-blue-50 ";
            } else {
              buttonClasses += "border-gray-200 hover:border-blue-400 hover:bg-blue-50 ";
            }
          }

          return (
            <button
              key={index}
              onClick={() => !showResult && onAnswerSelect(index)}
              disabled={showResult}
              className={buttonClasses}
            >
              <div className="flex items-center justify-between">
                <div className="flex items-center">
                  <span className="font-semibold text-gray-700 mr-3">
                    {String.fromCharCode(65 + index)}.
                  </span>
                  <span className="text-gray-800">{option}</span>
                </div>
                {showResult && (
                  <div>
                    {isCorrect && <CheckCircle2 className="w-6 h-6 text-green-600" />}
                    {isWrong && <XCircle className="w-6 h-6 text-red-600" />}
                  </div>
                )}
              </div>
            </button>
          );
        })}
      </div>
    </div>
  );
};

export default QuestionCard