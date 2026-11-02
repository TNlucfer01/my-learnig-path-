import React from 'react';
import { motion } from 'motion/react';
import { PRINCIPLES, STATS } from '../constants';
import { Rocket, Target, Diamond, ArrowRight } from 'lucide-react';

export const Origin: React.FC = () => {
  const iconMap: Record<string, any> = {
    Rocket: <Rocket className="w-6 h-6 text-primary" />,
    Target: <Target className="w-6 h-6 text-secondary" />,
    Diamond: <Diamond className="w-6 h-6 text-primary" />
  };

  return (
    <div className="pt-32 pb-32">
      <section className="max-w-7xl mx-auto px-6 mb-32">
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-24 items-center">
          <div>
            <p className="text-xs font-bold tracking-[0.4em] text-primary mb-6 uppercase">OUR STORY</p>
            <h1 className="text-6xl md:text-7xl font-bold tracking-tighter mb-10 leading-tight">
              FORGED IN <br />
              <span className="text-glow text-primary">SILICON & GOLD.</span>
            </h1>
            <p className="text-lg text-on-surface/70 mb-8 leading-relaxed">
              Founded in 2024 by a collective of renegade engineers and industrial designers, Neon Monolith was born from a singular obsession: to create hardware that feels like it belongs to the future.
            </p>
            <p className="text-on-surface/60 mb-12 leading-relaxed">
              We rejected the planned obsolescence of the tech giants. We rejected the plastic shells and the compromise. Instead, we chose the path of absolute material integrity and unyielding performance.
            </p>
            <div className="flex gap-12">
              {STATS.slice(0, 2).map((stat, idx) => (
                <div key={idx}>
                  <p className="text-4xl font-bold font-headline text-glow mb-1">{stat.value}</p>
                  <p className="text-[10px] font-bold tracking-widest text-on-surface/40 uppercase">{stat.label}</p>
                </div>
              ))}
            </div>
          </div>

          <div className="relative">
            <div className="absolute -top-12 -left-12 w-64 h-64 bg-primary/20 blur-[120px] rounded-full"></div>
            <div className="relative bg-surface-container p-4 rounded-[40px] border border-neutral-800/50 overflow-hidden">
              <img
                src="https://lh3.googleusercontent.com/aida-public/AB6AXuAtJY0dbDnQgRAbNUpAvGa5wfKbRWF2tfiLkqhPbbxBXEjuZFYR4zfTSZzAF4gvhcHCwxxekth_5mCR6qGCybE2eSDrCYdn9u3oKXmq4LFlyEji_r8N84wKEGgkFtXSD6k3E8yMx1A16nGOcjxdTOGN3HNePt0ChrBNEHT0DfWwlbVp2spGHVF1Mq4V1yFS1riDNWASI4MkSUaj9Ww-iZa7VLQH_6qpiLSSx3N7yc-Qk9x52yfD14JpBk5uwHwjxakSPO9lr0t2gXmm"
                alt="Origin Story"
                referrerPolicy="no-referrer"
                className="w-full h-full object-cover rounded-[32px] grayscale hover:grayscale-0 transition-all duration-700"
              />
            </div>
          </div>
        </div>
      </section>

      {/* Principles Bento Grid */}
      <section className="bg-surface-container py-32 relative overflow-hidden">
        <div className="max-w-7xl mx-auto px-6">
          <div className="text-center mb-20">
            <p className="text-xs font-bold tracking-[0.4em] text-secondary mb-4 uppercase">CORE ARCHITECTURE</p>
            <h2 className="text-4xl font-bold tracking-tight">OUR GUIDING PRINCIPLES</h2>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
            {PRINCIPLES.map((p, idx) => (
              <motion.div
                key={idx}
                initial={{ opacity: 0, y: 20 }}
                whileInView={{ opacity: 1, y: 0 }}
                viewport={{ once: true }}
                transition={{ delay: idx * 0.1 }}
                className={`p-10 rounded-3xl border border-neutral-800/50 hover:border-primary/30 transition-all group ${idx === 0 ? 'md:col-span-1 bg-primary/5' : 'bg-surface'}`}
              >
                <div className="w-14 h-14 bg-white/5 rounded-2xl flex items-center justify-center mb-8 group-hover:scale-110 transition-transform">
                  {iconMap[p.icon]}
                </div>
                <h3 className="text-xl font-bold font-headline mb-4 group-hover:text-primary transition-colors uppercase">{p.title}</h3>
                <p className="text-on-surface/60 leading-relaxed">{p.description}</p>
              </motion.div>
            ))}
          </div>
        </div>
      </section>

      <section className="max-w-7xl mx-auto px-6 py-32 text-center">
        <h2 className="text-5xl font-bold tracking-tighter mb-12">JOIN THE <span className="text-primary">ELITE.</span></h2>
        <button className="px-12 py-5 bg-primary text-on-primary font-bold text-xs tracking-[0.3em] rounded-full hover:scale-105 transition-transform shadow-2xl shadow-primary/30">
          SECURE YOUR PROTOCOL
        </button>
      </section>
    </div>
  );
};
