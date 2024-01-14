
The following tools are needed to run the examples in this series of tutorials:

**Resources**:
Repo of the presentations: https://github.com/alchemyplatform/learn-solidity-presentations

Marp Tool: https://marp.app ( USed to preview markdown files on Visual Studio Code)

---

## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry is a smart contract development toolchain.
Foundry manages your dependencies, compiles your project, runs tests, deploys, and lets you interact with the chain from the command-line and via Solidity scripts

We need to install Foundry to compile the examples and write unit tests for our Solidity code.


Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
# or
$ forge test -vv

# If you have many test files and want to test specific test file by using its exact test name, then:
forge test -vvvv --match-test testBools
forge test -vvvv --match-test testA
forge test -vvvv --match-test testB
forge test -vvvv --match-test testSum
# ...
# The last argument in the command line is the name of the test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
