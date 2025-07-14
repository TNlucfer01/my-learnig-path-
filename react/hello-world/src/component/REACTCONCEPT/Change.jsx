import { useEffect, useState } from "react";

function Change() {
  const [count, setcount] = useState(2);
  const [iswhite, setwhite] = useState(false);
  function handleClick() {
    setcount((e)=>{
    return  e+=1;
    });
    setwhite((e)=>!e);
  }
  useEffect(()=>{

console.log(" the variable is changes ")},[iswhite])
  console.log(count);
  return (
    <>
      <button
        className={iswhite ? "bg-black" : "bg-white"}
        onClick={handleClick}
      >
        count {count}
      </button>
    </>
  );
}
//to handle multiple use state we always use the handleclicks
export function Hello_World(){
return(<h1>hello world</h1>)
}

export default Change;
