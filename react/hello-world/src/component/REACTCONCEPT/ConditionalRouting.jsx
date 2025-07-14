import { Route, Routes, Navigate, useNavigate } from "react-router-dom";
import Home from "../Home";
import { useState } from "react";

function Authenticate({ Auth }) {
  const [redirect, setRedirect] = useState(false);

  const handleLogin = () => {
    Auth(true);
    setRedirect(true);
  };

  if (redirect) {
    return <Navigate to="/home" />;
  }

  return (
    <div className="flex flex-col  items-center justify-center  min-h-screen bg-gray-100 text-gray-800">
      <h2 className="text-3xl font-semibold mb-6">Please Authenticate</h2>
      <button
        className="px-6 py-2 text-white bg-blue-600 hover:bg-blue-700 rounded shadow transition duration-300"
        onClick={handleLogin}
      >
        Authenticate
      </button>
    </div>
  );
}

function ConditionalRouting() {
  const [isAuth, setAuth] = useState(false);
  const navigate = useNavigate();

  if(isAuth){
    navigate('/home')
  }

  return (
    <Routes>
      <Route
        path="/"
        element={
          <Authenticate Auth={setAuth} />
        }
      />
      <Route path="/home" element={<Home />} />
    </Routes>
  );
}

export default ConditionalRouting;
