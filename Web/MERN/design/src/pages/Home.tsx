import React from 'react';
import { motion } from 'motion/react';
import { ArrowRight, Star, TrendingUp, Shield, Zap, Monitor, Laptop, Mouse, Headphones, Cpu, HardDrive } from 'lucide-react';
import { Link } from 'react-router-dom';
import { PRODUCTS, CATEGORIES } from '../constants';

const categoryIcons: Record<string, any> = {
  Laptop, Monitor, Mouse, Headphones, Cpu, HardDrive
};

export const Home: React.FC = () => {
  return (
    <div className="pt-24">
      {/* Hero Section */}
      <section className="relative h-[90vh] flex items-center overflow-hidden">
        <div className="max-w-7xl mx-auto px-6 w-full grid grid-cols-1 md:grid-cols-2 gap-12 items-center">
          <motion.div
            initial={{ opacity: 0, x: -50 }}
            animate={{ opacity: 1, x: 0 }}
            transition={{ duration: 0.8, ease: "easeOut" }}
          >
            <span className="font-serif italic text-lg mb-4 block text-ink/60">New Release</span>
            <h1 className="text-7xl md:text-9xl font-bold tracking-tighter leading-none mb-8">
              PRECISION <br />
              <span className="text-ink/20">ARCHITECT</span>
            </h1>
            <p className="text-xl text-ink/60 max-w-md mb-10">
              The ultimate workstation for architects and designers. 
              Engineered for absolute performance.
            </p>
            <div className="flex gap-4">
              <Link to="/product/1" className="btn-primary flex items-center gap-2">
                Shop Now <ArrowRight size={18} />
              </Link>
              <Link to="/category/laptops" className="btn-outline">
                View Collection
              </Link>
            </div>
          </motion.div>

          <motion.div
            initial={{ opacity: 0, scale: 0.8, rotate: 5 }}
            animate={{ opacity: 1, scale: 1, rotate: 0 }}
            transition={{ duration: 1, ease: "easeOut", delay: 0.2 }}
            className="relative"
          >
            <img 
              src="https://picsum.photos/seed/laptop-hero/1200/800" 
              alt="Precision Architect Pro" 
              className="w-full h-auto shadow-2xl rounded-sm"
              referrerPolicy="no-referrer"
            />
            <div className="absolute -bottom-10 -left-10 bg-bg border border-line p-6 shadow-xl hidden md:block">
              <div className="flex items-center gap-4 mb-2">
                <div className="flex text-yellow-500">
                  {[...Array(5)].map((_, i) => <Star key={i} size={14} fill="currentColor" />)}
                </div>
                <span className="text-xs font-bold">4.9/5</span>
              </div>
              <p className="text-sm font-medium">"The most precise display I've ever used."</p>
              <p className="text-[10px] opacity-50 mt-1">— Sarah J., Senior Architect</p>
            </div>
          </motion.div>
        </div>
      </section>

      {/* Categories Bento Grid */}
      <section className="py-20 bg-ink text-bg">
        <div className="max-w-7xl mx-auto px-6">
          <div className="flex justify-between items-end mb-12">
            <div>
              <span className="font-serif italic text-lg mb-2 block opacity-60">Collections</span>
              <h2 className="text-5xl font-bold tracking-tighter">SHOP BY CATEGORY</h2>
            </div>
            <Link to="/categories" className="text-sm font-medium hover:opacity-60 transition-opacity flex items-center gap-2">
              View All <ArrowRight size={16} />
            </Link>
          </div>

          <div className="grid grid-cols-2 md:grid-cols-4 gap-4 auto-rows-[200px]">
            {CATEGORIES.map((cat, i) => {
              const Icon = categoryIcons[cat.icon];
              return (
                <Link 
                  key={cat.name}
                  to={`/category/${cat.name.toLowerCase()}`}
                  className={`group relative overflow-hidden bg-bg/5 border border-bg/10 p-8 flex flex-col justify-between hover:bg-bg hover:text-ink transition-all duration-500 ${
                    i === 0 ? 'md:col-span-2 md:row-span-2' : ''
                  }`}
                >
                  <div className="flex justify-between items-start">
                    <div className="p-3 border border-current opacity-40 group-hover:opacity-100 transition-opacity">
                      <Icon size={24} />
                    </div>
                    <span className="text-xs font-mono opacity-40 group-hover:opacity-100">{cat.count} Items</span>
                  </div>
                  <div>
                    <h3 className="text-2xl font-bold tracking-tighter mb-2">{cat.name.toUpperCase()}</h3>
                    <p className="text-xs opacity-0 group-hover:opacity-60 transition-all transform translate-y-2 group-hover:translate-y-0">
                      Explore precision {cat.name.toLowerCase()}
                    </p>
                  </div>
                </Link>
              );
            })}
          </div>
        </div>
      </section>

      {/* Trending Deals */}
      <section className="py-20">
        <div className="max-w-7xl mx-auto px-6">
          <div className="flex justify-between items-end mb-12">
            <div>
              <span className="font-serif italic text-lg mb-2 block text-ink/60">Curated</span>
              <h2 className="text-5xl font-bold tracking-tighter">TRENDING DEALS</h2>
            </div>
            <div className="flex gap-2">
              <button className="p-3 border border-line hover:bg-ink hover:text-bg transition-colors">
                <ArrowRight size={20} className="rotate-180" />
              </button>
              <button className="p-3 border border-line hover:bg-ink hover:text-bg transition-colors">
                <ArrowRight size={20} />
              </button>
            </div>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
            {PRODUCTS.filter(p => p.isTrending).map((product) => (
              <motion.div 
                key={product.id}
                whileHover={{ y: -10 }}
                className="group border border-line bg-white"
              >
                <Link to={`/product/${product.id}`} className="block relative overflow-hidden aspect-[4/3]">
                  <img 
                    src={product.image} 
                    alt={product.name}
                    className="w-full h-full object-cover transition-transform duration-700 group-hover:scale-110"
                    referrerPolicy="no-referrer"
                  />
                  <div className="absolute top-4 left-4 bg-ink text-bg text-[10px] font-bold px-2 py-1 tracking-widest uppercase">
                    Trending
                  </div>
                </Link>
                <div className="p-8">
                  <div className="flex justify-between items-start mb-4">
                    <div>
                      <p className="text-xs opacity-50 mb-1">{product.brand}</p>
                      <h3 className="text-xl font-bold tracking-tighter group-hover:underline underline-offset-4">
                        {product.name}
                      </h3>
                    </div>
                    <p className="text-xl font-mono font-bold">${product.price}</p>
                  </div>
                  <div className="flex items-center gap-4 mb-6">
                    <div className="flex text-yellow-500">
                      {[...Array(5)].map((_, i) => (
                        <Star 
                          key={i} 
                          size={12} 
                          fill={i < Math.floor(product.rating) ? "currentColor" : "none"} 
                        />
                      ))}
                    </div>
                    <span className="text-xs opacity-50">({product.reviews} Reviews)</span>
                  </div>
                  <button className="w-full btn-outline py-4 flex items-center justify-center gap-2">
                    Add to Cart <Zap size={16} />
                  </button>
                </div>
              </motion.div>
            ))}
          </div>
        </div>
      </section>

      {/* Features Section */}
      <section className="py-20 border-y border-line">
        <div className="max-w-7xl mx-auto px-6 grid grid-cols-1 md:grid-cols-3 gap-12">
          <div className="flex gap-6">
            <div className="w-12 h-12 border border-ink flex items-center justify-center shrink-0">
              <Shield size={24} />
            </div>
            <div>
              <h4 className="font-bold mb-2">Extended Warranty</h4>
              <p className="text-sm opacity-60 leading-relaxed">
                Every ELECTRA product comes with a 3-year precision guarantee.
              </p>
            </div>
          </div>
          <div className="flex gap-6">
            <div className="w-12 h-12 border border-ink flex items-center justify-center shrink-0">
              <TrendingUp size={24} />
            </div>
            <div>
              <h4 className="font-bold mb-2">Performance Tracking</h4>
              <p className="text-sm opacity-60 leading-relaxed">
                Monitor your device health and performance in real-time.
              </p>
            </div>
          </div>
          <div className="flex gap-6">
            <div className="w-12 h-12 border border-ink flex items-center justify-center shrink-0">
              <Zap size={24} />
            </div>
            <div>
              <h4 className="font-bold mb-2">Express Delivery</h4>
              <p className="text-sm opacity-60 leading-relaxed">
                Next-day shipping for all orders within the continental US.
              </p>
            </div>
          </div>
        </div>
      </section>

      {/* Newsletter */}
      <section className="py-32 bg-bg relative overflow-hidden">
        <div className="max-w-3xl mx-auto px-6 text-center relative z-10">
          <span className="font-serif italic text-2xl mb-6 block">Stay Informed</span>
          <h2 className="text-6xl md:text-7xl font-bold tracking-tighter mb-10">
            JOIN THE <br /> PRECISION CLUB
          </h2>
          <p className="text-lg opacity-60 mb-12">
            Get early access to new releases, technical deep-dives, and exclusive offers.
          </p>
          <form className="flex flex-col md:flex-row gap-4">
            <input 
              type="email" 
              placeholder="Enter your email address" 
              className="flex-1 bg-transparent border-b border-ink py-4 px-2 focus:outline-none focus:border-ink/40 transition-colors"
            />
            <button className="btn-primary px-12">Subscribe</button>
          </form>
        </div>
        <div className="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 text-[20vw] font-bold opacity-[0.02] pointer-events-none whitespace-nowrap">
          ELECTRA ELECTRA ELECTRA
        </div>
      </section>
    </div>
  );
};
