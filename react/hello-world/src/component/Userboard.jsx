import { NavLink,Route, Routes,Outlet} from "react-router-dom";

function UserBoard(){
    return(
     <>
    <nav className="flex gap-4 p-4 bg-blue-50">
        <NavLink to="userpic">User Pic</NavLink>
      </nav>
      <main className="p-4">
        <Outlet />
      </main>
</>
    )
}

export default UserBoard;