export interface Product {
  id: string;
  name: string;
  category: string;
  price: number;
  image: string;
  description: string;
  specs?: string[];
  tag?: string;
}

export interface Stat {
  label: string;
  value: string;
}

export interface Principle {
  title: string;
  description: string;
  icon: string;
}
