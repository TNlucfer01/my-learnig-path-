import React, { useState } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { ChevronDown, ShieldCheck, Heart, Sparkles } from 'lucide-react';

export const About = () => {
    return (
        <section id="about" className="py-24 bg-[#111111]">
            <div className="container mx-auto px-6">
                <div className="grid grid-cols-1 lg:grid-cols-2 gap-16 items-center">
                    <motion.div
                        initial={{ opacity: 0, x: -50 }}
                        whileInView={{ opacity: 1, x: 0 }}
                        className="relative"
                    >
                        <img
                            src="https://images.unsplash.com/photo-1549490349-8643362247b5?auto=format&fit=crop&q=80&w=800"
                            className="rounded-3xl border border-vajra-gold/20 shadow-2xl shadow-vajra-gold/5"
                            alt="About Vajra"
                        />
                        <div className="absolute -bottom-10 -right-10 bg-gold-gradient p-1 rounded-3xl hidden md:block">
                            <div className="bg-vajra-black rounded-[1.4rem] p-8 text-center">
                                <div className="text-4xl font-serif gold-text-gradient font-bold mb-1">100%</div>
                                <div className="text-[10px] uppercase tracking-widest text-gray-500 font-bold">Authentic Ebony</div>
                            </div>
                        </div>
                    </motion.div>

                    <motion.div
                        initial={{ opacity: 0, x: 50 }}
                        whileInView={{ opacity: 1, x: 0 }}
                    >
                        <h2 className="text-4xl md:text-5xl font-serif mb-8 gold-text-gradient">The Vajra Promise</h2>
                        <p className="text-gray-400 text-lg mb-8 leading-relaxed">
                            At Vajra, we believe in the power of authenticity. Our Karungali (Ebony) wood products are sourced from mature trees and handcrafted by artisans who understand the spiritual significance of every grain.
                        </p>

                        <div className="space-y-6">
                            {[
                                { icon: ShieldCheck, title: "Sustainably Sourced", desc: "We only use mature, ethically harvested Karungali wood." },
                                { icon: Sparkles, title: "Handcrafted Brilliance", desc: "Each piece is polished by hand to reveal its natural luster." },
                                { icon: Heart, title: "Spiritual Charge", desc: "Our products are designed to enhance your focus and energy." }
                            ].map((item, i) => (
                                <div key={i} className="flex gap-4">
                                    <div className="p-3 bg-vajra-gold/10 rounded-xl text-vajra-gold h-fit">
                                        <item.icon size={20} />
                                    </div>
                                    <div>
                                        <h4 className="text-white font-bold mb-1">{item.title}</h4>
                                        <p className="text-gray-500 text-sm">{item.desc}</p>
                                    </div>
                                </div>
                            ))}
                        </div>
                    </motion.div>
                </div>
            </div>
        </section>
    );
};

export const FAQ = () => {
    const [openIndex, setOpenIndex] = useState(0);
    const faqs = [
        { q: "Is the Karungali wood authentic?", a: "Yes, we use 100% authentic Ebony (Karungali) wood sourced from South India. Each product maintains the natural black color and density characteristic of real Ebony." },
        { q: "How long is the delivery time?", a: "Standard delivery takes 3-5 business days across India. Same-day shipping is available for orders placed before 12 PM." },
        { q: "How do I maintain my Karungali products?", a: "To maintain the natural shine, occasionally rub a drop of sesame or coconut oil onto the wood. Avoid using harsh chemicals." },
        { q: "Do you offer returns?", a: "Yes, we have a 7-day easy return policy for products in their original condition." }
    ];

    return (
        <section id="faq" className="py-24 bg-vajra-black">
            <div className="container mx-auto px-6 max-w-4xl">
                <div className="text-center mb-16">
                    <h2 className="text-4xl font-serif gold-text-gradient mb-4">Common Questions</h2>
                    <div className="w-20 h-1 bg-gold-gradient mx-auto opacity-50"></div>
                </div>

                <div className="space-y-4">
                    {faqs.map((faq, i) => (
                        <div key={i} className="glass-card overflow-hidden">
                            <button
                                onClick={() => setOpenIndex(openIndex === i ? null : i)}
                                className="w-full p-6 text-left flex justify-between items-center group"
                            >
                                <span className={`font-bold transition-colors ${openIndex === i ? 'text-vajra-gold' : 'text-white'}`}>
                                    {faq.q}
                                </span>
                                <ChevronDown
                                    className={`text-vajra-gold transition-transform duration-300 ${openIndex === i ? 'rotate-180' : ''}`}
                                    size={20}
                                />
                            </button>
                            <AnimatePresence>
                                {openIndex === i && (
                                    <motion.div
                                        initial={{ height: 0, opacity: 0 }}
                                        animate={{ height: 'auto', opacity: 1 }}
                                        exit={{ height: 0, opacity: 0 }}
                                    >
                                        <div className="px-6 pb-6 text-gray-400 text-sm leading-relaxed border-t border-vajra-gold/5 pt-4">
                                            {faq.a}
                                        </div>
                                    </motion.div>
                                )}
                            </AnimatePresence>
                        </div>
                    ))}
                </div>
            </div>
        </section>
    );
};
