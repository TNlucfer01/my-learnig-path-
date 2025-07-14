import { memo } from "react";


const TestMemo = memo(()=>{
   console.log(" this is Testmemo")
    return (
        <h1>this is the Testmemo </h1>
    );
});

export default TestMemo;