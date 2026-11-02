import React, { useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { motion, AnimatePresence } from 'motion/react';
import { ArrowRight, Check, Shield, Zap, CreditCard, Truck, MapPin, Search } from 'lucide-react';
import { PRODUCTS } from '../constants';

export const Checkout: React.FC = () => {
  const navigate = useNavigate();
  const [step, setStep] = useState(1);
  const [formData, setFormData] = useState({
    firstName: '',
    lastName: '',
    email: '',
    address: '',
    city: '',
    zip: '',
    country: 'United States',
    deliveryMethod: 'Standard',
    cardNumber: '',
    expiry: '',
    cvv: ''
  });

  const handleInputChange = (e: React.ChangeEvent<HTMLInputElement | HTMLSelectElement>) => {
    const { name, value } = e.target;
    setFormData(prev => ({ ...prev, [name]: value }));
  };

  const nextStep = () => setStep(prev => Math.min(4, prev + 1));
  const prevStep = () => setStep(prev => Math.max(1, prev - 1));

  const steps = [
    { id: 1, name: 'Shipping', icon: MapPin },
    { id: 2, name: 'Delivery', icon: Truck },
    { id: 3, name: 'Payment', icon: CreditCard },
    { id: 4, name: 'Review', icon: Search },
  ];

  const cartItems = [
    { ...PRODUCTS[0], quantity: 1 },
    { ...PRODUCTS[1], quantity: 1 },
  ];

  const subtotal = cartItems.reduce((acc, item) => acc + item.price * item.quantity, 0);
  const shipping = formData.deliveryMethod === 'Express' ? 50 : 0;
  const tax = subtotal * 0.08;
  const total = subtotal + shipping + tax;

  return (
    <div className="pt-32 pb-20">
      <div className="max-w-7xl mx-auto px-6">
        <div className="flex flex-col md:flex-row justify-between items-end mb-16 gap-8">
          <div>
            <span className="font-serif italic text-lg mb-2 block opacity-60">Checkout</span>
            <h1 className="text-6xl font-bold tracking-tighter uppercase">Finalize Order</h1>
          </div>
          
          {/* Step Indicator */}
          <div className="flex items-center gap-4">
            {steps.map((s, i) => (
              <React.Fragment key={s.id}>
                <div className="flex flex-col items-center gap-2">
                  <div 
                    className={`w-10 h-10 border flex items-center justify-center transition-all ${
                      step >= s.id ? 'bg-ink text-bg border-ink' : 'border-line opacity-40'
                    }`}
                  >
                    {step > s.id ? <Check size={18} /> : <s.icon size={18} />}
                  </div>
                  <span className={`text-[10px] font-bold uppercase tracking-widest ${
                    step >= s.id ? 'opacity-100' : 'opacity-40'
                  }`}>
                    {s.name}
                  </span>
                </div>
                {i < steps.length - 1 && (
                  <div className={`w-8 h-px mb-6 ${step > s.id ? 'bg-ink' : 'bg-line opacity-40'}`} />
                )}
              </React.Fragment>
            ))}
          </div>
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-3 gap-20">
          {/* Main Form Area */}
          <div className="lg:col-span-2">
            <AnimatePresence mode="wait">
              {step === 1 && (
                <motion.div 
                  key="step1"
                  initial={{ opacity: 0, x: -20 }}
                  animate={{ opacity: 1, x: 0 }}
                  exit={{ opacity: 0, x: 20 }}
                  className="space-y-12"
                >
                  <h2 className="text-3xl font-bold tracking-tighter uppercase">Shipping Address</h2>
                  <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
                    <div className="space-y-2">
                      <label className="text-[10px] font-bold uppercase tracking-widest opacity-40">First Name</label>
                      <input 
                        type="text" name="firstName" value={formData.firstName} onChange={handleInputChange}
                        className="w-full bg-transparent border border-line px-4 py-4 focus:outline-none focus:border-ink transition-colors"
                      />
                    </div>
                    <div className="space-y-2">
                      <label className="text-[10px] font-bold uppercase tracking-widest opacity-40">Last Name</label>
                      <input 
                        type="text" name="lastName" value={formData.lastName} onChange={handleInputChange}
                        className="w-full bg-transparent border border-line px-4 py-4 focus:outline-none focus:border-ink transition-colors"
                      />
                    </div>
                    <div className="md:col-span-2 space-y-2">
                      <label className="text-[10px] font-bold uppercase tracking-widest opacity-40">Email Address</label>
                      <input 
                        type="email" name="email" value={formData.email} onChange={handleInputChange}
                        className="w-full bg-transparent border border-line px-4 py-4 focus:outline-none focus:border-ink transition-colors"
                      />
                    </div>
                    <div className="md:col-span-2 space-y-2">
                      <label className="text-[10px] font-bold uppercase tracking-widest opacity-40">Street Address</label>
                      <input 
                        type="text" name="address" value={formData.address} onChange={handleInputChange}
                        className="w-full bg-transparent border border-line px-4 py-4 focus:outline-none focus:border-ink transition-colors"
                      />
                    </div>
                    <div className="space-y-2">
                      <label className="text-[10px] font-bold uppercase tracking-widest opacity-40">City</label>
                      <input 
                        type="text" name="city" value={formData.city} onChange={handleInputChange}
                        className="w-full bg-transparent border border-line px-4 py-4 focus:outline-none focus:border-ink transition-colors"
                      />
                    </div>
                    <div className="space-y-2">
                      <label className="text-[10px] font-bold uppercase tracking-widest opacity-40">ZIP / Postal Code</label>
                      <input 
                        type="text" name="zip" value={formData.zip} onChange={handleInputChange}
                        className="w-full bg-transparent border border-line px-4 py-4 focus:outline-none focus:border-ink transition-colors"
                      />
                    </div>
                  </div>
                  <button onClick={nextStep} className="btn-primary w-full py-5 flex items-center justify-center gap-3">
                    Continue to Delivery <ArrowRight size={20} />
                  </button>
                </motion.div>
              )}

              {step === 2 && (
                <motion.div 
                  key="step2"
                  initial={{ opacity: 0, x: -20 }}
                  animate={{ opacity: 1, x: 0 }}
                  exit={{ opacity: 0, x: 20 }}
                  className="space-y-12"
                >
                  <h2 className="text-3xl font-bold tracking-tighter uppercase">Delivery Method</h2>
                  <div className="space-y-4">
                    {[
                      { id: 'Standard', name: 'Standard Shipping', time: '3-5 Business Days', price: 'FREE' },
                      { id: 'Express', name: 'Express Shipping', time: '1-2 Business Days', price: '$50.00' },
                    ].map((method) => (
                      <label 
                        key={method.id}
                        className={`flex items-center justify-between p-8 border cursor-pointer transition-all ${
                          formData.deliveryMethod === method.id ? 'border-ink bg-white shadow-xl' : 'border-line hover:border-ink/40'
                        }`}
                      >
                        <div className="flex items-center gap-6">
                          <input 
                            type="radio" name="deliveryMethod" value={method.id} 
                            checked={formData.deliveryMethod === method.id}
                            onChange={handleInputChange}
                            className="w-5 h-5 accent-ink"
                          />
                          <div>
                            <p className="font-bold uppercase tracking-widest">{method.name}</p>
                            <p className="text-xs opacity-40 mt-1">{method.time}</p>
                          </div>
                        </div>
                        <p className="font-mono font-bold">{method.price}</p>
                      </label>
                    ))}
                  </div>
                  <div className="flex gap-4">
                    <button onClick={prevStep} className="btn-outline flex-1 py-5">Back</button>
                    <button onClick={nextStep} className="btn-primary flex-1 py-5 flex items-center justify-center gap-3">
                      Continue to Payment <ArrowRight size={20} />
                    </button>
                  </div>
                </motion.div>
              )}

              {step === 3 && (
                <motion.div 
                  key="step3"
                  initial={{ opacity: 0, x: -20 }}
                  animate={{ opacity: 1, x: 0 }}
                  exit={{ opacity: 0, x: 20 }}
                  className="space-y-12"
                >
                  <h2 className="text-3xl font-bold tracking-tighter uppercase">Payment Details</h2>
                  <div className="space-y-8">
                    <div className="p-8 border border-ink bg-ink text-bg flex items-center justify-between">
                      <div className="flex items-center gap-4">
                        <CreditCard size={24} />
                        <span className="font-bold uppercase tracking-widest">Credit / Debit Card</span>
                      </div>
                      <div className="flex gap-2">
                        <div className="w-8 h-5 bg-white/20 rounded-sm" />
                        <div className="w-8 h-5 bg-white/20 rounded-sm" />
                        <div className="w-8 h-5 bg-white/20 rounded-sm" />
                      </div>
                    </div>

                    <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
                      <div className="md:col-span-2 space-y-2">
                        <label className="text-[10px] font-bold uppercase tracking-widest opacity-40">Card Number</label>
                        <input 
                          type="text" name="cardNumber" value={formData.cardNumber} onChange={handleInputChange}
                          placeholder="0000 0000 0000 0000"
                          className="w-full bg-transparent border border-line px-4 py-4 focus:outline-none focus:border-ink transition-colors font-mono"
                        />
                      </div>
                      <div className="space-y-2">
                        <label className="text-[10px] font-bold uppercase tracking-widest opacity-40">Expiry Date</label>
                        <input 
                          type="text" name="expiry" value={formData.expiry} onChange={handleInputChange}
                          placeholder="MM / YY"
                          className="w-full bg-transparent border border-line px-4 py-4 focus:outline-none focus:border-ink transition-colors font-mono"
                        />
                      </div>
                      <div className="space-y-2">
                        <label className="text-[10px] font-bold uppercase tracking-widest opacity-40">CVV</label>
                        <input 
                          type="text" name="cvv" value={formData.cvv} onChange={handleInputChange}
                          placeholder="000"
                          className="w-full bg-transparent border border-line px-4 py-4 focus:outline-none focus:border-ink transition-colors font-mono"
                        />
                      </div>
                    </div>
                  </div>
                  <div className="flex gap-4">
                    <button onClick={prevStep} className="btn-outline flex-1 py-5">Back</button>
                    <button onClick={nextStep} className="btn-primary flex-1 py-5 flex items-center justify-center gap-3">
                      Review Order <ArrowRight size={20} />
                    </button>
                  </div>
                </motion.div>
              )}

              {step === 4 && (
                <motion.div 
                  key="step4"
                  initial={{ opacity: 0, x: -20 }}
                  animate={{ opacity: 1, x: 0 }}
                  exit={{ opacity: 0, x: 20 }}
                  className="space-y-12"
                >
                  <h2 className="text-3xl font-bold tracking-tighter uppercase">Review Your Order</h2>
                  
                  <div className="grid grid-cols-1 md:grid-cols-2 gap-12">
                    <div className="space-y-4">
                      <h4 className="text-[10px] font-bold uppercase tracking-widest opacity-40">Shipping To</h4>
                      <p className="font-medium">{formData.firstName} {formData.lastName}</p>
                      <p className="text-sm opacity-60">{formData.address}</p>
                      <p className="text-sm opacity-60">{formData.city}, {formData.zip}</p>
                      <p className="text-sm opacity-60">{formData.country}</p>
                    </div>
                    <div className="space-y-4">
                      <h4 className="text-[10px] font-bold uppercase tracking-widest opacity-40">Delivery Method</h4>
                      <p className="font-medium">{formData.deliveryMethod} Shipping</p>
                      <p className="text-sm opacity-60">
                        {formData.deliveryMethod === 'Express' ? '1-2 Business Days' : '3-5 Business Days'}
                      </p>
                    </div>
                    <div className="space-y-4">
                      <h4 className="text-[10px] font-bold uppercase tracking-widest opacity-40">Payment Method</h4>
                      <p className="font-medium">Credit Card ending in {formData.cardNumber.slice(-4) || '4242'}</p>
                    </div>
                  </div>

                  <div className="flex gap-4">
                    <button onClick={prevStep} className="btn-outline flex-1 py-5">Back</button>
                    <button 
                      onClick={() => navigate('/order-confirmation')}
                      className="btn-primary flex-1 py-5 flex items-center justify-center gap-3"
                    >
                      Place Order <ArrowRight size={20} />
                    </button>
                  </div>
                </motion.div>
              )}
            </AnimatePresence>
          </div>

          {/* Order Summary Sidebar */}
          <div className="lg:col-span-1">
            <div className="sticky top-32 border border-line p-10 bg-white shadow-xl">
              <h2 className="text-xl font-bold tracking-tighter mb-10 uppercase">Order Summary</h2>
              
              <div className="space-y-6 mb-10">
                {cartItems.map((item) => (
                  <div key={item.id} className="flex gap-4">
                    <div className="w-16 h-16 border border-line shrink-0">
                      <img src={item.image} alt={item.name} className="w-full h-full object-cover" referrerPolicy="no-referrer" />
                    </div>
                    <div className="flex-1">
                      <p className="text-xs font-bold tracking-tighter line-clamp-1 uppercase">{item.name}</p>
                      <p className="text-[10px] opacity-40 mt-1 uppercase tracking-widest">Qty: {item.quantity}</p>
                      <p className="text-xs font-mono font-bold mt-1">${(item.price * item.quantity).toLocaleString()}</p>
                    </div>
                  </div>
                ))}
              </div>

              <div className="h-px bg-line mb-10" />

              <div className="space-y-4 mb-10">
                <div className="flex justify-between text-xs">
                  <span className="opacity-60 uppercase tracking-widest">Subtotal</span>
                  <span className="font-mono font-bold">${subtotal.toLocaleString()}</span>
                </div>
                <div className="flex justify-between text-xs">
                  <span className="opacity-60 uppercase tracking-widest">Shipping</span>
                  <span className="font-mono font-bold">{shipping === 0 ? 'FREE' : `$${shipping.toFixed(2)}`}</span>
                </div>
                <div className="flex justify-between text-xs">
                  <span className="opacity-60 uppercase tracking-widest">Tax</span>
                  <span className="font-mono font-bold">${tax.toLocaleString()}</span>
                </div>
                <div className="h-px bg-line" />
                <div className="flex justify-between text-lg font-bold">
                  <span className="tracking-tighter uppercase">Total</span>
                  <span className="font-mono">${total.toLocaleString()}</span>
                </div>
              </div>

              <div className="p-6 border border-line bg-bg/50 space-y-4">
                <div className="flex gap-4 items-center">
                  <Shield size={16} className="opacity-40" />
                  <p className="text-[10px] opacity-60 uppercase tracking-widest">3-Year Precision Warranty</p>
                </div>
                <div className="flex gap-4 items-center">
                  <Zap size={16} className="opacity-40" />
                  <p className="text-[10px] opacity-60 uppercase tracking-widest">Next-Day Dispatch</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};
