import { BrowserRouter, Routes, Route } from "react-router-dom";
import Home from "./Home";
import About from "./About";
import Contact from "./Contact";
import List from "./REACTCONCEPT/ListRendering";
import UserBoard from "./Userboard";
import UserPic from "./UserPic"; // child of UserBoard

function BRoutes() {
  return (

<>
<Routes>
  <Route path="/home" element={<Home />} />
  <Route path="/about" element={<About />} />
  <Route path="/contact" element={<Contact />} />
  <Route path="/list" element={<List />} />
  
  {/* Nested route */}
  <Route path="/UserBoard" element={<UserBoard />}>
    <Route path="userpic" element={<UserPic />} />
  </Route>
</Routes>

</>
  );
}

export default BRoutes;
