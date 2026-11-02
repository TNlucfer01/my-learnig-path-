import React, { useState, useEffect } from 'react';
import { Link, useLocation } from 'react-router-dom';
import { Search, ShoppingBag, User, Menu, X, ArrowRight } from 'lucide-react';
import { motion, AnimatePresence } from 'motion/react';

export const Navbar: React.FC = () => {
  const [isScrolled, setIsScrolled] = useState(false);
  const [isMenuOpen, setIsMenuOpen] = useState(false);
  const location = useLocation();

  useEffect(() => {
    const handleScroll = () => setIsScrolled(window.scrollY > 20);
    window.addEventListener('scroll', handleScroll);
    return () => window.removeEventListener('scroll', handleScroll);
  }, []);

  return (
    <nav 
      className={`fixed top-0 left-0 right-0 z-50 transition-all duration-300 ${
        isScrolled ? 'bg-bg/80 backdrop-blur-md border-b border-line py-4' : 'bg-transparent py-6'
      }`}
    >
      <div className="max-w-7xl mx-auto px-6 flex items-center justify-between">
        <Link to="/" className="text-2xl font-bold tracking-tighter flex items-center gap-2">
          <div className="w-8 h-8 bg-ink flex items-center justify-center">
            <div className="w-4 h-4 bg-bg rotate-45" />
          </div>
          ELECTRA
        </Link>

        {/* Desktop Nav */}
        <div className="hidden md:flex items-center gap-8">
          {['Laptops', 'Monitors', 'Peripherals', 'Audio'].map((item) => (
            <Link 
              key={item} 
              to={`/category/${item.toLowerCase()}`}
              className="text-sm font-medium hover:opacity-60 transition-opacity"
            >
              {item}
            </Link>
          ))}
        </div>

        <div className="flex items-center gap-6">
          <button className="hover:opacity-60 transition-opacity">
            <Search size={20} />
          </button>
          <Link to="/cart" className="hover:opacity-60 transition-opacity relative">
            <ShoppingBag size={20} />
            <span className="absolute -top-1 -right-1 bg-ink text-bg text-[10px] w-4 h-4 rounded-full flex items-center justify-center font-bold">
              2
            </span>
          </Link>
          <Link to="/dashboard" className="hover:opacity-60 transition-opacity">
            <User size={20} />
          </Link>
          <button 
            className="md:hidden hover:opacity-60 transition-opacity"
            onClick={() => setIsMenuOpen(!isMenuOpen)}
          >
            {isMenuOpen ? <X size={24} /> : <Menu size={24} />}
          </button>
        </div>
      </div>

      {/* Mobile Menu */}
      <AnimatePresence>
        {isMenuOpen && (
          <motion.div
            initial={{ opacity: 0, y: -20 }}
            animate={{ opacity: 1, y: 0 }}
            exit={{ opacity: 0, y: -20 }}
            className="absolute top-full left-0 right-0 bg-bg border-b border-line p-6 md:hidden"
          >
            <div className="flex flex-col gap-6">
              {['Laptops', 'Monitors', 'Peripherals', 'Audio'].map((item) => (
                <Link 
                  key={item} 
                  to={`/category/${item.toLowerCase()}`}
                  className="text-lg font-medium flex items-center justify-between"
                  onClick={() => setIsMenuOpen(false)}
                >
                  {item}
                  <ArrowRight size={16} />
                </Link>
              ))}
            </div>
          </motion.div>
        )}
      </AnimatePresence>
    </nav>
  );
};

export const Footer: React.FC = () => {
  return (
    <footer className="bg-ink text-bg pt-20 pb-10 mt-20">
      <div className="max-w-7xl mx-auto px-6">
        <div className="grid grid-cols-1 md:grid-cols-4 gap-12 mb-20">
          <div className="col-span-1 md:col-span-2">
            <Link to="/" className="text-3xl font-bold tracking-tighter mb-6 block">
              ELECTRA
            </Link>
            <p className="text-bg/60 max-w-sm mb-8">
              Precision-engineered electronics for the modern professional. 
              Designed in Zurich, shipped worldwide.
            </p>
            <div className="flex gap-4">
              {['Twitter', 'Instagram', 'LinkedIn'].map(social => (
                <a key={social} href="#" className="text-sm font-medium hover:text-bg/40 transition-colors">
                  {social}
                </a>
              ))}
            </div>
          </div>
          
          <div>
            <h4 className="font-serif italic text-lg mb-6">Shop</h4>
            <ul className="space-y-4 text-sm text-bg/60">
              <li><Link to="/category/laptops" className="hover:text-bg transition-colors">Laptops</Link></li>
              <li><Link to="/category/monitors" className="hover:text-bg transition-colors">Monitors</Link></li>
              <li><Link to="/category/peripherals" className="hover:text-bg transition-colors">Peripherals</Link></li>
              <li><Link to="/category/audio" className="hover:text-bg transition-colors">Audio</Link></li>
            </ul>
          </div>

          <div>
            <h4 className="font-serif italic text-lg mb-6">Support</h4>
            <ul className="space-y-4 text-sm text-bg/60">
              <li><Link to="/shipping" className="hover:text-bg transition-colors">Shipping</Link></li>
              <li><Link to="/returns" className="hover:text-bg transition-colors">Returns</Link></li>
              <li><Link to="/warranty" className="hover:text-bg transition-colors">Warranty</Link></li>
              <li><Link to="/contact" className="hover:text-bg transition-colors">Contact</Link></li>
            </ul>
          </div>
        </div>

        <div className="border-t border-bg/10 pt-10 flex flex-col md:flex-row justify-between items-center gap-6">
          <p className="text-xs text-bg/40">
            © 2026 ELECTRA Precision Electronics. All rights reserved.
          </p>
          <div className="flex gap-8 text-xs text-bg/40">
            <a href="#" className="hover:text-bg transition-colors">Privacy Policy</a>
            <a href="#" className="hover:text-bg transition-colors">Terms of Service</a>
          </div>
        </div>
      </div>
    </footer>
  );
};
