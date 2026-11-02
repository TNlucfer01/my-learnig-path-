import { motion, AnimatePresence } from "motion/react";
import { X, ShoppingCart, Check, Star } from "lucide-react";
import { Product } from "../data/mockData";

interface ProductModalProps {
  product: Product | null;
  isOpen: boolean;
  onClose: () => void;
}

export function ProductModal({ product, isOpen, onClose }: ProductModalProps) {
  if (!product) return null;

  return (
    <AnimatePresence>
      {isOpen && (
        <>
          {/* Backdrop */}
          <motion.div
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            exit={{ opacity: 0 }}
            onClick={onClose}
            className="fixed inset-0 bg-black/50 backdrop-blur-sm z-50"
          />

          {/* Modal */}
          <div className="fixed inset-0 z-50 flex items-center justify-center p-4">
            <motion.div
              initial={{ opacity: 0, scale: 0.9, y: 20 }}
              animate={{ opacity: 1, scale: 1, y: 0 }}
              exit={{ opacity: 0, scale: 0.9, y: 20 }}
              transition={{ type: "spring", duration: 0.5 }}
              className="bg-white rounded-2xl shadow-2xl max-w-4xl w-full max-h-[90vh] overflow-y-auto"
              onClick={(e) => e.stopPropagation()}
            >
              {/* Close Button */}
              <button
                onClick={onClose}
                className="absolute top-4 right-4 z-10 p-2 bg-white rounded-full shadow-lg hover:bg-gray-100 transition-colors"
              >
                <X className="h-6 w-6" />
              </button>

              <div className="grid md:grid-cols-2 gap-8 p-8">
                {/* Product Image */}
                <motion.div
                  initial={{ opacity: 0, x: -20 }}
                  animate={{ opacity: 1, x: 0 }}
                  transition={{ delay: 0.2 }}
                  className="relative"
                >
                  <img
                    src={product.image}
                    alt={product.name}
                    className="w-full h-full object-cover rounded-xl"
                  />
                  {product.isNewArrival && (
                    <div className="absolute top-4 left-4 bg-green-500 text-white px-3 py-1 rounded-full text-sm font-semibold">
                      New Arrival
                    </div>
                  )}
                  {product.isOffer && (
                    <div className="absolute top-4 right-4 bg-red-500 text-white px-3 py-1 rounded-full text-sm font-semibold">
                      Special Offer
                    </div>
                  )}
                </motion.div>

                {/* Product Details */}
                <motion.div
                  initial={{ opacity: 0, x: 20 }}
                  animate={{ opacity: 1, x: 0 }}
                  transition={{ delay: 0.3 }}
                  className="flex flex-col"
                >
                  <div className="mb-4">
                    <span className="inline-block px-3 py-1 bg-purple-100 text-purple-600 rounded-full text-sm font-semibold mb-3">
                      {product.category}
                    </span>
                    <h2 className="text-3xl font-bold mb-2">{product.name}</h2>
                    
                    {/* Rating */}
                    <div className="flex items-center gap-2 mb-4">
                      <div className="flex">
                        {[...Array(5)].map((_, i) => (
                          <Star
                            key={i}
                            className={`h-5 w-5 ${
                              i < 4 ? "fill-yellow-400 text-yellow-400" : "text-gray-300"
                            }`}
                          />
                        ))}
                      </div>
                      <span className="text-gray-600 text-sm">(4.0 rating)</span>
                    </div>
                  </div>

                  {/* Price */}
                  <div className="mb-6">
                    <div className="flex items-baseline gap-3">
                      <span className="text-4xl font-bold text-purple-600">
                        ${product.price.toFixed(2)}
                      </span>
                      {product.originalPrice && (
                        <span className="text-2xl text-gray-400 line-through">
                          ${product.originalPrice.toFixed(2)}
                        </span>
                      )}
                    </div>
                    {product.originalPrice && (
                      <div className="mt-2">
                        <span className="text-green-600 font-semibold">
                          Save ${(product.originalPrice - product.price).toFixed(2)} (
                          {Math.round(((product.originalPrice - product.price) / product.originalPrice) * 100)}% off)
                        </span>
                      </div>
                    )}
                  </div>

                  {/* Stock Status */}
                  <div className="mb-6">
                    {product.inStock ? (
                      <div className="flex items-center gap-2 text-green-600">
                        <Check className="h-5 w-5" />
                        <span className="font-semibold">In Stock</span>
                      </div>
                    ) : (
                      <div className="text-red-600 font-semibold">Out of Stock</div>
                    )}
                  </div>

                  {/* Description */}
                  <div className="mb-6">
                    <h3 className="font-bold text-lg mb-2">Description</h3>
                    <p className="text-gray-600 leading-relaxed">{product.description}</p>
                  </div>

                  {/* Features */}
                  <div className="mb-8">
                    <h3 className="font-bold text-lg mb-3">Key Features</h3>
                    <ul className="space-y-2">
                      {product.features.map((feature, index) => (
                        <motion.li
                          key={index}
                          initial={{ opacity: 0, x: -10 }}
                          animate={{ opacity: 1, x: 0 }}
                          transition={{ delay: 0.4 + index * 0.1 }}
                          className="flex items-center gap-2 text-gray-700"
                        >
                          <Check className="h-5 w-5 text-green-500 flex-shrink-0" />
                          <span>{feature}</span>
                        </motion.li>
                      ))}
                    </ul>
                  </div>

                  {/* Action Buttons */}
                  <div className="mt-auto space-y-3">
                    <motion.button
                      whileHover={{ scale: 1.02 }}
                      whileTap={{ scale: 0.98 }}
                      disabled={!product.inStock}
                      className={`w-full py-4 rounded-xl font-semibold flex items-center justify-center gap-2 transition-colors ${
                        product.inStock
                          ? "bg-gradient-to-r from-purple-600 to-blue-600 text-white hover:shadow-lg"
                          : "bg-gray-300 text-gray-500 cursor-not-allowed"
                      }`}
                    >
                      <ShoppingCart className="h-5 w-5" />
Conact us                    </motion.button>

                    {/* <motion.button
                      whileHover={{ scale: 1.02 }}
                      whileTap={{ scale: 0.98 }}
                      className="w-full py-4 rounded-xl font-semibold border-2 border-purple-600 text-purple-600 hover:bg-purple-50 transition-colors"
                    >
                      Add to Wishlist
                    </motion.button> */}
                  </div>

                  {/* Additional Info */}
                  <div className="mt-6 pt-6 border-t grid grid-cols-3 gap-4 text-center">
                    <div>
                      <div className="text-2xl font-bold text-purple-600">Fast</div>
                      <div className="text-xs text-gray-600">Shipping</div>
                    </div>
                    <div>
                      <div className="text-2xl font-bold text-purple-600">30D</div>
                      <div className="text-xs text-gray-600">Returns</div>
                    </div>
                    <div>
                      <div className="text-2xl font-bold text-purple-600">24/7</div>
                      <div className="text-xs text-gray-600">Support</div>
                    </div>
                  </div>
                </motion.div>
              </div>
            </motion.div>
          </div>
        </>
      )}
    </AnimatePresence>
  );
}
