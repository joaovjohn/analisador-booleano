Para rodar a aplicação é necessário ter instalado o bison

linux

```bash 
sudo apt-get install bison flex
```
macOS
```bash
brew install bison flex
```

Para rodar a aplicação:

1.
```bash
bison -d bool_calc.y
```
2.
```bash 
flex bool_calc.l
```

3.
```bash
    gcc -o bool_calc bool_calc.tab.c lex.yy.c -lfl
```
ou (macOS)
```bash 
    gcc -o bool_calc bool_calc.tab.c lex.yy.c -ll
```

e então para rodar a aplicação 
```bash
./bool_calc
```
