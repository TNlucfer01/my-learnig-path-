import React from 'react';
import { motion } from 'framer-motion';

const Hero = () => {
    return (
        <section id="home" className="relative h-screen flex items-center justify-center overflow-hidden">
            {/* Background Effects */}
            <div className="absolute inset-0 z-0">
                <div className="absolute inset-0 bg-gradient-to-b from-black/40 via-vajra-black/80 to-vajra-black"></div>
                <div className="absolute top-1/4 left-1/4 w-96 h-96 bg-vajra-gold/10 filter blur-[120px] rounded-full animate-pulse"></div>
                <div className="absolute bottom-1/4 right-1/4 w-96 h-96 bg-vajra-gold/5 filter blur-[150px] rounded-full"></div>
            </div>

            {/* Content */}
            <div className="container mx-auto px-6 text-center relative z-10">
                <motion.div
                    initial={{ opacity: 0, y: 30 }}
                    animate={{ opacity: 1, y: 0 }}
                    transition={{ duration: 0.8 }}
                >
                    <span className="text-vajra-gold tracking-[0.6em] mb-4 uppercase text-xs md:text-sm inline-block">
                        Pure Essence • Traditional Wisdom
                    </span>
                    <h1 className="text-5xl md:text-8xl font-serif mb-8 leading-tight">
                        Authentic <br />
                        <span className="gold-text-gradient italic">Karungali</span> Essence
                    </h1>
                    <p className="max-w-2xl mx-auto text-gray-400 text-base md:text-xl mb-12 leading-relaxed">
                        Discover the divine power of Ebony wood and artisan natural scents.
                        Handcrafted for those who seek authenticity in every breath.
                    </p>

                    <div className="flex flex-col md:flex-row items-center justify-center gap-6">
                        <a href="#products" className="btn-gold px-12">
                            Explore Collection
                        </a>
                        <a href="#about" className="btn-outline px-12">
                            Our Heritage
                        </a>
                    </div>
                </motion.div>
            </div>

            {/* Scroll Indicator */}
            <motion.div
                className="absolute bottom-10 left-1/2 -translate-x-1/2 flex flex-col items-center gap-2"
                initial={{ opacity: 0 }}
                animate={{ opacity: 1 }}
                transition={{ delay: 1.5 }}
            >
                <div className="w-[1px] h-12 bg-gradient-to-b from-transparent via-vajra-gold to-transparent"></div>
                <span className="text-[10px] tracking-widest text-vajra-gold/50 uppercase">Scroll</span>
            </motion.div>
        </section>
    );
};

export default Hero;
