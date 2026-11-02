const mongoose = require("mongoose");
const connect = () => {
  try {
    mongoose
      .connect(
        "mongodb+srv://krishna43835:5TcFP0bgrKfu84Gp@cluster0.wlxdj.mongodb.net/server10"
      )
      .then(() => {
        console.log(`MongoDB connected`);
      });
  } catch (error) {
    console.log(`Connection Error: ${err}`);
  }
};

module.exports = connect;
