import React, { useState } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { X, Copy, CheckCircle2, QrCode } from 'lucide-react';

const CheckoutModal = ({ product, isOpen, onClose }) => {
    const [step, setStep] = useState(1); // 1: Address, 2: Payment
    const [copied, setCopied] = useState(false);
    const [formData, setFormData] = useState({
        name: '',
        phone: '',
        address: '',
        pincode: '',
    });

    const upiId = "9345359725@okaxis"; // Derived from visiting card phone

    const handleCopy = () => {
        navigator.clipboard.writeText(upiId);
        setCopied(true);
        setTimeout(() => setCopied(false), 2000);
    };

    const handleNext = (e) => {
        e.preventDefault();
        setStep(2);
    };

    if (!isOpen) return null;

    return (
        <AnimatePresence>
            <div className="fixed inset-0 z-[100] flex items-center justify-center p-4">
                <motion.div
                    initial={{ opacity: 0 }}
                    animate={{ opacity: 1 }}
                    exit={{ opacity: 0 }}
                    onClick={onClose}
                    className="absolute inset-0 bg-black/90 backdrop-blur-sm"
                />

                <motion.div
                    initial={{ scale: 0.9, opacity: 0, y: 20 }}
                    animate={{ scale: 1, opacity: 1, y: 0 }}
                    exit={{ scale: 0.9, opacity: 0, y: 20 }}
                    className="relative w-full max-w-lg bg-vajra-black-light border border-vajra-gold/30 rounded-3xl overflow-hidden shadow-2xl shadow-vajra-gold/10"
                >
                    {/* Header */}
                    <div className="flex justify-between items-center p-6 border-b border-vajra-gold/10">
                        <div>
                            <h3 className="text-xl font-serif gold-text-gradient">Secure Checkout</h3>
                            <p className="text-[10px] text-gray-500 uppercase tracking-widest mt-1">
                                Step {step} of 2
                            </p>
                        </div>
                        <button onClick={onClose} className="p-2 hover:bg-white/5 rounded-full transition-colors text-vajra-gold">
                            <X size={24} />
                        </button>
                    </div>

                    <div className="p-8">
                        {step === 1 ? (
                            <form onSubmit={handleNext} className="space-y-4">
                                <div className="p-4 bg-vajra-black border border-vajra-gold/10 rounded-xl flex items-center gap-4 mb-6">
                                    <img src={product.image} className="w-16 h-16 rounded-lg object-cover" />
                                    <div>
                                        <div className="text-sm font-bold">{product.name}</div>
                                        <div className="text-vajra-gold font-bold">₹{product.price}</div>
                                    </div>
                                </div>

                                <div className="grid grid-cols-1 gap-4">
                                    <input
                                        required
                                        type="text"
                                        placeholder="Full Name"
                                        className="w-full bg-vajra-black border border-vajra-gold/20 rounded-xl px-4 py-3 focus:border-vajra-gold outline-none transition-all"
                                        onChange={(e) => setFormData({ ...formData, name: e.target.value })}
                                    />
                                    <input
                                        required
                                        type="tel"
                                        placeholder="Phone Number"
                                        className="w-full bg-vajra-black border border-vajra-gold/20 rounded-xl px-4 py-3 focus:border-vajra-gold outline-none transition-all"
                                        onChange={(e) => setFormData({ ...formData, phone: e.target.value })}
                                    />
                                    <textarea
                                        required
                                        placeholder="Full Delivery Address"
                                        rows="3"
                                        className="w-full bg-vajra-black border border-vajra-gold/20 rounded-xl px-4 py-3 focus:border-vajra-gold outline-none transition-all"
                                        onChange={(e) => setFormData({ ...formData, address: e.target.value })}
                                    ></textarea>
                                    <input
                                        required
                                        type="text"
                                        placeholder="Pincode"
                                        className="w-full bg-vajra-black border border-vajra-gold/20 rounded-xl px-4 py-3 focus:border-vajra-gold outline-none transition-all"
                                        onChange={(e) => setFormData({ ...formData, pincode: e.target.value })}
                                    />
                                </div>

                                <button type="submit" className="w-full btn-gold !rounded-xl mt-4">
                                    Proceed to Payment
                                </button>
                            </form>
                        ) : (
                            <div className="text-center">
                                <QrCode size={180} className="mx-auto text-vajra-gold mb-6 border-4 border-vajra-gold/20 p-2 rounded-2xl" />

                                <div className="p-4 bg-vajra-black rounded-2xl border border-vajra-gold/10 mb-8">
                                    <div className="text-xs text-gray-500 uppercase tracking-widest mb-2">UPI ID</div>
                                    <div className="flex items-center justify-between gap-4 px-4">
                                        <span className="font-mono text-vajra-gold">{upiId}</span>
                                        <button onClick={handleCopy} className="p-2 hover:bg-white/5 rounded-lg text-vajra-gold">
                                            {copied ? <CheckCircle2 size={20} className="text-green-500" /> : <Copy size={20} />}
                                        </button>
                                    </div>
                                </div>

                                <div className="bg-red-500/10 border border-red-500/20 p-4 rounded-xl text-xs text-red-200 mb-8 flex items-start gap-3 text-left leading-relaxed">
                                    <ShieldCheck size={28} className="shrink-0 text-red-500" />
                                    <span>After payment, you MUST submit the Transaction ID in the next step to confirm your order.</span>
                                </div>

                                <button
                                    onClick={() => window.open(`https://docs.google.com/forms/your-form-link?usp=pp_url&entry.1=${formData.name}&entry.2=${formData.phone}`, '_blank')}
                                    className="w-full btn-gold !rounded-xl"
                                >
                                    I have Paid - Submit Details
                                </button>
                            </div>
                        )}
                    </div>
                </motion.div>
            </div>
        </AnimatePresence>
    );
};

export default CheckoutModal;
