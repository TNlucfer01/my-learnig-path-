import { motion } from "motion/react";
import { Mail, MessageCircle, MapPin, Phone, Clock, Send } from "lucide-react";

export function Contact() {
  const contactNumber = "+1234567890"; // Replace with actual number
  const email = "info@yourshop.com"; // Replace with actual email
  const location = {
    address: "123 Shop Street, City Name, Country",
    lat: "40.7128",
    lng: "-74.0060"
  };

  const handleWhatsAppClick = () => {
    window.open(`https://wa.me/${contactNumber}`, "_blank");
  };

  const handleEmailClick = () => {
    window.location.href = `mailto:${email}`;
  };

  const handleLocationClick = () => {
    window.open(`https://www.google.com/maps?q=${location.lat},${location.lng}`, "_blank");
  };

  return (
    <div className="min-h-screen bg-white">
      {/* Hero Section */}
      <section className="relative overflow-hidden bg-gradient-to-br from-purple-600 to-blue-600 text-white py-20">
        <div className="container mx-auto px-4">
          <motion.div
            initial={{ opacity: 0, y: 30 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.8 }}
            className="text-center max-w-3xl mx-auto"
          >
            <h1 className="text-4xl md:text-5xl font-bold mb-6">Get in Touch</h1>
            <p className="text-xl text-white/90">
              We'd love to hear from you! Choose your preferred way to contact us.
            </p>
          </motion.div>
        </div>
      </section>

      {/* Contact Methods */}
      <section className="py-16">
        <div className="container mx-auto px-4">
          <div className="grid md:grid-cols-3 gap-8 max-w-5xl mx-auto">
            {/* WhatsApp */}
            <motion.div
              initial={{ opacity: 0, y: 20 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true }}
              transition={{ delay: 0.1 }}
              onClick={handleWhatsAppClick}
              className="cursor-pointer"
            >
              <motion.div
                whileHover={{ scale: 1.05, y: -5 }}
                className="bg-white rounded-2xl shadow-lg p-8 text-center border-2 border-transparent hover:border-green-500 transition-all"
              >
                <motion.div
                  whileHover={{ rotate: 360 }}
                  transition={{ duration: 0.5 }}
                  className="inline-flex items-center justify-center w-20 h-20 bg-green-100 rounded-full mb-6"
                >
                  <MessageCircle className="h-10 w-10 text-green-600" />
                </motion.div>
                <h3 className="text-2xl font-bold mb-3">WhatsApp</h3>
                <p className="text-gray-600 mb-4">
                  Chat with us instantly on WhatsApp for quick responses
                </p>
                <p className="text-green-600 font-semibold">{contactNumber}</p>
                <button className="mt-4 bg-green-600 text-white px-6 py-2 rounded-full hover:bg-green-700 transition-colors">
                  Open WhatsApp
                </button>
              </motion.div>
            </motion.div>

            {/* Email */}
            <motion.div
              initial={{ opacity: 0, y: 20 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true }}
              transition={{ delay: 0.2 }}
              onClick={handleEmailClick}
              className="cursor-pointer"
            >
              <motion.div
                whileHover={{ scale: 1.05, y: -5 }}
                className="bg-white rounded-2xl shadow-lg p-8 text-center border-2 border-transparent hover:border-blue-500 transition-all"
              >
                <motion.div
                  whileHover={{ rotate: 360 }}
                  transition={{ duration: 0.5 }}
                  className="inline-flex items-center justify-center w-20 h-20 bg-blue-100 rounded-full mb-6"
                >
                  <Mail className="h-10 w-10 text-blue-600" />
                </motion.div>
                <h3 className="text-2xl font-bold mb-3">Email</h3>
                <p className="text-gray-600 mb-4">
                  Send us an email and we'll get back to you within 24 hours
                </p>
                <p className="text-blue-600 font-semibold">{email}</p>
                <button className="mt-4 bg-blue-600 text-white px-6 py-2 rounded-full hover:bg-blue-700 transition-colors">
                  Send Email
                </button>
              </motion.div>
            </motion.div>

            {/* Location */}
            <motion.div
              initial={{ opacity: 0, y: 20 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true }}
              transition={{ delay: 0.3 }}
              onClick={handleLocationClick}
              className="cursor-pointer"
            >
              <motion.div
                whileHover={{ scale: 1.05, y: -5 }}
                className="bg-white rounded-2xl shadow-lg p-8 text-center border-2 border-transparent hover:border-purple-500 transition-all"
              >
                <motion.div
                  whileHover={{ rotate: 360 }}
                  transition={{ duration: 0.5 }}
                  className="inline-flex items-center justify-center w-20 h-20 bg-purple-100 rounded-full mb-6"
                >
                  <MapPin className="h-10 w-10 text-purple-600" />
                </motion.div>
                <h3 className="text-2xl font-bold mb-3">Visit Us</h3>
                <p className="text-gray-600 mb-4">
                  Come visit our store for a personalized shopping experience
                </p>
                <p className="text-purple-600 font-semibold">{location.address}</p>
                <button className="mt-4 bg-purple-600 text-white px-6 py-2 rounded-full hover:bg-purple-700 transition-colors">
                  View on Maps
                </button>
              </motion.div>
            </motion.div>
          </div>
        </div>
      </section>

      {/* Additional Contact Info */}
      <section className="py-16 bg-gray-50">
        <div className="container mx-auto px-4">
          <div className="max-w-4xl mx-auto">
            <motion.div
              initial={{ opacity: 0, y: 20 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true }}
              className="text-center mb-12"
            >
              <h2 className="text-3xl font-bold mb-4">More Information</h2>
              <p className="text-gray-600 text-lg">Additional ways to reach us</p>
            </motion.div>

            <div className="grid md:grid-cols-2 gap-8">
              <motion.div
                initial={{ opacity: 0, x: -20 }}
                whileInView={{ opacity: 1, x: 0 }}
                viewport={{ once: true }}
                className="bg-white rounded-xl shadow-lg p-8"
              >
                <div className="flex items-start gap-4">
                  <div className="flex items-center justify-center w-12 h-12 bg-orange-100 rounded-full flex-shrink-0">
                    <Phone className="h-6 w-6 text-orange-600" />
                  </div>
                  <div>
                    <h3 className="text-xl font-bold mb-2">Phone Support</h3>
                    <p className="text-gray-600 mb-2">Call us for immediate assistance</p>
                    <p className="text-orange-600 font-semibold">{contactNumber}</p>
                  </div>
                </div>
              </motion.div>

              <motion.div
                initial={{ opacity: 0, x: 20 }}
                whileInView={{ opacity: 1, x: 0 }}
                viewport={{ once: true }}
                className="bg-white rounded-xl shadow-lg p-8"
              >
                <div className="flex items-start gap-4">
                  <div className="flex items-center justify-center w-12 h-12 bg-indigo-100 rounded-full flex-shrink-0">
                    <Clock className="h-6 w-6 text-indigo-600" />
                  </div>
                  <div>
                    <h3 className="text-xl font-bold mb-2">Business Hours</h3>
                    <p className="text-gray-600">Monday - Friday: 9:00 AM - 6:00 PM</p>
                    <p className="text-gray-600">Saturday: 10:00 AM - 4:00 PM</p>
                    <p className="text-gray-600">Sunday: Closed</p>
                  </div>
                </div>
              </motion.div>
            </div>
          </div>
        </div>
      </section>

      {/* Contact Form */}
      <section className="py-16">
        <div className="container mx-auto px-4">
          <div className="max-w-2xl mx-auto">
            <motion.div
              initial={{ opacity: 0, y: 20 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true }}
              className="text-center mb-12"
            >
              <h2 className="text-3xl font-bold mb-4">Send Us a Message</h2>
              <p className="text-gray-600 text-lg">Fill out the form below and we'll get back to you soon</p>
            </motion.div>

            <motion.form
              initial={{ opacity: 0, y: 20 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true }}
              className="bg-white rounded-2xl shadow-xl p-8"
              onSubmit={(e) => {
                e.preventDefault();
                alert("Thank you for your message! We'll get back to you soon.");
              }}
            >
              <div className="space-y-6">
                <div>
                  <label className="block text-sm font-semibold mb-2">Your Name</label>
                  <input
                    type="text"
                    required
                    className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-600 focus:border-transparent outline-none transition-all"
                    placeholder="John Doe"
                  />
                </div>

                <div>
                  <label className="block text-sm font-semibold mb-2">Email Address</label>
                  <input
                    type="email"
                    required
                    className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-600 focus:border-transparent outline-none transition-all"
                    placeholder="john@example.com"
                  />
                </div>

                <div>
                  <label className="block text-sm font-semibold mb-2">Subject</label>
                  <input
                    type="text"
                    required
                    className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-600 focus:border-transparent outline-none transition-all"
                    placeholder="How can we help you?"
                  />
                </div>

                <div>
                  <label className="block text-sm font-semibold mb-2">Message</label>
                  <textarea
                    required
                    rows={5}
                    className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-600 focus:border-transparent outline-none transition-all resize-none"
                    placeholder="Your message here..."
                  />
                </div>

                <motion.button
                  whileHover={{ scale: 1.02 }}
                  whileTap={{ scale: 0.98 }}
                  type="submit"
                  className="w-full bg-gradient-to-r from-purple-600 to-blue-600 text-white py-4 rounded-lg font-semibold flex items-center justify-center gap-2 hover:shadow-lg transition-shadow"
                >
                  <Send className="h-5 w-5" />
                  Send Message
                </motion.button>
              </div>
            </motion.form>
          </div>
        </div>
      </section>

      {/* Map Preview */}
      <section className="py-16 bg-gray-50">
        <div className="container mx-auto px-4">
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            className="max-w-5xl mx-auto"
          >
            <div className="text-center mb-8">
              <h2 className="text-3xl font-bold mb-4">Find Us Here</h2>
              <p className="text-gray-600">Click the map to open in Google Maps</p>
            </div>
            <motion.div
              whileHover={{ scale: 1.02 }}
              onClick={handleLocationClick}
              className="cursor-pointer rounded-2xl overflow-hidden shadow-xl"
            >
              <iframe
                src={`https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3022.1!2d${location.lng}!3d${location.lat}!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zM40wrDQyJzQ2LjEiTiA3NMKwMDAnMjEuNiJX!5e0!3m2!1sen!2sus!4v1234567890`}
                width="100%"
                height="450"
                style={{ border: 0 }}
                allowFullScreen
                loading="lazy"
                title="Store Location"
              />
            </motion.div>
          </motion.div>
        </div>
      </section>
    </div>
  );
}
