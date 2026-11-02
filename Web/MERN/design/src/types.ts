export interface Product {
  id: string;
  name: string;
  brand: string;
  price: number;
  category: string;
  image: string;
  rating: number;
  reviews: number;
  description: string;
  specs: Record<string, string>;
  features: string[];
  isTrending?: boolean;
}

export interface CartItem extends Product {
  quantity: number;
}

export interface Order {
  id: string;
  date: string;
  status: 'Processing' | 'Shipped' | 'In Transit' | 'Delivered';
  items: CartItem[];
  total: number;
  trackingId: string;
  estimatedDelivery: string;
}
