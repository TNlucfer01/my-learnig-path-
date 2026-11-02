import React from 'react';
import { Link } from 'react-router-dom';
import { motion } from 'motion/react';
import { Check, ArrowRight, Package, Truck, Calendar, ShoppingBag } from 'lucide-react';

export const OrderConfirmation: React.FC = () => {
  return (
    <div className="pt-40 pb-20 min-h-screen bg-bg">
      <div className="max-w-3xl mx-auto px-6 text-center">
        <motion.div 
          initial={{ scale: 0.8, opacity: 0 }}
          animate={{ scale: 1, opacity: 1 }}
          transition={{ type: "spring", damping: 12 }}
          className="w-24 h-24 bg-ink text-bg flex items-center justify-center mx-auto mb-10 shadow-2xl"
        >
          <Check size={48} strokeWidth={3} />
        </motion.div>

        <span className="font-serif italic text-2xl mb-6 block opacity-60">Success</span>
        <h1 className="text-6xl md:text-7xl font-bold tracking-tighter uppercase mb-10">
          ORDER <br /> CONFIRMED
        </h1>
        
        <p className="text-lg opacity-60 mb-12 max-w-md mx-auto">
          Thank you for your purchase. Your precision instruments are being prepared for dispatch.
        </p>

        <div className="grid grid-cols-1 md:grid-cols-2 gap-6 mb-16 text-left">
          <div className="p-8 border border-line bg-white shadow-sm">
            <p className="text-[10px] font-bold uppercase tracking-widest opacity-40 mb-4">Order ID</p>
            <p className="text-xl font-mono font-bold">ORD-2026-8842</p>
          </div>
          <div className="p-8 border border-line bg-white shadow-sm">
            <p className="text-[10px] font-bold uppercase tracking-widest opacity-40 mb-4">Estimated Delivery</p>
            <p className="text-xl font-bold uppercase tracking-tighter">March 24, 2026</p>
          </div>
          <div className="p-8 border border-line bg-white shadow-sm">
            <p className="text-[10px] font-bold uppercase tracking-widest opacity-40 mb-4">Shipping Method</p>
            <div className="flex items-center gap-3">
              <Truck size={18} />
              <p className="text-sm font-bold uppercase tracking-widest">Express Delivery</p>
            </div>
          </div>
          <div className="p-8 border border-line bg-white shadow-sm">
            <p className="text-[10px] font-bold uppercase tracking-widest opacity-40 mb-4">Payment Status</p>
            <div className="flex items-center gap-3">
              <Check size={18} className="text-green-600" />
              <p className="text-sm font-bold uppercase tracking-widest text-green-600">Authorized</p>
            </div>
          </div>
        </div>

        <div className="flex flex-col sm:flex-row gap-4">
          <Link to="/order-progress" className="flex-1 btn-primary py-5 flex items-center justify-center gap-3">
            Track Order <ArrowRight size={20} />
          </Link>
          <Link to="/" className="flex-1 btn-outline py-5 flex items-center justify-center gap-3">
            Continue Shopping <ShoppingBag size={20} />
          </Link>
        </div>

        <div className="mt-20 pt-10 border-t border-line">
          <p className="text-[10px] opacity-40 uppercase tracking-widest leading-relaxed">
            A confirmation email has been sent to your inbox. <br />
            If you have any questions, please contact our <a href="#" className="underline">Support Team</a>.
          </p>
        </div>
      </div>
    </div>
  );
};
