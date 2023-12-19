main = do
    a <- getLine
    let result = executa (read a)
    print result
    
type Comando = String
type Valor = Int

executa :: [(Comando, Valor)] -> Int
executa ops = realizaoperacao ops 0

realizaoperacao :: [(Comando,Valor)] -> Int -> Int
realizaoperacao [] acumul = acumul

realizaoperacao ( (operacao,val) : restodalista) acumul |operacao == "Multiplica" = realizaoperacao restodalista (acumul*val)
                                                        |operacao == "Divide" && val == 0 = -666 
                                                        |operacao == "Divide" = realizaoperacao restodalista (div acumul val)
                                                        |operacao == "Soma" = realizaoperacao restodalista (acumul+val)
                                                        |operacao == "Subtrai" = realizaoperacao restodalista (acumul-val)