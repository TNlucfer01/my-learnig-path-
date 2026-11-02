import React, { useState, useEffect } from 'react';
import { Menu, X, Phone } from 'lucide-react';
import logo from '../assets/logo.png';

const Navbar = () => {
    const [isScrolled, setIsScrolled] = useState(false);
    const [isMenuOpen, setIsMenuOpen] = useState(false);

    useEffect(() => {
        const handleScroll = () => {
            setIsScrolled(window.scrollY > 20);
        };
        window.addEventListener('scroll', handleScroll);
        return () => window.removeEventListener('scroll', handleScroll);
    }, []);

    const navLinks = [
        { name: 'Home', href: '#home' },
        { name: 'About', href: '#about' },
        { name: 'Products', href: '#products' },
        { name: 'FAQ', href: '#faq' },
    ];

    return (
        <nav className={`fixed top-0 w-full z-50 transition-all duration-300 ${isScrolled ? 'bg-vajra-black/90 backdrop-blur-md border-b border-vajra-gold/20 py-3' : 'bg-transparent py-5'}`}>
            <div className="container mx-auto px-6 flex justify-between items-center">
                {/* Logo */}
                <a href="#home" className="flex items-center space-x-3 group">
                    <img src={logo} alt="Vajra Logo" className="h-10 w-auto group-hover:scale-110 transition-transform duration-300" />
                    <span className="text-2xl font-bold gold-text-gradient tracking-widest hidden md:block">VAJRA</span>
                </a>

                {/* Desktop Nav */}
                <div className="hidden md:flex items-center space-x-8">
                    {navLinks.map((link) => (
                        <a
                            key={link.name}
                            href={link.href}
                            className="text-sm uppercase tracking-widest hover:text-vajra-gold transition-colors duration-300"
                        >
                            {link.name}
                        </a>
                    ))}
                    <a
                        href="#contact"
                        className="btn-outline !py-2 !px-6 flex items-center space-x-2"
                    >
                        <Phone size={16} />
                        <span>Contact</span>
                    </a>
                </div>

                {/* Mobile Toggle */}
                <button
                    className="md:hidden text-vajra-gold"
                    onClick={() => setIsMenuOpen(!isMenuOpen)}
                >
                    {isMenuOpen ? <X size={28} /> : <Menu size={28} />}
                </button>
            </div>

            {/* Mobile Menu */}
            {isMenuOpen && (
                <div className="md:hidden absolute top-full left-0 w-full bg-vajra-black border-b border-vajra-gold/20 animate-fade-in">
                    <div className="flex flex-col p-6 space-y-4">
                        {navLinks.map((link) => (
                            <a
                                key={link.name}
                                href={link.href}
                                onClick={() => setIsMenuOpen(false)}
                                className="text-lg uppercase tracking-widest hover:text-vajra-gold"
                            >
                                {link.name}
                            </a>
                        ))}
                        <button className="btn-gold w-full">Contact Us</button>
                    </div>
                </div>
            )}
        </nav>
    );
};

export default Navbar;
