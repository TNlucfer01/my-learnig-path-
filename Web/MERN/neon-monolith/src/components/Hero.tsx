import React from 'react';
import { motion } from 'motion/react';
import { ArrowRight } from 'lucide-react';

export const Hero: React.FC<{ onExplore: () => void }> = ({ onExplore }) => {
  return (
    <section className="relative h-screen flex items-center overflow-hidden">
      {/* Background with parallax-like effect */}
      <div className="absolute inset-0 z-0">
        <img
          src="https://lh3.googleusercontent.com/aida-public/AB6AXuAtJY0dbDnQgRAbNUpAvGa5wfKbRWF2tfiLkqhPbbxBXEjuZFYR4zfTSZzAF4gvhcHCwxxekth_5mCR6qGCybE2eSDrCYdn9u3oKXmq4LFlyEji_r8N84wKEGgkFtXSD6k3E8yMx1A16nGOcjxdTOGN3HNePt0ChrBNEHT0DfWwlbVp2spGHVF1Mq4V1yFS1riDNWASI4MkSUaj9Ww-iZa7VLQH_6qpiLSSx3N7yc-Qk9x52yfD14JpBk5uwHwjxakSPO9lr0t2gXmm"
          alt="Hero Background"
          referrerPolicy="no-referrer"
          className="w-full h-full object-cover opacity-40 scale-105"
        />
        <div className="absolute inset-0 bg-gradient-to-r from-background via-background/80 to-transparent"></div>
        <div className="absolute inset-0 bg-gradient-to-t from-background via-transparent to-transparent"></div>
      </div>

      <div className="relative z-10 max-w-7xl mx-auto px-6 w-full">
        <motion.div
          initial={{ opacity: 0, x: -50 }}
          animate={{ opacity: 1, x: 0 }}
          transition={{ duration: 0.8, ease: "easeOut" }}
          className="max-w-2xl"
        >
          <div className="flex items-center gap-3 mb-6">
            <div className="h-[1px] w-12 bg-primary"></div>
            <span className="text-xs font-bold tracking-[0.4em] text-primary uppercase">ESTABLISHED 2024</span>
          </div>
          
          <h1 className="text-6xl md:text-8xl font-bold tracking-tighter leading-[0.9] mb-8">
            BEYOND <br />
            <span className="text-glow text-primary">ACOUSTICS.</span>
          </h1>
          
          <p className="text-lg text-on-surface/70 mb-10 leading-relaxed max-w-lg">
            Experience the intersection of raw power and refined luxury. Our hardware is forged for those who demand absolute performance without compromise.
          </p>
          
          <div className="flex flex-wrap gap-4">
            <button 
              onClick={onExplore}
              className="px-8 py-4 bg-primary text-on-primary font-bold text-xs tracking-widest rounded-lg flex items-center gap-3 hover:scale-105 transition-transform shadow-xl shadow-primary/20"
            >
              ENTER SHOWROOM
              <ArrowRight className="w-4 h-4" />
            </button>
            <button className="px-8 py-4 bg-white/5 border border-white/10 backdrop-blur-md text-on-surface font-bold text-xs tracking-widest rounded-lg hover:bg-white/10 transition-colors">
              VIEW PROTOCOLS
            </button>
          </div>
        </motion.div>
      </div>

      {/* Floating Stats */}
      <div className="absolute bottom-12 right-12 hidden lg:flex gap-12">
        <div className="flex flex-col">
          <span className="text-4xl font-bold font-headline text-glow">0.1ms</span>
          <span className="text-[10px] font-bold tracking-widest text-on-surface/40 uppercase">Latency Floor</span>
        </div>
        <div className="flex flex-col">
          <span className="text-4xl font-bold font-headline text-glow">8K</span>
          <span className="text-[10px] font-bold tracking-widest text-on-surface/40 uppercase">Native Resolution</span>
        </div>
      </div>
    </section>
  );
};
