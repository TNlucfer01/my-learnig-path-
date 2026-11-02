import React from 'react';
import { motion } from 'motion/react';
import { MessageSquare, Mail, MapPin, Clock, ShieldCheck, Globe } from 'lucide-react';

export const Protocols: React.FC = () => {
  const contactMethods = [
    {
      icon: <MessageSquare className="w-6 h-6 text-primary" />,
      title: 'WHATSAPP DIRECT',
      value: '+1 (555) NEON-MONO',
      description: 'Instant response for priority clients.',
      color: 'bg-primary/10'
    },
    {
      icon: <Mail className="w-6 h-6 text-secondary" />,
      title: 'SECURE EMAIL',
      value: 'access@neonmonolith.tech',
      description: 'Encrypted communication for custom builds.',
      color: 'bg-secondary/10'
    },
    {
      icon: <MapPin className="w-6 h-6 text-primary" />,
      title: 'SHOWROOM ACCESS',
      value: 'Sector 7, Neo-Tokyo',
      description: 'Physical inspection by appointment only.',
      color: 'bg-primary/10'
    }
  ];

  return (
    <div className="pt-32 pb-32 max-w-7xl mx-auto px-6">
      <div className="text-center mb-24">
        <p className="text-xs font-bold tracking-[0.4em] text-primary mb-4 uppercase">DIRECT ACCESS</p>
        <h1 className="text-6xl font-bold tracking-tighter mb-8">PROTOCOLS.</h1>
        <p className="text-on-surface/60 max-w-2xl mx-auto leading-relaxed">
          Our support architecture is designed for zero-latency resolution. Connect with our engineering team through the following secure channels.
        </p>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-3 gap-8 mb-32">
        {contactMethods.map((method, idx) => (
          <motion.div
            key={idx}
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            transition={{ delay: idx * 0.1 }}
            className="p-8 bg-surface-container rounded-3xl border border-neutral-800/50 hover:border-primary/30 transition-all group"
          >
            <div className={`w-14 h-14 rounded-2xl ${method.color} flex items-center justify-center mb-8 group-hover:scale-110 transition-transform`}>
              {method.icon}
            </div>
            <h3 className="text-xs font-bold tracking-widest text-on-surface/40 mb-2 uppercase">{method.title}</h3>
            <p className="text-xl font-bold font-headline mb-4 group-hover:text-primary transition-colors">{method.value}</p>
            <p className="text-sm text-on-surface/60">{method.description}</p>
          </motion.div>
        ))}
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-2 gap-12">
        <div className="bg-surface-container p-12 rounded-3xl border border-neutral-800/50">
          <div className="flex items-center gap-4 mb-8">
            <Clock className="w-6 h-6 text-primary" />
            <h3 className="text-2xl font-bold tracking-tight">TECHNICAL SUPPORT HOURS</h3>
          </div>
          <div className="space-y-6">
            <div className="flex justify-between items-center pb-4 border-b border-neutral-800">
              <span className="text-sm font-bold tracking-widest text-on-surface/60">MONDAY - FRIDAY</span>
              <span className="font-mono text-primary">08:00 - 22:00 UTC</span>
            </div>
            <div className="flex justify-between items-center pb-4 border-b border-neutral-800">
              <span className="text-sm font-bold tracking-widest text-on-surface/60">SATURDAY</span>
              <span className="font-mono text-primary">10:00 - 18:00 UTC</span>
            </div>
            <div className="flex justify-between items-center">
              <span className="text-sm font-bold tracking-widest text-on-surface/60">SUNDAY</span>
              <span className="font-mono text-secondary">EMERGENCY ONLY</span>
            </div>
          </div>
        </div>

        <div className="relative rounded-3xl overflow-hidden group">
          <img
            src="https://lh3.googleusercontent.com/aida-public/AB6AXuC6jCo2AXN_Z2KtBSnnNVNzUYPLkWHKfczzG7RcrSRVmqlCDDUHbnWqB9PRgQf1d90KYwFRAWWiGGgNoGN8xTl0u-Oe-oLo4gUbNSNBCWRmZJedToWCipEy2Ohvyg6MVAltPhBndwrfELdPj-HIPQCRarhTfGXIVosjm8brR0mszrXZpACDy8t2VEWSjlFaweUJk0i8BgzhVPoZKsix8xQ7ocWcTFKDhrkCo9DeS6YspF9QHSOW9btAo6tKz-iQHwXKaDTpZW5Z0YRR"
            alt="Global HQ"
            referrerPolicy="no-referrer"
            className="w-full h-full object-cover grayscale group-hover:grayscale-0 transition-all duration-700"
          />
          <div className="absolute inset-0 bg-gradient-to-t from-black/90 via-black/40 to-transparent p-12 flex flex-col justify-end">
            <div className="flex items-center gap-3 mb-4">
              <ShieldCheck className="w-5 h-5 text-primary" />
              <span className="text-xs font-bold tracking-widest uppercase">GLOBAL HEADQUARTERS</span>
            </div>
            <h4 className="text-3xl font-bold tracking-tight mb-2">NEO-TOKYO SECTOR 7</h4>
            <p className="text-sm text-on-surface/60">Monolith Plaza, Level 99, The Spire.</p>
          </div>
        </div>
      </div>
    </div>
  );
};
