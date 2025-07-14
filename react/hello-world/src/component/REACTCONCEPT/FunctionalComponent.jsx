import Props from "./Props"; 
function Func(){
    return (<><Props c2p={childtrentoParent}/></>);
}

function childtrentoParent(){
    return(<h2>hello  this is inside the child challback</h2>)
}
export default Func;