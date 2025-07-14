import Change from "./Change";
import NavBar from "../NavBar";

function Ternary(){
//return the first one when we have included
//return <NavBar/>||<Change/> 

//same here 
//return <Change/> &&<NavBar/>


//If the first value is truthy, return the second

// If the first value is falsy, return the first

//return (<Change/> && true);
// for the if else
//return false?<Change/>:<NavBar/>

//for object 
// let obj={
//     a:<Change/>,
//     b:<NavBar/>
// }
// //just pass the key 
// return  obj["a"];

let n=2;
switch(n){
    case 1:
        return <Change/>;
    case 2:
        return <NavBar/>;

     }



}


export default Ternary;
