import React from 'react';
import { Link } from 'react-router-dom';
import { motion } from 'motion/react';
import { 
  User, Package, Settings, LogOut, ArrowRight, 
  TrendingUp, Shield, Zap, MapPin, Clock, 
  CreditCard, Bell, Search, Menu
} from 'lucide-react';

export const Dashboard: React.FC = () => {
  const latestOrder = {
    id: 'ORD-2026-8842',
    status: 'In Transit',
    date: 'March 18, 2026',
    total: 2499,
    items: 2,
    trackingId: 'EL-TRK-9928-XJ'
  };

  return (
    <div className="pt-32 pb-20 min-h-screen bg-bg">
      <div className="max-w-7xl mx-auto px-6">
        <div className="flex flex-col md:flex-row gap-12">
          {/* Sidebar */}
          <aside className="w-full md:w-64 shrink-0 space-y-12">
            <div className="flex items-center gap-4 p-6 border border-ink bg-white shadow-xl">
              <div className="w-12 h-12 bg-ink text-bg flex items-center justify-center font-bold text-xl">
                IH
              </div>
              <div>
                <p className="text-sm font-bold tracking-tighter uppercase">Ihdaa 2006</p>
                <p className="text-[10px] opacity-40 uppercase tracking-widest">Pro Member</p>
              </div>
            </div>

            <nav className="space-y-2">
              {[
                { name: 'Overview', icon: TrendingUp, active: true },
                { name: 'My Orders', icon: Package, link: '/orders' },
                { name: 'Payment Methods', icon: CreditCard },
                { name: 'Account Settings', icon: Settings },
                { name: 'Support', icon: Bell },
              ].map((item) => (
                <Link 
                  key={item.name} 
                  to={item.link || '#'}
                  className={`flex items-center gap-4 p-4 text-sm font-bold uppercase tracking-widest transition-all ${
                    item.active ? 'bg-ink text-bg' : 'hover:bg-ink/5'
                  }`}
                >
                  <item.icon size={18} />
                  {item.name}
                </Link>
              ))}
              <button className="w-full flex items-center gap-4 p-4 text-sm font-bold uppercase tracking-widest text-red-600 hover:bg-red-50 transition-all mt-12">
                <LogOut size={18} />
                Sign Out
              </button>
            </nav>
          </aside>

          {/* Main Content */}
          <main className="flex-1 space-y-12">
            <div className="flex justify-between items-end">
              <div>
                <span className="font-serif italic text-lg mb-2 block opacity-60">Welcome back</span>
                <h1 className="text-5xl font-bold tracking-tighter uppercase">Dashboard</h1>
              </div>
              <p className="text-xs font-mono opacity-40 uppercase tracking-widest">
                Last login: 2 hours ago
              </p>
            </div>

            {/* Quick Stats */}
            <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
              <div className="p-8 border border-line bg-white shadow-sm hover:shadow-md transition-shadow">
                <p className="text-[10px] font-bold uppercase tracking-widest opacity-40 mb-4">Total Spent</p>
                <p className="text-3xl font-mono font-bold">$12,480.00</p>
                <div className="flex items-center gap-2 mt-4 text-green-600">
                  <TrendingUp size={14} />
                  <span className="text-[10px] font-bold uppercase tracking-widest">+12% from last month</span>
                </div>
              </div>
              <div className="p-8 border border-line bg-white shadow-sm hover:shadow-md transition-shadow">
                <p className="text-[10px] font-bold uppercase tracking-widest opacity-40 mb-4">Active Orders</p>
                <p className="text-3xl font-mono font-bold">02</p>
                <p className="text-[10px] font-bold uppercase tracking-widest opacity-40 mt-4">1 arriving tomorrow</p>
              </div>
              <div className="p-8 border border-line bg-white shadow-sm hover:shadow-md transition-shadow">
                <p className="text-[10px] font-bold uppercase tracking-widest opacity-40 mb-4">Precision Points</p>
                <p className="text-3xl font-mono font-bold">1,250</p>
                <p className="text-[10px] font-bold uppercase tracking-widest opacity-40 mt-4">Redeem for $25 discount</p>
              </div>
            </div>

            {/* Latest Shipment */}
            <section className="p-10 border border-ink bg-white shadow-2xl relative overflow-hidden">
              <div className="flex justify-between items-start mb-12 relative z-10">
                <div>
                  <div className="flex items-center gap-3 mb-4">
                    <div className="w-2 h-2 bg-blue-600 rounded-full animate-pulse" />
                    <span className="text-xs font-bold uppercase tracking-widest text-blue-600">Latest Shipment</span>
                  </div>
                  <h2 className="text-3xl font-bold tracking-tighter uppercase mb-2">{latestOrder.id}</h2>
                  <p className="text-sm opacity-40 uppercase tracking-widest">Tracking: {latestOrder.trackingId}</p>
                </div>
                <Link to="/order-progress" className="btn-outline py-3 px-6 text-xs uppercase tracking-widest flex items-center gap-2">
                  Track Order <ArrowRight size={14} />
                </Link>
              </div>

              {/* Progress Bar */}
              <div className="relative mb-12">
                <div className="h-2 bg-line w-full rounded-full" />
                <div className="absolute top-0 left-0 h-2 bg-ink w-3/4 rounded-full" />
                <div className="flex justify-between mt-6">
                  {[
                    { name: 'Confirmed', icon: Check, active: true },
                    { name: 'Shipped', icon: Package, active: true },
                    { name: 'In Transit', icon: Truck, active: true },
                    { name: 'Delivered', icon: MapPin, active: false },
                  ].map((s, i) => (
                    <div key={s.name} className="flex flex-col items-center gap-2">
                      <div className={`w-8 h-8 border flex items-center justify-center transition-all ${
                        s.active ? 'bg-ink text-bg border-ink' : 'bg-white border-line opacity-40'
                      }`}>
                        <s.icon size={14} />
                      </div>
                      <span className={`text-[10px] font-bold uppercase tracking-widest ${
                        s.active ? 'opacity-100' : 'opacity-40'
                      }`}>
                        {s.name}
                      </span>
                    </div>
                  ))}
                </div>
              </div>

              <div className="grid grid-cols-1 md:grid-cols-2 gap-8 pt-8 border-t border-line">
                <div className="flex gap-4">
                  <div className="w-10 h-10 border border-line flex items-center justify-center shrink-0">
                    <Clock size={18} />
                  </div>
                  <div>
                    <p className="text-[10px] font-bold uppercase tracking-widest opacity-40 mb-1">Estimated Arrival</p>
                    <p className="text-sm font-bold">Tomorrow, March 22 by 8:00 PM</p>
                  </div>
                </div>
                <div className="flex gap-4">
                  <div className="w-10 h-10 border border-line flex items-center justify-center shrink-0">
                    <MapPin size={18} />
                  </div>
                  <div>
                    <p className="text-[10px] font-bold uppercase tracking-widest opacity-40 mb-1">Current Location</p>
                    <p className="text-sm font-bold">Distribution Center, Chicago, IL</p>
                  </div>
                </div>
              </div>
            </section>

            {/* Quick Operations */}
            <section>
              <h3 className="text-xs font-bold uppercase tracking-widest opacity-40 mb-8">Quick Operations</h3>
              <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
                {[
                  { name: 'Request Return', icon: ArrowRight, rotate: 180 },
                  { name: 'Download Invoice', icon: Shield },
                  { name: 'Extend Warranty', icon: Zap },
                  { name: 'Contact Specialist', icon: User },
                ].map((op) => (
                  <button key={op.name} className="p-6 border border-line bg-white hover:border-ink transition-all flex flex-col items-center gap-4 group">
                    <div className={`w-10 h-10 border border-ink flex items-center justify-center group-hover:bg-ink group-hover:text-bg transition-colors ${op.rotate ? 'rotate-180' : ''}`}>
                      <op.icon size={18} />
                    </div>
                    <span className="text-[10px] font-bold uppercase tracking-widest text-center">{op.name}</span>
                  </button>
                ))}
              </div>
            </section>
          </main>
        </div>
      </div>
    </div>
  );
};

export const OrderProgress: React.FC = () => {
  return (
    <div className="pt-32 pb-20 min-h-screen bg-bg">
      <div className="max-w-7xl mx-auto px-6">
        <div className="flex items-center gap-2 text-xs opacity-50 mb-12 uppercase tracking-widest">
          <Link to="/dashboard" className="hover:opacity-100 transition-opacity">Dashboard</Link>
          <span>/</span>
          <span className="opacity-100">Track Order</span>
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-3 gap-12">
          {/* Tracking Details */}
          <div className="lg:col-span-2 space-y-12">
            <div className="flex justify-between items-end">
              <div>
                <span className="font-serif italic text-lg mb-2 block opacity-60">Real-time Log</span>
                <h1 className="text-5xl font-bold tracking-tighter uppercase">ORD-2026-8842</h1>
              </div>
              <div className="text-right">
                <p className="text-[10px] font-bold uppercase tracking-widest opacity-40 mb-1">Tracking ID</p>
                <p className="text-xl font-mono font-bold">EL-TRK-9928-XJ</p>
              </div>
            </div>

            {/* Live Map Placeholder */}
            <div className="aspect-video bg-white border border-line relative overflow-hidden group">
              <img 
                src="https://picsum.photos/seed/map/1200/800?grayscale" 
                alt="Live Location" 
                className="w-full h-full object-cover opacity-50"
                referrerPolicy="no-referrer"
              />
              <div className="absolute inset-0 flex items-center justify-center">
                <div className="relative">
                  <div className="w-12 h-12 bg-ink rounded-full animate-ping opacity-20" />
                  <div className="absolute inset-0 w-12 h-12 bg-ink flex items-center justify-center">
                    <Truck size={24} className="text-bg" />
                  </div>
                </div>
              </div>
              <div className="absolute bottom-6 left-6 bg-bg border border-ink p-4 shadow-xl">
                <p className="text-[10px] font-bold uppercase tracking-widest opacity-40 mb-1">Current Speed</p>
                <p className="text-lg font-mono font-bold">65 MPH</p>
              </div>
            </div>

            {/* Event Log */}
            <div className="space-y-6">
              <h3 className="text-xs font-bold uppercase tracking-widest opacity-40">Shipment History</h3>
              <div className="space-y-0">
                {[
                  { time: '14:22 PM', date: 'Mar 21', event: 'Arrived at Distribution Center', location: 'Chicago, IL', active: true },
                  { time: '09:45 AM', date: 'Mar 21', event: 'Departed from Sorting Facility', location: 'Indianapolis, IN', active: false },
                  { time: '22:10 PM', date: 'Mar 20', event: 'Processed through Facility', location: 'Columbus, OH', active: false },
                  { time: '11:00 AM', date: 'Mar 20', event: 'Shipment Picked Up', location: 'New York, NY', active: false },
                ].map((log, i) => (
                  <div key={i} className="flex gap-8 group">
                    <div className="flex flex-col items-center">
                      <div className={`w-3 h-3 rounded-full border-2 ${log.active ? 'bg-ink border-ink' : 'bg-bg border-line'}`} />
                      {i < 3 && <div className="w-px h-20 bg-line" />}
                    </div>
                    <div className="pb-12">
                      <div className="flex items-center gap-4 mb-2">
                        <span className="text-xs font-mono font-bold">{log.date} — {log.time}</span>
                        {log.active && <span className="text-[10px] bg-ink text-bg px-2 py-0.5 font-bold uppercase tracking-widest">Latest</span>}
                      </div>
                      <h4 className="text-lg font-bold tracking-tighter uppercase">{log.event}</h4>
                      <p className="text-sm opacity-40 uppercase tracking-widest">{log.location}</p>
                    </div>
                  </div>
                ))}
              </div>
            </div>
          </div>

          {/* Order Summary Sidebar */}
          <div className="lg:col-span-1">
            <div className="sticky top-32 space-y-8">
              <div className="p-10 border border-ink bg-white shadow-xl">
                <h2 className="text-xl font-bold tracking-tighter mb-10 uppercase">Order Summary</h2>
                <div className="space-y-6 mb-10">
                  <div className="flex gap-4">
                    <div className="w-16 h-16 border border-line shrink-0">
                      <img src="https://picsum.photos/seed/laptop1/200/200" alt="" className="w-full h-full object-cover" referrerPolicy="no-referrer" />
                    </div>
                    <div className="flex-1">
                      <p className="text-xs font-bold tracking-tighter line-clamp-1 uppercase">Precision Architect Pro 16</p>
                      <p className="text-[10px] opacity-40 mt-1 uppercase tracking-widest">Qty: 1</p>
                      <p className="text-xs font-mono font-bold mt-1">$2,499.00</p>
                    </div>
                  </div>
                </div>
                <div className="h-px bg-line mb-10" />
                <div className="space-y-4">
                  <div className="flex justify-between text-xs">
                    <span className="opacity-60 uppercase tracking-widest">Status</span>
                    <span className="font-bold text-blue-600 uppercase tracking-widest">In Transit</span>
                  </div>
                  <div className="flex justify-between text-xs">
                    <span className="opacity-60 uppercase tracking-widest">Method</span>
                    <span className="font-bold uppercase tracking-widest">Express Delivery</span>
                  </div>
                </div>
              </div>

              <div className="p-10 border border-line bg-white shadow-sm">
                <h2 className="text-xl font-bold tracking-tighter mb-8 uppercase">Delivery Address</h2>
                <div className="space-y-2">
                  <p className="font-bold uppercase tracking-widest">Ihdaa 2006</p>
                  <p className="text-sm opacity-60">123 Precision Way</p>
                  <p className="text-sm opacity-60">Chicago, IL 60601</p>
                  <p className="text-sm opacity-60">United States</p>
                </div>
                <button className="w-full btn-outline py-4 mt-8 text-xs uppercase tracking-widest">
                  Modify Delivery
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

const Check = ({ size }: { size: number }) => <Package size={size} />;
const Truck = ({ size, className }: { size: number, className?: string }) => <Zap size={size} className={className} />;
