import { useEffect, useState } from "react";

function Darkmode(){
    const [isdark,toggledark] =useState(true);
    function handleClick(e){
            toggledark((dark)=>!dark)
            e.target.className=isdark?"dark-btn":"white-btn"
        }
        useEffect(()=>{
             isdark?document.body.classList.add("bg-black","text-blue-200" ):
             document.body.classList.remove("bg-black","text-blue-200");
        },[isdark])
    return(<> 

    <button className="hover:bg-blue-600 m-10 border-4 mask-origin-padding" onClick={handleClick}>{(isdark===false)?"🌙 darkmode":" light mode"}</button>
    </>)
}

export default Darkmode;  