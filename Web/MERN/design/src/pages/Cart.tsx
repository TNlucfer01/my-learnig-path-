import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import { motion, AnimatePresence } from 'motion/react';
import { Trash2, Plus, Minus, ArrowRight, ShoppingBag, Shield, Zap } from 'lucide-react';
import { PRODUCTS } from '../constants';

export const Cart: React.FC = () => {
  const [cartItems, setCartItems] = useState([
    { ...PRODUCTS[0], quantity: 1 },
    { ...PRODUCTS[1], quantity: 1 },
  ]);

  const updateQuantity = (id: string, delta: number) => {
    setCartItems(prev => prev.map(item => 
      item.id === id ? { ...item, quantity: Math.max(1, item.quantity + delta) } : item
    ));
  };

  const removeItem = (id: string) => {
    setCartItems(prev => prev.filter(item => item.id !== id));
  };

  const subtotal = cartItems.reduce((acc, item) => acc + item.price * item.quantity, 0);
  const shipping = subtotal > 1000 ? 0 : 50;
  const tax = subtotal * 0.08;
  const total = subtotal + shipping + tax;

  if (cartItems.length === 0) {
    return (
      <div className="pt-40 pb-20 text-center min-h-screen">
        <div className="max-w-md mx-auto px-6">
          <div className="w-24 h-24 border border-line flex items-center justify-center mx-auto mb-10">
            <ShoppingBag size={40} className="opacity-20" />
          </div>
          <h1 className="text-4xl font-bold tracking-tighter mb-6 uppercase">Your cart is empty</h1>
          <p className="text-lg opacity-60 mb-10">
            It seems you haven't added any precision instruments to your collection yet.
          </p>
          <Link to="/" className="btn-primary w-full py-5 flex items-center justify-center gap-3">
            Start Shopping <ArrowRight size={20} />
          </Link>
        </div>
      </div>
    );
  }

  return (
    <div className="pt-32 pb-20">
      <div className="max-w-7xl mx-auto px-6">
        <div className="flex justify-between items-end mb-16">
          <div>
            <span className="font-serif italic text-lg mb-2 block opacity-60">Review</span>
            <h1 className="text-6xl font-bold tracking-tighter uppercase">Your Cart</h1>
          </div>
          <p className="text-sm font-mono opacity-40 uppercase tracking-widest">
            {cartItems.length} Items in cart
          </p>
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-3 gap-20">
          {/* Cart Items List */}
          <div className="lg:col-span-2 space-y-12">
            <AnimatePresence>
              {cartItems.map((item) => (
                <motion.div 
                  key={item.id}
                  layout
                  initial={{ opacity: 0, y: 20 }}
                  animate={{ opacity: 1, y: 0 }}
                  exit={{ opacity: 0, x: -50 }}
                  className="flex flex-col sm:flex-row gap-8 pb-12 border-b border-line group"
                >
                  <Link to={`/product/${item.id}`} className="w-full sm:w-48 aspect-square bg-white border border-line overflow-hidden shrink-0">
                    <img 
                      src={item.image} 
                      alt={item.name} 
                      className="w-full h-full object-cover transition-transform duration-700 group-hover:scale-110"
                      referrerPolicy="no-referrer"
                    />
                  </Link>
                  <div className="flex-1 flex flex-col justify-between py-2">
                    <div className="flex justify-between items-start">
                      <div>
                        <p className="text-xs font-serif italic opacity-40 mb-1">{item.brand}</p>
                        <Link to={`/product/${item.id}`} className="text-2xl font-bold tracking-tighter hover:underline underline-offset-4">
                          {item.name.toUpperCase()}
                        </Link>
                        <p className="text-sm opacity-40 mt-2 max-w-sm line-clamp-2">{item.description}</p>
                      </div>
                      <p className="text-xl font-mono font-bold">${(item.price * item.quantity).toLocaleString()}</p>
                    </div>
                    
                    <div className="flex items-center justify-between mt-8">
                      <div className="flex items-center border border-line">
                        <button 
                          onClick={() => updateQuantity(item.id, -1)}
                          className="p-3 hover:bg-ink hover:text-bg transition-colors"
                        >
                          <Minus size={16} />
                        </button>
                        <span className="w-12 text-center font-mono font-bold">{item.quantity}</span>
                        <button 
                          onClick={() => updateQuantity(item.id, 1)}
                          className="p-3 hover:bg-ink hover:text-bg transition-colors"
                        >
                          <Plus size={16} />
                        </button>
                      </div>
                      <button 
                        onClick={() => removeItem(item.id)}
                        className="flex items-center gap-2 text-xs font-bold uppercase tracking-widest text-red-600 hover:opacity-60 transition-opacity"
                      >
                        <Trash2 size={16} /> Remove
                      </button>
                    </div>
                  </div>
                </motion.div>
              ))}
            </AnimatePresence>

            <div className="pt-12 grid grid-cols-1 md:grid-cols-2 gap-8">
              <div className="p-8 border border-line bg-white flex gap-6">
                <div className="w-12 h-12 border border-ink flex items-center justify-center shrink-0">
                  <Shield size={24} />
                </div>
                <div>
                  <h4 className="font-bold mb-2">Secure Checkout</h4>
                  <p className="text-xs opacity-60 leading-relaxed">
                    Your data is protected by industry-standard encryption.
                  </p>
                </div>
              </div>
              <div className="p-8 border border-line bg-white flex gap-6">
                <div className="w-12 h-12 border border-ink flex items-center justify-center shrink-0">
                  <Zap size={24} />
                </div>
                <div>
                  <h4 className="font-bold mb-2">Fast Shipping</h4>
                  <p className="text-xs opacity-60 leading-relaxed">
                    Free express shipping on orders over $1,000.
                  </p>
                </div>
              </div>
            </div>
          </div>

          {/* Order Summary Sidebar */}
          <div className="lg:col-span-1">
            <div className="sticky top-32 border border-ink p-10 bg-white shadow-2xl">
              <h2 className="text-2xl font-bold tracking-tighter mb-10 uppercase">Order Summary</h2>
              
              <div className="space-y-6 mb-10">
                <div className="flex justify-between text-sm">
                  <span className="opacity-60 uppercase tracking-widest">Subtotal</span>
                  <span className="font-mono font-bold">${subtotal.toLocaleString()}</span>
                </div>
                <div className="flex justify-between text-sm">
                  <span className="opacity-60 uppercase tracking-widest">Shipping</span>
                  <span className="font-mono font-bold">{shipping === 0 ? 'FREE' : `$${shipping}`}</span>
                </div>
                <div className="flex justify-between text-sm">
                  <span className="opacity-60 uppercase tracking-widest">Estimated Tax</span>
                  <span className="font-mono font-bold">${tax.toLocaleString()}</span>
                </div>
                <div className="h-px bg-line" />
                <div className="flex justify-between text-xl font-bold">
                  <span className="tracking-tighter uppercase">Total</span>
                  <span className="font-mono">${total.toLocaleString()}</span>
                </div>
              </div>

              <div className="mb-10">
                <p className="text-[10px] font-bold uppercase tracking-widest opacity-40 mb-4">Promo Code</p>
                <div className="flex gap-2">
                  <input 
                    type="text" 
                    placeholder="Enter code" 
                    className="flex-1 bg-transparent border border-line px-4 py-3 text-sm focus:outline-none focus:border-ink transition-colors"
                  />
                  <button className="btn-primary px-6 py-3 text-xs uppercase tracking-widest">Apply</button>
                </div>
              </div>

              <Link to="/checkout" className="btn-primary w-full py-5 flex items-center justify-center gap-3">
                Proceed to Checkout <ArrowRight size={20} />
              </Link>

              <p className="text-[10px] text-center opacity-40 mt-6 leading-relaxed uppercase tracking-widest">
                By proceeding to checkout, you agree to our <br /> 
                <a href="#" className="underline">Terms of Service</a> and <a href="#" className="underline">Privacy Policy</a>.
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};
