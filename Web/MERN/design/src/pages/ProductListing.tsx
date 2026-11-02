import React, { useState } from 'react';
import { Link, useParams } from 'react-router-dom';
import { motion } from 'motion/react';
import { Filter, ChevronDown, Star, ShoppingBag, ArrowRight, Search, SlidersHorizontal, LayoutGrid, List } from 'lucide-react';
import { PRODUCTS } from '../constants';

export const ProductListing: React.FC = () => {
  const { category } = useParams<{ category: string }>();
  const [viewMode, setViewMode] = useState<'grid' | 'list'>('grid');
  const [sortBy, setSortBy] = useState('Featured');

  const filteredProducts = category && category !== 'all' 
    ? PRODUCTS.filter(p => p.category.toLowerCase() === category.toLowerCase())
    : PRODUCTS;

  return (
    <div className="pt-32 pb-20 bg-bg">
      <div className="max-w-7xl mx-auto px-6">
        {/* Breadcrumbs */}
        <div className="flex items-center gap-2 text-xs opacity-50 mb-12 uppercase tracking-widest">
          <Link to="/" className="hover:opacity-100 transition-opacity">Home</Link>
          <span>/</span>
          <span className="opacity-100">{category || 'All Products'}</span>
        </div>

        <div className="flex flex-col md:flex-row justify-between items-end mb-16 gap-8">
          <div>
            <span className="font-serif italic text-lg mb-2 block opacity-60">Collection</span>
            <h1 className="text-6xl font-bold tracking-tighter uppercase">{category || 'All Products'}</h1>
          </div>
          
          <div className="flex items-center gap-6">
            <div className="flex items-center border border-line bg-white">
              <button 
                onClick={() => setViewMode('grid')}
                className={`p-3 transition-colors ${viewMode === 'grid' ? 'bg-ink text-bg' : 'hover:bg-ink/5'}`}
              >
                <LayoutGrid size={18} />
              </button>
              <button 
                onClick={() => setViewMode('list')}
                className={`p-3 transition-colors ${viewMode === 'list' ? 'bg-ink text-bg' : 'hover:bg-ink/5'}`}
              >
                <List size={18} />
              </button>
            </div>
            
            <div className="relative group">
              <button className="flex items-center gap-4 px-6 py-3 border border-line bg-white text-xs font-bold uppercase tracking-widest">
                Sort By: {sortBy} <ChevronDown size={14} />
              </button>
              <div className="absolute top-full right-0 mt-2 w-48 bg-white border border-line shadow-xl opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all z-20">
                {['Featured', 'Price: Low to High', 'Price: High to Low', 'Newest'].map(opt => (
                  <button 
                    key={opt}
                    onClick={() => setSortBy(opt)}
                    className="w-full text-left px-6 py-4 text-xs font-bold uppercase tracking-widest hover:bg-ink hover:text-bg transition-colors"
                  >
                    {opt}
                  </button>
                ))}
              </div>
            </div>
          </div>
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-4 gap-12">
          {/* Filters Sidebar */}
          <aside className="hidden lg:block space-y-12">
            <div className="space-y-6">
              <h3 className="text-xs font-bold uppercase tracking-widest opacity-40">Connectivity</h3>
              <div className="space-y-4">
                {['Thunderbolt 4', 'USB-C', 'Wireless', 'Bluetooth 5.3'].map(opt => (
                  <label key={opt} className="flex items-center gap-3 cursor-pointer group">
                    <div className="w-4 h-4 border border-line group-hover:border-ink transition-colors" />
                    <span className="text-sm font-medium opacity-60 group-hover:opacity-100 transition-opacity">{opt}</span>
                  </label>
                ))}
              </div>
            </div>

            <div className="space-y-6">
              <h3 className="text-xs font-bold uppercase tracking-widest opacity-40">Price Range</h3>
              <div className="space-y-4">
                {['Under $500', '$500 - $1000', '$1000 - $2000', 'Over $2000'].map(opt => (
                  <label key={opt} className="flex items-center gap-3 cursor-pointer group">
                    <div className="w-4 h-4 border border-line group-hover:border-ink transition-colors" />
                    <span className="text-sm font-medium opacity-60 group-hover:opacity-100 transition-opacity">{opt}</span>
                  </label>
                ))}
              </div>
            </div>

            <div className="space-y-6">
              <h3 className="text-xs font-bold uppercase tracking-widest opacity-40">Brand</h3>
              <div className="space-y-4">
                {['ELECTRA', 'Precision Pro', 'Studio X', 'Core Tech'].map(opt => (
                  <label key={opt} className="flex items-center gap-3 cursor-pointer group">
                    <div className="w-4 h-4 border border-line group-hover:border-ink transition-colors" />
                    <span className="text-sm font-medium opacity-60 group-hover:opacity-100 transition-opacity">{opt}</span>
                  </label>
                ))}
              </div>
            </div>

            <div className="p-8 border border-ink bg-ink text-bg">
              <h4 className="font-bold mb-4 uppercase tracking-tighter">Need Assistance?</h4>
              <p className="text-xs opacity-60 leading-relaxed mb-6">
                Our specialists are available 24/7 to help you find the perfect precision tool.
              </p>
              <button className="w-full py-3 border border-bg text-bg text-[10px] font-bold uppercase tracking-widest hover:bg-bg hover:text-ink transition-all">
                Contact Specialist
              </button>
            </div>
          </aside>

          {/* Product Grid */}
          <div className="lg:col-span-3">
            <div className={`grid gap-8 ${viewMode === 'grid' ? 'grid-cols-1 md:grid-cols-2 xl:grid-cols-3' : 'grid-cols-1'}`}>
              {filteredProducts.map((product) => (
                <motion.div 
                  key={product.id}
                  layout
                  initial={{ opacity: 0, y: 20 }}
                  animate={{ opacity: 1, y: 0 }}
                  className={`group border border-line bg-white shadow-sm hover:shadow-xl transition-all ${
                    viewMode === 'list' ? 'flex flex-col md:flex-row' : ''
                  }`}
                >
                  <Link 
                    to={`/product/${product.id}`} 
                    className={`block relative overflow-hidden ${viewMode === 'list' ? 'w-full md:w-64 aspect-square' : 'aspect-square'}`}
                  >
                    <img 
                      src={product.image} 
                      alt={product.name}
                      className="w-full h-full object-cover transition-transform duration-700 group-hover:scale-110"
                      referrerPolicy="no-referrer"
                    />
                    {product.isTrending && (
                      <div className="absolute top-4 left-4 bg-ink text-bg text-[10px] font-bold px-2 py-1 tracking-widest uppercase">
                        Trending
                      </div>
                    )}
                  </Link>
                  <div className="p-8 flex-1 flex flex-col justify-between">
                    <div>
                      <div className="flex justify-between items-start mb-4">
                        <div>
                          <p className="text-[10px] opacity-40 uppercase mb-1 tracking-widest">{product.brand}</p>
                          <h3 className="text-xl font-bold tracking-tighter group-hover:underline underline-offset-4">
                            {product.name.toUpperCase()}
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
                        <span className="text-[10px] opacity-40 uppercase tracking-widest">({product.reviews} Reviews)</span>
                      </div>
                    </div>
                    <button className="w-full btn-outline py-4 flex items-center justify-center gap-2 text-xs uppercase tracking-widest">
                      Add to Cart <ShoppingBag size={14} />
                    </button>
                  </div>
                </motion.div>
              ))}
            </div>

            {/* Pagination */}
            <div className="mt-20 flex justify-center items-center gap-4">
              <button className="p-4 border border-line opacity-40 hover:opacity-100 transition-opacity">
                <ArrowRight size={20} className="rotate-180" />
              </button>
              <div className="flex gap-2">
                {[1, 2, 3].map(p => (
                  <button 
                    key={p}
                    className={`w-12 h-12 border flex items-center justify-center font-mono font-bold transition-all ${
                      p === 1 ? 'bg-ink text-bg border-ink' : 'border-line hover:border-ink'
                    }`}
                  >
                    {p}
                  </button>
                ))}
              </div>
              <button className="p-4 border border-line hover:border-ink transition-all">
                <ArrowRight size={20} />
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export const SearchResults: React.FC = () => {
  return <ProductListing />;
};
