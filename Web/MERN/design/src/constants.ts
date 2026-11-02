import { Product } from './types';

export const PRODUCTS: Product[] = [
  {
    id: '1',
    name: 'Precision Architect Pro 16',
    brand: 'ELECTRA',
    price: 2499,
    category: 'Laptops',
    image: 'https://picsum.photos/seed/laptop1/800/600',
    rating: 4.9,
    reviews: 128,
    description: 'The ultimate workstation for architects and designers. Featuring a 4K OLED display with 100% DCI-P3 coverage and the latest M3 Ultra chip.',
    specs: {
      'Processor': 'M3 Ultra 16-core',
      'Memory': '64GB Unified Memory',
      'Storage': '2TB SSD',
      'Display': '16" 4K OLED HDR'
    },
    features: ['Precision Trackpad', 'MagSafe 3', 'Thunderbolt 4', 'Studio Quality Mics'],
    isTrending: true
  },
  {
    id: '2',
    name: 'Studio Monitor X-27',
    brand: 'ELECTRA',
    price: 899,
    category: 'Monitors',
    image: 'https://picsum.photos/seed/monitor/800/600',
    rating: 4.8,
    reviews: 85,
    description: 'Reference-grade color accuracy for professional workflows. Factory calibrated to Delta E < 1.',
    specs: {
      'Resolution': '5K (5120 x 2880)',
      'Brightness': '600 nits',
      'Panel': 'IPS Black'
    },
    features: ['99% Adobe RGB', 'Hardware Calibration', 'USB-C Power Delivery'],
    isTrending: true
  },
  {
    id: '3',
    name: 'Mechanical Precision Keyboard',
    brand: 'ELECTRA',
    price: 199,
    category: 'Peripherals',
    image: 'https://picsum.photos/seed/keyboard/800/600',
    rating: 4.7,
    reviews: 210,
    description: 'Tactile feedback meets industrial design. Machined from a single block of aluminum.',
    specs: {
      'Switches': 'Custom Brown Tactile',
      'Keycaps': 'PBT Double-shot',
      'Connection': 'Wired/Wireless'
    },
    features: ['Hot-swappable', 'RGB Backlit', 'Programmable Knobs']
  },
  {
    id: '4',
    name: 'Wireless Precision Mouse',
    brand: 'ELECTRA',
    price: 129,
    category: 'Peripherals',
    image: 'https://picsum.photos/seed/mouse/800/600',
    rating: 4.6,
    reviews: 150,
    description: 'Ergonomic excellence for long hours of CAD work. 26,000 DPI sensor.',
    specs: {
      'Sensor': 'Optical Precision Gen 2',
      'Battery': '70 hours',
      'Weight': '63g'
    },
    features: ['PTFE Feet', '8 Programmable Buttons', 'Fast Charging']
  }
];

export const CATEGORIES = [
  { name: 'Laptops', icon: 'Laptop', count: 24 },
  { name: 'Monitors', icon: 'Monitor', count: 12 },
  { name: 'Peripherals', icon: 'Mouse', count: 48 },
  { name: 'Storage', icon: 'HardDrive', count: 18 },
  { name: 'Audio', icon: 'Headphones', count: 32 },
  { name: 'Components', icon: 'Cpu', count: 56 }
];
