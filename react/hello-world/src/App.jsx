import "./index.css";
import Navbar from "./component/NavBar";
import BRoutes from "./component/Router";
import { BrowserRouter } from "react-router-dom";
 
function App() {
  return (
    <><BrowserRouter>
   
    <Navbar/> <BRoutes/></BrowserRouter>     
    </>
  );
}

export default App;
