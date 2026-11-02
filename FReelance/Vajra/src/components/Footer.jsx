import React from 'react';
import { Mail, Phone, MapPin, Instagram, Facebook } from 'lucide-react';
import logo from '../assets/logo.png';

const Footer = () => {
    return (
        <footer id="contact" className="bg-[#050505] pt-20 pb-10 border-t border-vajra-gold/10">
            <div className="container mx-auto px-6">
                <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-12 mb-16">
                    {/* Brand & Tagline */}
                    <div className="lg:col-span-1">
                        <img src={logo} alt="Vajra Logo" className="h-16 mb-6 grayscale opacity-80" />
                        <h3 className="text-2xl font-serif gold-text-gradient mb-4">VAJRA ENTERPRISES</h3>
                        <p className="text-gray-500 text-sm leading-relaxed mb-6">
                            PMA GROUPS • Bringing the purity of nature and spirituality to your doorstep with premium Karungali and natural scents.
                        </p>
                        <div className="flex space-x-4">
                            <a href="#" className="p-2 border border-vajra-gold/20 rounded-full hover:bg-vajra-gold hover:text-black transition-all">
                                <Instagram size={18} />
                            </a>
                            <a href="#" className="p-2 border border-vajra-gold/20 rounded-full hover:bg-vajra-gold hover:text-black transition-all">
                                <Facebook size={18} />
                            </a>
                        </div>
                    </div>

                    {/* Quick Links */}
                    <div>
                        <h4 className="text-vajra-gold font-bold uppercase tracking-widest text-xs mb-8">Navigation</h4>
                        <ul className="space-y-4 text-gray-400 text-sm">
                            <li><a href="#home" className="hover:text-vajra-gold transition-colors">Home</a></li>
                            <li><a href="#about" className="hover:text-vajra-gold transition-colors">Our Story</a></li>
                            <li><a href="#products" className="hover:text-vajra-gold transition-colors">Products</a></li>
                            <li><a href="#faq" className="hover:text-vajra-gold transition-colors">FAQ</a></li>
                        </ul>
                    </div>

                    {/* Contact Info (from Visiting Card) */}
                    <div className="lg:col-span-2">
                        <h4 className="text-vajra-gold font-bold uppercase tracking-widest text-xs mb-8">Contact Us</h4>
                        <div className="space-y-6">
                            <div className="flex items-start gap-4">
                                <MapPin size={24} className="text-vajra-gold shrink-0" />
                                <div className="text-gray-400 text-sm leading-relaxed">
                                    <p className="text-white font-bold mb-1">Office Address</p>
                                    147/2, Periyasami Complex, <br />
                                    Main Road, Tittakudi - 606106
                                </div>
                            </div>
                            <div className="flex items-center gap-4">
                                <Phone size={24} className="text-vajra-gold shrink-0" />
                                <div className="text-gray-400 text-sm">
                                    <p className="text-white font-bold mb-1">Call / WhatsApp</p>
                                    +91 9345359725
                                </div>
                            </div>
                            <div className="flex items-center gap-4">
                                <Mail size={24} className="text-vajra-gold shrink-0" />
                                <div className="text-gray-400 text-sm">
                                    <p className="text-white font-bold mb-1">Email</p>
                                    sambeshvarma@gmail.com
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                {/* Founder Info */}
                <div className="flex flex-col md:flex-row justify-between items-center pt-10 border-t border-vajra-gold/5 text-[10px] uppercase tracking-[0.3em] text-gray-600 font-bold">
                    <div>SambeshVarma • Founder & Proprietor</div>
                    <div className="mt-4 md:mt-0">© 2026 Vajra Enterprises • All Rights Reserved</div>
                </div>
            </div>
        </footer>
    );
};

export default Footer;
