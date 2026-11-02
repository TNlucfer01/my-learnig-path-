import { Product, Stat, Principle } from './types';

export const PRODUCTS: Product[] = [
  {
    id: 'xenon-pro-x1',
    name: 'Xenon Pro X-1',
    category: 'Laptops',
    price: 3499,
    image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAtJY0dbDnQgRAbNUpAvGa5wfKbRWF2tfiLkqhPbbxBXEjuZFYR4zfTSZzAF4gvhcHCwxxekth_5mCR6qGCybE2eSDrCYdn9u3oKXmq4LFlyEji_r8N84wKEGgkFtXSD6k3E8yMx1A16nGOcjxdTOGN3HNePt0ChrBNEHT0DfWwlbVp2spGHVF1Mq4V1yFS1riDNWASI4MkSUaj9Ww-iZa7VLQH_6qpiLSSx3N7yc-Qk9x52yfD14JpBk5uwHwjxakSPO9lr0t2gXmm',
    description: 'Engineered for the elite. The Xenon Pro X-1 features the world\'s first Photon-Cooled architecture.',
    tag: 'In Stock'
  },
  {
    id: 'prism-49-ultra',
    name: 'Prism 49" Ultra',
    category: 'Monitors',
    price: 1899,
    image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDRADjFe-ZLzoXzIf0pvmevxEuxytjL3fYA8dnbD_rfFDyrW7wV5Fx_5ZZN_gyhz6ctGcFgmEI9JTi7Bkl9EA-ndEZsjqlsw-yOe8g2jyuMqC3SxetS61vBdJ_Rn3avL4J0_bx1X8nsjCJhe48TjKOWsRNpyoODtkUf2HITiBy0B8I5ep4MgMcqrbzHYGJIXXDetLq6tEX_QbyorbOET8yMTbUdmT3G2XE2DvQY31CR2pym13nt3sHdjVR_KT5JqCZ29fwO11PB_Q3W',
    description: 'Professional curved gaming monitor showing a futuristic data interface.',
    tag: 'Edition I'
  },
  {
    id: 'monolith-deck-v2',
    name: 'Monolith Deck v2',
    category: 'Peripherals',
    price: 249,
    image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBBIsB-uMuLdyvNYcbw-KjiHVAE_29D2X8NePcYUEqBSCb_6HhIYPhCPs9N2ynb_ls-lrL1HI9nKWiv0KN-l2g22r0Ms25Ef7jnTbzeiVkNnzSI7s_wGBzmIgvu3UTCLOfgUbYYam8EHK8eejSyguakDNCDQCskjUIVfSTh02lO4E2MkWtUyOgrqF6zLG__8TQGkpamj5q67TyRLnQVm8neNSBnSCSyxgA8LEkXEwLlAFkBPvkluxBKOKxveRwiZxY2HB3Q2gqCp3e2',
    description: 'High-tech mechanical keyboard with custom amber backlighting.',
    tag: 'New Drop'
  },
  {
    id: 'titan-16',
    name: 'Titan 16 Workstation',
    category: 'Laptops',
    price: 4299,
    image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCe9dGNQ3iFLMUpId7rDo6T0IpP0i-py4-Bp10wJbQKsdjgtliFl9hmBwalDWhgdVIb_3lnZJmmy2qif6bIHl6eH-Qt3BTBr_9gZ0GxtllIYS-4Onr1qClcvo-F3Lp1yURDlQdZ14MhskUQXn0rATYUk6vtjlgJr-dbX5g7LI5Bo7jQl1r4KpddI1EJpuL9KD9YYWmUgmuTRp_Ffm8t9m_CElGkc8BR_HlnSO1JjsHEasb4lNuN1oec_ncdryqcZmAxhOXDKc03WQ_u',
    description: 'Core i9 • 64GB RAM • 2TB NVMe',
    tag: 'BESTSELLER'
  },
  {
    id: 'atom-air-13',
    name: 'Atom Air 13',
    category: 'Laptops',
    price: 1699,
    image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBTXckaz2Y0Ry-1Z8Mk3mWeZvLhPGILiTlkcNUjALSXwytNgG1_yT7zR8sMk3mWeZvLhPGILiTlkcNUjALSXwytNgG1_yT7zR8sMtHJuLAyOvbDXojQgmOP61L8Umb0N_pv6S0UH0rvhomgMcn_RDUvkHVNpTi4Y_GjOxdEQnFZvzk69tispU1vmciUJcQEM3WkPQlU-y8ZX3-pLkTyKANNeBk9Sqzhv3uYDcexpt6xmlXzrir_dKhwPq2Yvp7Zb2WVLXPED473dkvc8fwhmoZ0IMGvFUdZz0JilXIRgU2R1USL-WqrN3i-l',
    description: 'M3 Ultra • 32GB RAM • 512GB'
  },
  {
    id: 'monolith-tower',
    name: 'Monolith Tower Core',
    category: 'Workstations',
    price: 5999,
    image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuC6jCo2AXN_Z2KtBSnnNVNzUYPLkWHKfczzG7RcrSRVmqlCDDUHbnWqB9PRgQf1d90KYwFRAWWiGGgNoGN8xTl0u-Oe-oLo4gUbNSNBCWRmZJedToWCipEy2Ohvyg6MVAltPhBndwrfELdPj-HIPQCRarhTfGXIVosjm8brR0mszrXZpACDy8t2VEWSjlFaweUJk0i8BgzhVPoZKsix8xQ7ocWcTFKDhrkCo9DeS6YspF9QHSOW9btAo6tKz-iQHwXKaDTpZW5Z0YRR',
    description: 'RTX 5090 • Liquid Cooled • AI Ready'
  },
  {
    id: 'echo-x-studio',
    name: 'Echo-X Studio',
    category: 'Audio',
    price: 499,
    image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuB58q7OuOoaaRPsuMmLHVph3hmUB4dAodfGp70x7dLHRhvG_QsUdvT2mUhjWaobpiC2m0NDoXZvl-n0IlHowmoNHceGbahbDNGe3iciA0WvzJmpyWHUQAaODqIMHCxzKDz0WiwMxwPEo9A7tkeeURNZYJBPefYhhZ_OEHb5PUVd3cu_VVNg7H7qYj3RNW8JAGRi_eXQ2mXax8lLWgFcn4vBNjnJ0b0KISiCUbnmI1HgJbIL3cwrHs_H3x8s-TT3nr0OmgEhZ_1X3LUd',
    description: 'Pure silence. Absolute fidelity.'
  },
  {
    id: 'cylinder-one',
    name: 'Cylinder One',
    category: 'Audio',
    price: 329,
    image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDdQPbUzwK6K4mPZszAzN7SkqHZLGmyS0EmRJ92pXMvrGn6fWaMOV6ckEqRQNIJI4yTgLoJoFV_kk1AUDysQuQSOvIcOKntWGIJujKvVPbzpZiUojgEEDjH05kbMf8FgTAC5kJqK0i1feQsWO1hI2KP64vjj7-acFWD0dQrUnU2621JdzQYzacIK3gd65zTk2G41R8idVW7uXLvGAP-KYnpaQxiDU8xfhfZ716cy6GXqbdYoYXJ5hcATemF1HCfVPRqP0fBHDwjYBmF',
    description: '360° Omnidirectional Pulse.'
  },
  {
    id: 'nova-buds',
    name: 'Nova Buds',
    category: 'Audio',
    price: 199,
    image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuD_RhDfG_BKUoSCxgDWbVef51uYkubbFN3VOtKsFg6MN--IkTpm1Un4YeYAlEYfJ9C5yf1Q-qP0S6l5Rd8p7-MYcp5pfMi5ASRe1FtZ4kyzVMXFCYQfQd20rWCNiuhNa5la_ndR4wZZVYbxFfVOATZfxoz_0Z9qj3bbpclG91XorSp1-mdhrJyV_MvlhDJFHvdUEnvw2iP6ZNPrPkIlMoUHf3jO3uyNekyl7BmYHeUtLYfzwsgsL4jwdFAtT0o_EZhbw7UJYjBeZLy4',
    description: 'Gravity-defying comfort.'
  }
];

export const STATS: Stat[] = [
  { label: 'Units Forged', value: '12K+' },
  { label: 'Uptime Reliability', value: '99.9%' },
  { label: 'Design Awards', value: '45' },
  { label: 'Concierge Support', value: '24/7' }
];

export const PRINCIPLES: Principle[] = [
  {
    title: 'THE MISSION',
    description: 'To engineer the most visually stunning and technologically advanced hardware on the planet, empowering humanity to build the next iteration of the digital world.',
    icon: 'Rocket'
  },
  {
    title: 'Absolute Precision',
    description: 'Every screw, trace, and weld is executed with sub-millimeter accuracy. Perfection is our baseline.',
    icon: 'Target'
  },
  {
    title: 'Material Integrity',
    description: 'We only use authentic materials. If it looks like metal, it is metal. If it looks like glass, it is sapphire.',
    icon: 'Diamond'
  }
];
