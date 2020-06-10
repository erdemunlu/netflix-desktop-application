
public class Filmler {
    private String programAdi;
    private String TurAdi;

    public Filmler(String programAdi, String TurAdi) {
        this.programAdi = programAdi;
        this.TurAdi = TurAdi;
    }

    public String getProgramAdi() {
        return programAdi;
    }

    public void setProgramAdi(String programAdi) {
        this.programAdi = programAdi;
    }

    public String getTurAdi() {
        return TurAdi;
    }

    public void setTurAdi(String TurAdi) {
        this.TurAdi = TurAdi;
    }
    
}
