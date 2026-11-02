import React, { useState } from 'react';
import { useParams, Link } from 'react-router-dom';
import { motion } from 'motion/react';
import { Star, ShoppingBag, Heart, Share2, ArrowRight, Zap, Shield, Cpu, Monitor, Laptop } from 'lucide-react';
import { PRODUCTS } from '../constants';

export const ProductDetail: React.FC = () => {
  const { id } = useParams<{ id: string }>();
  const product = PRODUCTS.find(p => p.id === id);
  const [selectedImage, setSelectedImage] = useState(0);

  if (!product) {
    return (
      <div className="pt-40 text-center min-h-screen">
        <h1 className="text-4xl font-bold mb-6">Product Not Found</h1>
        <Link to="/" className="btn-primary">Return Home</Link>
      </div>
    );
  }

  const images = [
    product.image,
    `https://picsum.photos/seed/${product.id}-2/800/600`,
    `https://picsum.photos/seed/${product.id}-3/800/600`,
    `https://picsum.photos/seed/${product.id}-4/800/600`,
  ];

  return (
    <div className="pt-32 pb-20">
      <div className="max-w-7xl mx-auto px-6">
        {/* Breadcrumbs */}
        <div className="flex items-center gap-2 text-xs opacity-50 mb-12 uppercase tracking-widest">
          <Link to="/" className="hover:opacity-100 transition-opacity">Home</Link>
          <span>/</span>
          <Link to={`/category/${product.category.toLowerCase()}`} className="hover:opacity-100 transition-opacity">
            {product.category}
          </Link>
          <span>/</span>
          <span className="opacity-100">{product.name}</span>
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-2 gap-20 mb-32">
          {/* Image Gallery */}
          <div className="space-y-6">
            <motion.div 
              initial={{ opacity: 0, scale: 0.95 }}
              animate={{ opacity: 1, scale: 1 }}
              className="aspect-[4/3] bg-white border border-line overflow-hidden relative"
            >
              <img 
                src={images[selectedImage]} 
                alt={product.name}
                className="w-full h-full object-cover"
                referrerPolicy="no-referrer"
              />
              <div className="absolute top-6 left-6 bg-ink text-bg text-[10px] font-bold px-3 py-1 tracking-widest uppercase">
                Precision Series
              </div>
            </motion.div>
            <div className="grid grid-cols-4 gap-4">
              {images.map((img, i) => (
                <button 
                  key={i}
                  onClick={() => setSelectedImage(i)}
                  className={`aspect-square border transition-all ${
                    selectedImage === i ? 'border-ink opacity-100' : 'border-line opacity-40 hover:opacity-100'
                  }`}
                >
                  <img src={img} alt="" className="w-full h-full object-cover" referrerPolicy="no-referrer" />
                </button>
              ))}
            </div>
          </div>

          {/* Product Info */}
          <div className="flex flex-col">
            <div className="mb-10">
              <p className="text-sm font-serif italic opacity-60 mb-2">{product.brand}</p>
              <h1 className="text-5xl md:text-6xl font-bold tracking-tighter leading-tight mb-6">
                {product.name.toUpperCase()}
              </h1>
              <div className="flex items-center gap-6">
                <div className="flex items-center gap-2">
                  <div className="flex text-yellow-500">
                    {[...Array(5)].map((_, i) => (
                      <Star key={i} size={14} fill={i < Math.floor(product.rating) ? "currentColor" : "none"} />
                    ))}
                  </div>
                  <span className="text-sm font-bold">{product.rating}</span>
                </div>
                <span className="text-sm opacity-40 uppercase tracking-widest">{product.reviews} Reviews</span>
                <div className="h-4 w-px bg-line" />
                <span className="text-sm text-green-600 font-bold uppercase tracking-widest">In Stock</span>
              </div>
            </div>

            <p className="text-3xl font-mono font-bold mb-10">${product.price.toLocaleString()}</p>

            <p className="text-lg opacity-60 leading-relaxed mb-12 max-w-lg">
              {product.description}
            </p>

            <div className="space-y-6 mb-12">
              <h4 className="text-xs font-bold uppercase tracking-widest opacity-40">Key Specifications</h4>
              <div className="grid grid-cols-2 gap-6">
                {Object.entries(product.specs).map(([key, value]) => (
                  <div key={key} className="border-b border-line pb-4">
                    <p className="text-[10px] opacity-40 uppercase mb-1">{key}</p>
                    <p className="text-sm font-medium">{value}</p>
                  </div>
                ))}
              </div>
            </div>

            <div className="flex flex-col sm:flex-row gap-4 mt-auto">
              <button className="flex-1 btn-primary py-5 flex items-center justify-center gap-3">
                <ShoppingBag size={20} /> Add to Cart
              </button>
              <button className="p-5 border border-line hover:bg-ink hover:text-bg transition-all">
                <Heart size={20} />
              </button>
              <button className="p-5 border border-line hover:bg-ink hover:text-bg transition-all">
                <Share2 size={20} />
              </button>
            </div>
          </div>
        </div>

        {/* Technical Highlights */}
        <section className="mb-32">
          <div className="flex justify-between items-end mb-12">
            <div>
              <span className="font-serif italic text-lg mb-2 block opacity-60">Engineering</span>
              <h2 className="text-4xl font-bold tracking-tighter">TECHNICAL HIGHLIGHTS</h2>
            </div>
          </div>
          <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
            {product.features.map((feature, i) => (
              <div key={i} className="p-10 border border-line bg-white hover:border-ink transition-colors group">
                <div className="w-12 h-12 border border-ink flex items-center justify-center mb-8 group-hover:bg-ink group-hover:text-bg transition-colors">
                  {i === 0 ? <Cpu size={24} /> : i === 1 ? <Shield size={24} /> : <Zap size={24} />}
                </div>
                <h3 className="text-xl font-bold mb-4">{feature}</h3>
                <p className="text-sm opacity-60 leading-relaxed">
                  Engineered for maximum efficiency and precision in professional workflows. 
                  Tested in extreme conditions to ensure absolute reliability.
                </p>
              </div>
            ))}
          </div>
        </section>

        {/* Related Products */}
        <section>
          <div className="flex justify-between items-end mb-12">
            <div>
              <span className="font-serif italic text-lg mb-2 block opacity-60">Related</span>
              <h2 className="text-4xl font-bold tracking-tighter">YOU MAY ALSO NEED</h2>
            </div>
            <Link to="/category/all" className="text-sm font-medium hover:opacity-60 transition-opacity flex items-center gap-2">
              View All <ArrowRight size={16} />
            </Link>
          </div>
          <div className="grid grid-cols-1 md:grid-cols-4 gap-6">
            {PRODUCTS.filter(p => p.id !== product.id).slice(0, 4).map((p) => (
              <Link to={`/product/${p.id}`} key={p.id} className="group">
                <div className="aspect-square bg-white border border-line overflow-hidden mb-4">
                  <img 
                    src={p.image} 
                    alt={p.name} 
                    className="w-full h-full object-cover transition-transform duration-700 group-hover:scale-110"
                    referrerPolicy="no-referrer"
                  />
                </div>
                <p className="text-[10px] opacity-40 uppercase mb-1">{p.brand}</p>
                <h4 className="font-bold tracking-tighter group-hover:underline underline-offset-4 mb-2">{p.name}</h4>
                <p className="text-sm font-mono font-bold">${p.price}</p>
              </Link>
            ))}
          </div>
        </section>
      </div>
    </div>
  );
};
