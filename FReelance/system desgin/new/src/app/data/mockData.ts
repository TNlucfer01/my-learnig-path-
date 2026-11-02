export interface Product {
  id: string;
  name: string;
  category: string;
  price: number;
  image: string;
  description: string;
  features: string[];
  inStock: boolean;
  isNewArrival?: boolean;
  isOffer?: boolean;
  originalPrice?: number;
}

export interface Category {
  id: string;
  name: string;
  image: string;
  productCount: number;
}

export const categories: Category[] = [
  {
    id: "new-arrivals",
    name: "New Arrivals",
    image: "https://images.unsplash.com/photo-1740803292814-13d2e35924c3?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&w=800",
    productCount: 12
  },
  {
    id: "electronics",
    name: "Electronics",
    image: "https://images.unsplash.com/photo-1740803292814-13d2e35924c3?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&w=800",
    productCount: 45
  },
  {
    id: "fashion",
    name: "Fashion",
    image: "https://images.unsplash.com/photo-1763824969015-e5d1d6755782?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&w=800",
    productCount: 120
  },
  {
    id: "home-decor",
    name: "Home & Decor",
    image: "https://images.unsplash.com/photo-1567016432779-094069958ea5?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&w=800",
    productCount: 78
  },
  {
    id: "sports",
    name: "Sports",
    image: "https://images.unsplash.com/photo-1668361920298-e3ebb0798819?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&w=800",
    productCount: 56
  },
  {
    id: "beauty",
    name: "Beauty",
    image: "https://images.unsplash.com/photo-1630331811881-58a6f87bf7f2?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&w=800",
    productCount: 89
  }
];

export const products: Product[] = [
  // New Arrivals & Electronics
  {
    id: "1",
    name: "Wireless Noise-Canceling Headphones",
    category: "electronics",
    price: 299.99,
    image: "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=800",
    description: "Premium wireless headphones with active noise cancellation and 30-hour battery life.",
    features: ["Active Noise Cancellation", "30-hour battery", "Bluetooth 5.0", "Premium sound quality"],
    inStock: true,
    isNewArrival: true
  },
  {
    id: "2",
    name: "Smart Watch Pro",
    category: "electronics",
    price: 399.99,
    image: "https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=800",
    description: "Advanced fitness tracking with heart rate monitoring and GPS.",
    features: ["GPS tracking", "Heart rate monitor", "Water resistant", "7-day battery"],
    inStock: true,
    isNewArrival: true,
    isOffer: true,
    originalPrice: 499.99
  },
  {
    id: "3",
    name: "4K Ultra HD Camera",
    category: "electronics",
    price: 1299.99,
    image: "https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f?w=800",
    description: "Professional mirrorless camera with 4K video recording.",
    features: ["4K Video", "24MP sensor", "Interchangeable lens", "Wi-Fi connectivity"],
    inStock: true,
    isNewArrival: true
  },
  {
    id: "4",
    name: "Portable Bluetooth Speaker",
    category: "electronics",
    price: 79.99,
    image: "https://images.unsplash.com/photo-1608043152269-423dbba4e7e1?w=800",
    description: "Waterproof speaker with 360-degree sound and 12-hour battery.",
    features: ["Waterproof IPX7", "360° sound", "12-hour battery", "USB-C charging"],
    inStock: true
  },
  
  // Fashion
  {
    id: "5",
    name: "Classic Leather Jacket",
    category: "fashion",
    price: 249.99,
    image: "https://images.unsplash.com/photo-1551028719-00167b16eac5?w=800",
    description: "Timeless leather jacket with premium quality and perfect fit.",
    features: ["Genuine leather", "Multiple pockets", "Available in 5 colors", "Premium lining"],
    inStock: true,
    isNewArrival: true
  },
  {
    id: "6",
    name: "Designer Sunglasses",
    category: "fashion",
    price: 159.99,
    image: "https://images.unsplash.com/photo-1572635196237-14b3f281503f?w=800",
    description: "UV protection sunglasses with polarized lenses.",
    features: ["UV400 protection", "Polarized lenses", "Lightweight frame", "Scratch resistant"],
    inStock: true,
    isOffer: true,
    originalPrice: 199.99
  },
  {
    id: "7",
    name: "Cotton T-Shirt Collection",
    category: "fashion",
    price: 29.99,
    image: "https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=800",
    description: "Premium cotton t-shirts in various colors and sizes.",
    features: ["100% cotton", "Breathable fabric", "Machine washable", "10 color options"],
    inStock: true
  },
  {
    id: "8",
    name: "Denim Jeans Premium",
    category: "fashion",
    price: 89.99,
    image: "https://images.unsplash.com/photo-1542272604-787c3835535d?w=800",
    description: "Comfortable and durable denim jeans with stretch fabric.",
    features: ["Stretch denim", "Durable construction", "Multiple fits", "Fade resistant"],
    inStock: true
  },

  // Home & Decor
  {
    id: "9",
    name: "Modern Table Lamp",
    category: "home-decor",
    price: 79.99,
    image: "https://images.unsplash.com/photo-1507473885765-e6ed057f782c?w=800",
    description: "Elegant table lamp with adjustable brightness.",
    features: ["Dimmable LED", "Touch control", "Energy efficient", "Modern design"],
    inStock: true,
    isNewArrival: true
  },
  {
    id: "10",
    name: "Decorative Wall Art Set",
    category: "home-decor",
    price: 149.99,
    image: "https://images.unsplash.com/photo-1513519245088-0e12902e35ca?w=800",
    description: "Set of 3 canvas prints for modern home decoration.",
    features: ["Set of 3 pieces", "High-quality canvas", "Ready to hang", "Multiple designs"],
    inStock: true
  },
  {
    id: "11",
    name: "Luxury Throw Pillows",
    category: "home-decor",
    price: 49.99,
    image: "https://images.unsplash.com/photo-1584100936595-c0654b55a2e2?w=800",
    description: "Set of 2 velvet throw pillows for sofa and bed.",
    features: ["Velvet fabric", "Set of 2", "Hidden zipper", "Multiple colors"],
    inStock: true,
    isOffer: true,
    originalPrice: 69.99
  },

  // Sports
  {
    id: "12",
    name: "Yoga Mat Premium",
    category: "sports",
    price: 39.99,
    image: "https://images.unsplash.com/photo-1601925260368-ae2f83cf8b7f?w=800",
    description: "Non-slip yoga mat with extra cushioning for comfort.",
    features: ["Non-slip surface", "Extra thick 6mm", "Eco-friendly", "Carrying strap"],
    inStock: true,
    isNewArrival: true
  },
  {
    id: "13",
    name: "Adjustable Dumbbells Set",
    category: "sports",
    price: 199.99,
    image: "https://images.unsplash.com/photo-1638647872445-a1ff36a4e77d?w=800",
    description: "Space-saving adjustable dumbbells from 5 to 52.5 lbs.",
    features: ["15 weight settings", "Space efficient", "Durable construction", "Quick adjustment"],
    inStock: true
  },
  {
    id: "14",
    name: "Running Shoes Pro",
    category: "sports",
    price: 129.99,
    image: "https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800",
    description: "Lightweight running shoes with superior cushioning.",
    features: ["Breathable mesh", "Responsive cushioning", "Durable outsole", "Lightweight design"],
    inStock: true
  },

  // Beauty
  {
    id: "15",
    name: "Skincare Set Premium",
    category: "beauty",
    price: 89.99,
    image: "https://images.unsplash.com/photo-1556228578-dd0a2ab9084b?w=800",
    description: "Complete skincare routine set with natural ingredients.",
    features: ["Natural ingredients", "6-piece set", "All skin types", "Cruelty-free"],
    inStock: true,
    isNewArrival: true
  },
  {
    id: "16",
    name: "Makeup Brush Set",
    category: "beauty",
    price: 59.99,
    image: "https://images.unsplash.com/photo-1512496015851-a90fb38ba796?w=800",
    description: "Professional 12-piece makeup brush set with case.",
    features: ["12 brushes", "Synthetic bristles", "Travel case", "Easy to clean"],
    inStock: true,
    isOffer: true,
    originalPrice: 79.99
  },
  {
    id: "17",
    name: "Hair Dryer Professional",
    category: "beauty",
    price: 149.99,
    image: "https://images.unsplash.com/photo-1522338140262-f46f5913618a?w=800",
    description: "Ionic hair dryer with multiple heat settings.",
    features: ["Ionic technology", "Fast drying", "3 heat settings", "Cool shot button"],
    inStock: true
  },
  {
    id: "18",
    name: "Fragrance Collection",
    category: "beauty",
    price: 119.99,
    image: "https://images.unsplash.com/photo-1541643600914-78b084683601?w=800",
    description: "Set of 3 luxury fragrances for different occasions.",
    features: ["3 x 30ml bottles", "Long-lasting", "Gift box included", "Variety of scents"],
    inStock: true
  }
];
