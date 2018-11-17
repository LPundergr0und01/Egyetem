public class ChineseChef implements Chef{
    @Override
    public Soup prepareSoup() {
        return new KlangBakKutTeSoup();
    }

    @Override
    public MainDish prepareMainDish() {
        return new KungPaoChicken();
    }
}
