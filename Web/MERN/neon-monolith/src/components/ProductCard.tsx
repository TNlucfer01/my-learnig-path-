import React from 'react';
import { motion } from 'motion/react';
import { ShoppingCart, ArrowUpRight } from 'lucide-react';
import { Product } from '../types';

interface ProductCardProps {
  product: Product;
}

export const ProductCard: React.FC<ProductCardProps> = ({ product }) => {
  return (
    <motion.div
      initial={{ opacity: 0, y: 20 }}
      whileInView={{ opacity: 1, y: 0 }}
      viewport={{ once: true }}
      className="group relative bg-surface-container rounded-2xl overflow-hidden border border-neutral-800/50 hover:border-primary/30 transition-all duration-500"
    >
      <div className="aspect-square overflow-hidden relative">
        <img
          src={product.image}
          alt={product.name}
          referrerPolicy="no-referrer"
          className="w-full h-full object-cover transition-transform duration-700 group-hover:scale-110"
        />
        <div className="absolute inset-0 bg-gradient-to-t from-black/80 via-transparent to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-500 flex items-end p-6">
          <button className="w-full py-3 bg-primary text-on-primary font-bold text-xs tracking-widest rounded-lg flex items-center justify-center gap-2 transform translate-y-4 group-hover:translate-y-0 transition-transform duration-500">
            <ShoppingCart className="w-4 h-4" />
            ADD TO CART
          </button>
        </div>
        {product.tag && (
          <div className="absolute top-4 left-4 px-3 py-1 bg-primary/10 backdrop-blur-md border border-primary/20 rounded-full">
            <span className="text-[10px] font-bold tracking-widest text-primary uppercase">{product.tag}</span>
          </div>
        )}
      </div>

      <div className="p-6">
        <div className="flex justify-between items-start mb-2">
          <div>
            <p className="text-[10px] font-bold tracking-widest text-secondary uppercase mb-1">{product.category}</p>
            <h3 className="font-headline font-bold text-lg group-hover:text-primary transition-colors">{product.name}</h3>
          </div>
          <p className="font-mono text-primary font-bold">${product.price.toLocaleString()}</p>
        </div>
        <p className="text-sm text-on-surface/60 line-clamp-2">{product.description}</p>
        
        <div className="mt-4 pt-4 border-t border-neutral-800 flex items-center justify-between opacity-0 group-hover:opacity-100 transition-opacity">
          <span className="text-[10px] font-bold tracking-widest text-on-surface/40">VIEW SPECIFICATIONS</span>
          <ArrowUpRight className="w-4 h-4 text-primary" />
        </div>
      </div>
    </motion.div>
  );
};
