# ubi8-verdaccio

```bash
#You can set the registry by using the following command.
npm set registry http://localhost:4873/

#you can pass a --registry flag when needed.
npm install --registry http://localhost:4873

#define in your .npmrc a registry field.
.npmrc
registry=http://localhost:4873

#Or a publishConfig in your package.json

{
  "publishConfig": {
    "registry": "http://localhost:4873"
  }
}
```
