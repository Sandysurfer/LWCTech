public abstract class GameCoin {
    public abstract integer CoinValue();      //abstraction example......
    public integer absorbCoin(Integer existingPoint){
        return existingPoint + CoinValue();
    }

}