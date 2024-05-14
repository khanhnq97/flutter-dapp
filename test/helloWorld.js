const HelloWorld = artifacts.require("HelloWorld");

contract("HelloWorld",() =>{
    it("Testing", async () => {
        const instance = await HelloWorld.deployed();
        await instance.setMessage("Hello PK");
        const message = await instance.message();
        assert.equal(message, "Hello PK");
    }) 
})

 