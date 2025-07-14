import { useState, useEffect } from "react";

function Local() {
  const [data, setData] = useState(() => {
    // Load saved value on first render
    return localStorage.getItem("data") || "";
  });

  // Save to localStorage on every data change also the local sorage can be a size upto 
  useEffect(() => {
    localStorage.setItem("data", data);
  }, [data]);

  return (
    <div>
      <input
        type="text"
        value={data}
        onChange={(e)=>setData(e.target.value)}
        placeholder="Enter something"
      />
      <p>Stored: {data}</p>
    </div>
  );
}

export default Local;