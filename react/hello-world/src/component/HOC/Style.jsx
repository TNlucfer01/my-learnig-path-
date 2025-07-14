import Button from "./Button";

// withStyle.js
export function withStyle(WrappedComponent) {
  return function EnhancedComponent(props) {
    return (
      <WrappedComponent {...props} className="bg-black text-white p-4" />
    );
  };
}

const StyledCompo=withStyle(Button);

export default StyledCompo;



