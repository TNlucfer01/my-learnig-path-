function SynEvent(){
    const handleClick = (event) => {
    console.log("React Synthetic Event:", event);
    console.log("Event type:", event.type);
    console.log("Target:", event.target);
  };
const handleMouseEnter = (e) => {console.log("Hovered IN",e.target,e.type,e);}
  const handleMouseLeave = (e) => console.log("Hovered OUT",e.target,e.type,e);

  return <button onClick={handleClick} onMouseEnter={handleMouseEnter} on onMouseLeave={handleMouseLeave}>Click Me</button>;
}


export default SynEvent;