import { motion } from "motion/react";
import { Home, Search } from "lucide-react";
import { Link } from "react-router";

export function NotFound() {
  return (
    <div className="min-h-screen bg-gradient-to-br from-purple-600 via-blue-600 to-indigo-700 flex items-center justify-center px-4">
      <motion.div
        initial={{ opacity: 0, scale: 0.8 }}
        animate={{ opacity: 1, scale: 1 }}
        transition={{ duration: 0.5 }}
        className="text-center text-white"
      >
        <motion.div
          animate={{ 
            y: [0, -20, 0],
            rotate: [0, 5, -5, 0]
          }}
          transition={{ 
            duration: 3, 
            repeat: Infinity,
            ease: "easeInOut"
          }}
        >
          <Search className="h-32 w-32 mx-auto mb-8 opacity-50" />
        </motion.div>
        
        <h1 className="text-8xl font-bold mb-4">404</h1>
        <h2 className="text-3xl font-bold mb-4">Page Not Found</h2>
        <p className="text-xl text-white/90 mb-8">
          Oops! The page you're looking for doesn't exist.
        </p>
        
        <Link to="/">
          <motion.button
            whileHover={{ scale: 1.05 }}
            whileTap={{ scale: 0.95 }}
            className="bg-white text-purple-600 px-8 py-3 rounded-full font-semibold flex items-center gap-2 mx-auto shadow-lg hover:shadow-xl transition-shadow"
          >
            <Home className="h-5 w-5" />
            Back to Home
          </motion.button>
        </Link>
      </motion.div>
    </div>
  );
}
