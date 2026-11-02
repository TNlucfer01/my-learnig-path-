import React, { useState } from 'react';
import { motion } from 'motion/react';
import { PRODUCTS } from '../constants';
import { ProductCard } from '../components/ProductCard';
import { Search, SlidersHorizontal } from 'lucide-react';

export const Catalog: React.FC = () => {
  const [filter, setFilter] = useState('All');
  const categories = ['All', 'Laptops', 'Monitors', 'Audio', 'Peripherals', 'Workstations'];

  const filteredProducts = filter === 'All' 
    ? PRODUCTS 
    : PRODUCTS.filter(p => p.category === filter);

  return (
    <div className="pt-32 pb-32 max-w-7xl mx-auto px-6">
      <div className="flex flex-col md:flex-row md:items-end justify-between gap-8 mb-16">
        <div>
          <p className="text-xs font-bold tracking-[0.3em] text-primary mb-2 uppercase">FULL INVENTORY</p>
          <h1 className="text-5xl font-bold tracking-tight">THE CATALOG</h1>
        </div>
        
        <div className="flex items-center gap-4">
          <div className="relative">
            <Search className="absolute left-4 top-1/2 -translate-y-1/2 w-4 h-4 text-on-surface/40" />
            <input 
              type="text" 
              placeholder="SEARCH PROTOCOLS..."
              className="bg-surface-container border border-neutral-800 rounded-lg pl-12 pr-6 py-3 text-xs font-bold tracking-widest focus:outline-none focus:border-primary/50 transition-colors w-64"
            />
          </div>
          <button className="p-3 bg-surface-container border border-neutral-800 rounded-lg hover:bg-white/5 transition-colors">
            <SlidersHorizontal className="w-5 h-5" />
          </button>
        </div>
      </div>

      {/* Category Filter */}
      <div className="flex gap-4 mb-12 overflow-x-auto no-scrollbar pb-4">
        {categories.map((cat) => (
          <button
            key={cat}
            onClick={() => setFilter(cat)}
            className={`px-6 py-2 rounded-full text-[10px] font-bold tracking-widest uppercase transition-all whitespace-nowrap ${filter === cat ? 'bg-primary text-on-primary' : 'bg-white/5 text-on-surface/60 hover:bg-white/10'}`}
          >
            {cat}
          </button>
        ))}
      </div>

      {/* Product Grid */}
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
        {filteredProducts.map((product) => (
          <ProductCard key={product.id} product={product} />
        ))}
      </div>
    </div>
  );
};
