export function Child() {
  return <h1>This is Child</h1>;
}
//passing the child and making it like the template for us 
function Parent({ children }) {
  return (
    <div id="parent" className=" border-2 border-amber-800 p-2.5">
      {children}
    </div>
  );
}

// for the rendering the compoent 
export function CompProp({render }){
    return(<div id="this is  comp prop">
        {render()}
    </div> );
}

//fucntion as a child 
export default Parent;
