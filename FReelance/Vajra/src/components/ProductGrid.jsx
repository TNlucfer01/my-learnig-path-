import React, { useState } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import ProductCard from './ProductCard';
import { PRODUCTS } from '../data/products';

const ProductGrid = ({ onBuyNow }) => {
    const [activeTab, setActiveTab] = useState('All');
    const categories = ['All', 'Karungali', 'Scents'];

    const filteredProducts = activeTab === 'All'
        ? PRODUCTS
        : PRODUCTS.filter(p => p.category === activeTab);

    return (
        <section id="products" className="py-24 bg-vajra-black">
            <div className="container mx-auto px-6">
                <div className="text-center mb-16">
                    <motion.h2
                        initial={{ opacity: 0, scale: 0.9 }}
                        whileInView={{ opacity: 1, scale: 1 }}
                        className="text-4xl md:text-5xl font-serif mb-4 gold-text-gradient"
                    >
                        Our Collections
                    </motion.h2>
                    <div className="w-24 h-1 bg-gold-gradient mx-auto rounded-full opacity-60"></div>
                </div>

                {/* Filters */}
                <div className="flex justify-center flex-wrap gap-4 mb-16">
                    {categories.map((cat) => (
                        <button
                            key={cat}
                            onClick={() => setActiveTab(cat)}
                            className={`px-8 py-2 rounded-full border transition-all duration-300 tracking-widest text-xs uppercase font-bold ${activeTab === cat
                                    ? 'bg-gold-gradient text-vajra-black border-transparent'
                                    : 'border-vajra-gold/20 text-gray-400 hover:border-vajra-gold/50'
                                }`}
                        >
                            {cat}
                        </button>
                    ))}
                </div>

                {/* Grid */}
                <motion.div
                    layout
                    className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8"
                >
                    <AnimatePresence mode="popLayout">
                        {filteredProducts.map((product) => (
                            <ProductCard
                                key={product.id}
                                product={product}
                                onBuyNow={onBuyNow}
                            />
                        ))}
                    </AnimatePresence>
                </motion.div>
            </div>
        </section>
    );
};

export default ProductGrid;
