import React from 'react';
import { motion } from 'motion/react';
import { PRODUCTS, STATS } from '../constants';
import { ProductCard } from '../components/ProductCard';
import { ArrowRight, Zap, Layers, Shield, Globe } from 'lucide-react';

export const Showroom: React.FC<{ onNavigate: (tab: string) => void }> = ({ onNavigate }) => {
  const newArrivals = PRODUCTS.filter(p => p.tag).slice(0, 4);

  return (
    <div className="pt-20 pb-32">
      {/* New Arrivals Bento Grid */}
      <section className="max-w-7xl mx-auto px-6 mb-32">
        <div className="flex items-end justify-between mb-12">
          <div>
            <p className="text-xs font-bold tracking-[0.3em] text-primary mb-2 uppercase">CURATED SELECTION</p>
            <h2 className="text-4xl font-bold tracking-tight">NEW ARRIVALS</h2>
          </div>
          <button 
            onClick={() => onNavigate('catalog')}
            className="group flex items-center gap-2 text-xs font-bold tracking-widest text-on-surface/60 hover:text-primary transition-colors"
          >
            VIEW ALL CATALOG
            <ArrowRight className="w-4 h-4 group-hover:translate-x-1 transition-transform" />
          </button>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-4 gap-6">
          {newArrivals.map((product, idx) => (
            <div key={product.id} className={idx === 0 ? 'md:col-span-2 md:row-span-2' : ''}>
              <ProductCard product={product} />
            </div>
          ))}
        </div>
      </section>

      {/* Tech Specs / Stats Section */}
      <section className="bg-surface-container py-24 mb-32 relative overflow-hidden">
        <div className="absolute top-0 left-0 w-full h-1 bg-gradient-to-r from-transparent via-primary/30 to-transparent"></div>
        <div className="max-w-7xl mx-auto px-6 grid grid-cols-2 md:grid-cols-4 gap-12">
          {STATS.map((stat, idx) => (
            <motion.div
              key={idx}
              initial={{ opacity: 0, y: 20 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true }}
              transition={{ delay: idx * 0.1 }}
              className="text-center"
            >
              <p className="text-5xl font-bold font-headline text-glow mb-2">{stat.value}</p>
              <p className="text-[10px] font-bold tracking-[0.2em] text-on-surface/40 uppercase">{stat.label}</p>
            </motion.div>
          ))}
        </div>
      </section>

      {/* Feature Highlight */}
      <section className="max-w-7xl mx-auto px-6 mb-32">
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-16 items-center">
          <motion.div
            initial={{ opacity: 0, scale: 0.95 }}
            whileInView={{ opacity: 1, scale: 1 }}
            viewport={{ once: true }}
            className="relative rounded-3xl overflow-hidden aspect-video"
          >
            <img
              src="https://lh3.googleusercontent.com/aida-public/AB6AXuDRADjFe-ZLzoXzIf0pvmevxEuxytjL3fYA8dnbD_rfFDyrW7wV5Fx_5ZZN_gyhz6ctGcFgmEI9JTi7Bkl9EA-ndEZsjqlsw-yOe8g2jyuMqC3SxetS61vBdJ_Rn3avL4J0_bx1X8nsjCJhe48TjKOWsRNpyoODtkUf2HITiBy0B8I5ep4MgMcqrbzHYGJIXXDetLq6tEX_QbyorbOET8yMTbUdmT3G2XE2DvQY31CR2pym13nt3sHdjVR_KT5JqCZ29fwO11PB_Q3W"
              alt="Precision Engineering"
              referrerPolicy="no-referrer"
              className="w-full h-full object-cover"
            />
            <div className="absolute inset-0 bg-primary/10 mix-blend-overlay"></div>
          </motion.div>

          <div>
            <p className="text-xs font-bold tracking-[0.3em] text-secondary mb-4 uppercase">ENGINEERING MARVEL</p>
            <h2 className="text-5xl font-bold tracking-tighter mb-8 leading-tight">THE ART OF <br /><span className="text-primary">PRECISION.</span></h2>
            <p className="text-on-surface/60 mb-10 leading-relaxed">
              Every Monolith device undergoes a 48-hour stress test in our sub-zero facility. We don't just build hardware; we forge digital instruments that resonate with the soul of the creator.
            </p>
            
            <div className="grid grid-cols-2 gap-8">
              <div className="flex items-start gap-4">
                <div className="p-3 bg-white/5 rounded-xl">
                  <Zap className="w-5 h-5 text-primary" />
                </div>
                <div>
                  <h4 className="font-bold text-sm mb-1">Overclocked</h4>
                  <p className="text-xs text-on-surface/40">Factory tuned for peak performance.</p>
                </div>
              </div>
              <div className="flex items-start gap-4">
                <div className="p-3 bg-white/5 rounded-xl">
                  <Layers className="w-5 h-5 text-secondary" />
                </div>
                <div>
                  <h4 className="font-bold text-sm mb-1">Modular</h4>
                  <p className="text-xs text-on-surface/40">Designed for future-proof expansion.</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
  );
};
