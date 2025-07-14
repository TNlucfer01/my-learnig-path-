const Props=({hello,component})=>{

    return <><h1 className="bg-blue-400">hello ,{hello.hello}</h1>
    <h2>
        my age is ,{hello.age}
        </h2>
                    <button onClick={hello.c2p()}>click to call the function </button>
</>;
};


export default Props;