import React, { useState } from 'react';
import { motion, AnimatePresence } from 'motion/react';
import { Navbar } from './components/Navbar';
import { Hero } from './components/Hero';
import { Showroom } from './pages/Showroom';
import { Catalog } from './pages/Catalog';
import { Protocols } from './pages/Protocols';
import { Origin } from './pages/Origin';

export default function App() {
  const [activeTab, setActiveTab] = useState('showroom');

  const renderPage = () => {
    switch (activeTab) {
      case 'showroom':
        return (
          <div key="showroom">
            <Hero onExplore={() => setActiveTab('catalog')} />
            <Showroom onNavigate={setActiveTab} />
          </div>
        );
      case 'catalog':
        return <Catalog key="catalog" />;
      case 'origin':
        return <Origin key="origin" />;
      case 'protocols':
        return <Protocols key="protocols" />;
      default:
        return <Hero onExplore={() => setActiveTab('catalog')} />;
    }
  };

  return (
    <div className="min-h-screen bg-background selection:bg-primary selection:text-on-primary">
      <Navbar activeTab={activeTab} setActiveTab={setActiveTab} />
      
      <main>
        <AnimatePresence mode="wait">
          <motion.div
            key={activeTab}
            initial={{ opacity: 0, y: 10 }}
            animate={{ opacity: 1, y: 0 }}
            exit={{ opacity: 0, y: -10 }}
            transition={{ duration: 0.4, ease: "easeInOut" }}
          >
            {renderPage()}
          </motion.div>
        </AnimatePresence>
      </main>

      <footer className="bg-surface-container border-t border-neutral-800 py-20">
        <div className="max-w-7xl mx-auto px-6">
          <div className="grid grid-cols-1 md:grid-cols-4 gap-12 mb-16">
            <div className="md:col-span-2">
              <div className="flex items-center gap-2 mb-6">
                <div className="w-8 h-8 monolith-gradient rounded flex items-center justify-center">
                  <span className="font-bold text-on-primary text-xs">NM</span>
                </div>
                <span className="font-headline font-bold text-lg tracking-tighter">NEON MONOLITH</span>
              </div>
              <p className="text-on-surface/40 text-sm max-w-sm leading-relaxed">
                The pinnacle of hardware engineering. Forged in the fires of innovation, designed for the architects of the future.
              </p>
            </div>
            
            <div>
              <h4 className="text-[10px] font-bold tracking-[0.3em] text-primary mb-6 uppercase">PROTOCOLS</h4>
              <ul className="space-y-4 text-sm text-on-surface/60">
                <li className="hover:text-primary cursor-pointer transition-colors">Support Center</li>
                <li className="hover:text-primary cursor-pointer transition-colors">Custom Builds</li>
                <li className="hover:text-primary cursor-pointer transition-colors">Warranty Registry</li>
                <li className="hover:text-primary cursor-pointer transition-colors">Secure Shipping</li>
              </ul>
            </div>

            <div>
              <h4 className="text-[10px] font-bold tracking-[0.3em] text-primary mb-6 uppercase">LEGAL</h4>
              <ul className="space-y-4 text-sm text-on-surface/60">
                <li className="hover:text-primary cursor-pointer transition-colors">Privacy Policy</li>
                <li className="hover:text-primary cursor-pointer transition-colors">Terms of Access</li>
                <li className="hover:text-primary cursor-pointer transition-colors">Cookie Protocol</li>
              </ul>
            </div>
          </div>
          
          <div className="pt-8 border-t border-neutral-800 flex flex-col md:flex-row justify-between items-center gap-4">
            <p className="text-[10px] font-bold tracking-widest text-on-surface/20 uppercase">
              © 2024 NEON MONOLITH. ALL RIGHTS RESERVED.
            </p>
            <div className="flex gap-6">
              <span className="text-[10px] font-bold tracking-widest text-on-surface/20 hover:text-primary cursor-pointer transition-colors">INSTAGRAM</span>
              <span className="text-[10px] font-bold tracking-widest text-on-surface/20 hover:text-primary cursor-pointer transition-colors">X / TWITTER</span>
              <span className="text-[10px] font-bold tracking-widest text-on-surface/20 hover:text-primary cursor-pointer transition-colors">LINKEDIN</span>
            </div>
          </div>
        </div>
      </footer>
    </div>
  );
}
