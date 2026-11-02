import React from 'react';
import { motion } from 'framer-motion';
import { Star, ShieldCheck } from 'lucide-react';

const ProductCard = ({ product, onBuyNow }) => {
    return (
        <motion.div
            layout
            initial={{ opacity: 0, scale: 0.9 }}
            animate={{ opacity: 1, scale: 1 }}
            exit={{ opacity: 0, scale: 0.9 }}
            className="glass-card group overflow-hidden"
        >
            {/* Image Section */}
            <div className="relative h-64 overflow-hidden">
                <img
                    src={product.image}
                    alt={product.name}
                    className="w-full h-full object-cover transition-transform duration-700 group-hover:scale-110"
                />
                <div className="absolute top-4 left-4 bg-vajra-black/60 backdrop-blur-md px-3 py-1 rounded-full border border-vajra-gold/20 flex items-center gap-1">
                    <Star size={14} className="text-vajra-gold fill-vajra-gold" />
                    <span className="text-xs font-bold">{product.rating}</span>
                </div>
                {product.stock === 'Limited Stock' && (
                    <div className="absolute top-4 right-4 bg-red-500/80 backdrop-blur-md px-3 py-1 rounded-full text-[10px] uppercase tracking-widest font-bold">
                        Limited
                    </div>
                )}
            </div>

            {/* Content Section */}
            <div className="p-6">
                <div className="flex justify-between items-start mb-2">
                    <div>
                        <span className="text-[10px] uppercase tracking-[0.2em] text-vajra-gold/60 font-bold">
                            {product.category}
                        </span>
                        <h3 className="text-xl font-serif mt-1 group-hover:text-vajra-gold transition-colors">
                            {product.name}
                        </h3>
                    </div>
                    <div className="text-right">
                        <div className="text-xs text-gray-500 line-through">₹{product.mrp}</div>
                        <div className="text-xl font-bold text-vajra-gold">₹{product.price}</div>
                    </div>
                </div>

                <p className="text-sm text-gray-400 mb-6 line-clamp-2">
                    {product.shortDesc}
                </p>

                <div className="flex items-center gap-4 mb-8">
                    {product.features.slice(0, 2).map((feat, i) => (
                        <div key={i} className="flex items-center gap-1.5 text-[10px] text-gray-300">
                            <ShieldCheck size={12} className="text-vajra-gold" />
                            {feat}
                        </div>
                    ))}
                </div>

                <button
                    onClick={() => onBuyNow(product)}
                    className="w-full py-4 rounded-xl border border-vajra-gold/30 gold-text-gradient font-bold uppercase tracking-widest text-sm hover:border-vajra-gold hover:bg-vajra-gold/10 transition-all flex items-center justify-center gap-2"
                >
                    Buy Now
                </button>
            </div>
        </motion.div>
    );
};

export default ProductCard;
