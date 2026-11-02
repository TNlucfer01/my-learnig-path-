import React, { useState } from 'react';
import Navbar from './components/Navbar';
import Hero from './components/Hero';
import ProductGrid from './components/ProductGrid';
import { About, FAQ } from './components/InfoSections';
import Footer from './components/Footer';
import CheckoutModal from './components/CheckoutModal';

function App() {
  const [selectedProduct, setSelectedProduct] = useState(null);
  const [isModalOpen, setIsModalOpen] = useState(false);

  const handleBuyNow = (product) => {
    setSelectedProduct(product);
    setIsModalOpen(true);
  };

  return (
    <div className="min-h-screen bg-vajra-black text-vajra-white selection:bg-vajra-gold selection:text-vajra-black">
      <Navbar />

      <main>
        <Hero />

        <div className="relative group">
          <div className="absolute inset-x-0 -top-40 -bottom-40 bg-gradient-to-b from-transparent via-vajra-gold/5 to-transparent pointer-events-none opacity-0 group-hover:opacity-100 transition-opacity duration-1000"></div>
          <ProductGrid onBuyNow={handleBuyNow} />
        </div>

        <About />

        <FAQ />
      </main>

      <Footer />

      <CheckoutModal
        product={selectedProduct}
        isOpen={isModalOpen}
        onClose={() => setIsModalOpen(false)}
      />
    </div>
  );
}

export default App;
