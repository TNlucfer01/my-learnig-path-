import { NavLink } from "react-router-dom";

function NavItem({ to, children }) {
  const baseClass = "px-4 py-2";
  const activeClass = "text-white bg-blue-600 rounded";
  const inactiveClass = "text-blue-600 hover:bg-blue-100";

  return (
    <NavLink
      to={to}
      className={({ isActive }) =>
        `${baseClass} ${isActive ? activeClass : inactiveClass}`
      }
    >
      {children}
    </NavLink>
  );
}


function Navbar() {
  return (
    <nav className="flex gap-4 p-4 bg-gray-100 rounded shadow">
      <NavItem to="/home">Home</NavItem>
      <NavItem to="/about">About</NavItem>
      <NavItem to="/contact">Contact</NavItem>
      <NavItem to="/list">List Rendering</NavItem>
      <NavItem to="/UserBoard">User Profile</NavItem> {/* fixed case */}
    </nav>
  );
}
export default Navbar;
