import React, { useState, useEffect } from 'react';

function ExampleComponent() {
  const [data, setData] = useState(1);

  useEffect(() => {
    // Simulate an asynchronous operation (e.g., API call or timer)
    const timer = setTimeout(() => {
      setData('Data Updated'); // This will cause an error if component is unmounted
    }, 2000);

    // Cleanup function
    return () => {
      clearTimeout(timer); // This cleanup is intentionally commented to demonstrate the error
      console.log(data);
    };
  }, []);

  return (
    <div>
      <h1>Data: {data}</h1>
    </div>
  );
}

function App() {
  const [isMounted, setIsMounted] = useState(true);

  return (
    <div>
      <button onClick={() => setIsMounted(false)}>Unmount Component</button>
      {isMounted && <ExampleComponent />}
    </div>
  );
}

export default App;