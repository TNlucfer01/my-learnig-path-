import { useState, useEffect, memo, Component } from "react";
import TestMemo from "./Testmemo";

//testing the memo function 
// a Component with multiple chilf
function ListRender({storedItems}) {
  console.log(" this is list render")
    return (
    <div>
      {/* // for call back from the parent to c2p change (a way of 3 way binding) */}
      <ul>
        {storedItems.map((item) => (
          <li key={item.name}>
            {item.name} : ₹{item.price}
          </li>
        ))}
      </ul>
    </div>
  );
}

function GetName({ updateList }) {
  const [name, setName] = useState("");
  const [price, setPrice] = useState("");

  function handleSubmit(e) {
    // for preventing the page form the reloading
    //just have to study more
    e.preventDefault();

    const newItem = { name: name.trim(), price: Number(price) };
    // Geting the data
    const existing = JSON.parse(localStorage.getItem("cart")) || [];
    // Filter out duplicate names
    const updated = [
      ...existing.filter((item) => item.name !== newItem.name),
      newItem,
    ];

    // Save back doesn't add the prototype in this 
    localStorage.setItem("cart", JSON.stringify(updated));
    updateList(updated); // update parent state  from the  child

    // Clear form
    setName("");
    setPrice("");
    console.log("this is getname")
  }

  return (
    <>
    <form onSubmit={handleSubmit}>
      <input
        type="text"
        name="name"
        placeholder="Enter the item name"
        value={name}
        onChange={(e) => setName(e.target.value)}
      />
      <input
        type="number"
        name="price"
        placeholder="Enter the price"
        value={price}
        onChange={(e) => setPrice(e.target.value)}
      />
      <button type="submit">Submit</button>
    </form>
   
    </>
  );
}

function List(){
    const [storedItems, setStoredItems] = useState(JSON.parse(localStorage.getItem("cart")) || []);
    function handleClick(){
        setStoredItems([])
        localStorage.clear()
    }
    return (<>
    <GetName updateList={setStoredItems}/>
    <ListRender storedItems={storedItems}/> 
    <button onClick={handleClick}>clear</button>
    <TestMemo/>
    </>)
}

export default List;
