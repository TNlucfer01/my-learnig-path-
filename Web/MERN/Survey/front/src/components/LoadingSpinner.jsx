import React from 'react';
import { Loader2 } from 'lucide-react';

/**
 * Loading Spinner Component
 * Displays a loading indicator while data is being fetched
 */
const LoadingSpinner = () => {
  return (
    <div className="flex flex-col items-center justify-center min-h-screen bg-gradient-to-br from-blue-50 to-indigo-100">
      <Loader2 className="w-16 h-16 text-blue-600 animate-spin" />
      <p className="mt-4 text-lg text-gray-700 font-medium">Loading questions...</p>
    </div>
  );
};
export default LoadingSpinner;