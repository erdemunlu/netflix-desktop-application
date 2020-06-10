
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;


public class Kullanici_Islemleri {
    private Connection con = null;
    
    private Statement statement =null; ///sql sorgularını çalıştırabilmek için gerekli olan sınıf.
   
    private PreparedStatement preparedStatement = null;

    private String KullaniciEmaili;
    private String kullaniciSifresi;
    private int programId;
    private int kullaniciId;
    
    
    
    public boolean kontrol(String Email){
        String sorgu = "select Email from kullanicitablosu";
        try {
            preparedStatement = con.prepareStatement(sorgu);
            ResultSet rs = preparedStatement.executeQuery();
            while(rs.next()){
                String email = rs.getString("Email");
                if(email.equals(Email)){
                    return false;
                }
            }
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(Kullanici_Islemleri.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    public void kayitOl(String isim, String SoyIsim, String Email,String Sifre,String DogumTarihi){
        String sorgu = "insert into kullanicitablosu(Isim,SoyIsim,Email,Sifre,DogumTarihi) Values(?,?,?,?,?);";
        try {
            preparedStatement = con.prepareStatement(sorgu);
            preparedStatement.setString(1, isim);
            preparedStatement.setString(2, SoyIsim);
            preparedStatement.setString(3, Email);
            preparedStatement.setString(4, Sifre);
            preparedStatement.setString(5, DogumTarihi);
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Kullanici_Islemleri.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
  
    public ArrayList<Filmler> filmleriGetir(){
        ArrayList<Filmler> filmler = new ArrayList<Filmler>();
        try {
            statement = con.createStatement();
            String sorgu = "select programtablosu.Isim,turtablosu.Isim from programtablosu INNER JOIN programturtablosu on programtablosu.Id = programturtablosu.ProgramId INNER JOIN turtablosu on turtablosu.TurId = programturtablosu.TurId;";
            ResultSet rs = statement.executeQuery(sorgu);
            while(rs.next()){
                String ProgramAdi = rs.getString("programtablosu.Isim");
                String TurAdi = rs.getString("turtablosu.Isim");
                filmler.add(new Filmler(ProgramAdi,TurAdi));
            }
            return filmler;
        } catch (SQLException ex) {
            Logger.getLogger(Kullanici_Islemleri.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
    
    public int programUzunluguBul(int programID){
        int uzunluk =0;
        try {
            statement = con.createStatement();
            String sorgu = "select ProgramUzunlugu from programtablosu where Id ="+programID+";";
            ResultSet rs = statement.executeQuery(sorgu);
            while(rs.next()){
                uzunluk = rs.getInt("ProgramUzunlugu");
                return uzunluk;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Kullanici_Islemleri.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
        return uzunluk;
    }
    public int toplamBolumSayisiniBul(int ProgramID){
        int toplamBolumSayisi =0;
        try {
            statement = con.createStatement();
            String sorgu = "Select BolumSayisi from programtablosu where Id ="+ProgramID+";";
            ResultSet rs = statement.executeQuery(sorgu);
             while(rs.next()){
                toplamBolumSayisi = rs.getInt("BolumSayisi");
                return toplamBolumSayisi;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Kullanici_Islemleri.class.getName()).log(Level.SEVERE, null, ex);
        }
        return toplamBolumSayisi;
    }
    public int kalinanBolumuBul(int kullaniciID, int ProgramID){
        int kalinanBolum =0;
        try {
            statement = con.createStatement();
            String sorgu = "select KaldigiBolum from kullaniciprogramtablosu where KullaniciId ="+kullaniciID+" and ProgramId ="+ProgramID+";";
            ResultSet rs = statement.executeQuery(sorgu);
            while(rs.next()){
                kalinanBolum = rs.getInt("KaldigiBolum");
                return kalinanBolum;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Kullanici_Islemleri.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
        return kalinanBolum;
    }
    
    
    public int izlemeSuresiBul(int kullaniciID, int ProgramID){
        int izlemeSuresi;
        try {
            statement = con.createStatement();
            String sorgu = "select izlemeSuresi from kullaniciprogramtablosu where KullaniciId ="+kullaniciID+" and ProgramId ="+ProgramID+";";
            ResultSet rs = statement.executeQuery(sorgu);
            while(rs.next()){
                izlemeSuresi = rs.getInt("izlemeSuresi");
                return izlemeSuresi;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Kullanici_Islemleri.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
        return 0;
    }
    public String programTipBul(String ProgramAdi){
        String tip="";
        try {
            statement = con.createStatement();
            String sorgu = "Select Tip from programtablosu where Isim ='"+ProgramAdi+"';";
            ResultSet rs = statement.executeQuery(sorgu);
            
            while(rs.next()){
            tip = rs.getString("Tip");
            return tip;
        }
        } catch (SQLException ex) {
            Logger.getLogger(Kullanici_Islemleri.class.getName()).log(Level.SEVERE, null, ex);
            return tip;
        }
        return tip;
    }
    
    public int programIdBul(String ProgramAdi){
        try {
            statement = con.createStatement();
            String sorgu = "Select Id from programtablosu where Isim ='"+ProgramAdi+"';";
            ResultSet rs = statement.executeQuery(sorgu);
            while(rs.next()){
                programId = rs.getInt("Id");
            }
            return programId;
        } catch (SQLException ex) {
            Logger.getLogger(Kullanici_Islemleri.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    }
    
    
     public int kullaniciBilgileriTut(String email){
       
        try {
            statement = con.createStatement();
            String sorgu = "select Id From kullanicitablosu where email ='"+email+"';";
            ResultSet rs = statement.executeQuery(sorgu);
            
            while(rs.next()){
               kullaniciId = rs.getInt("Id");
            }
            return kullaniciId;
            
            
        } catch (SQLException ex) {
            Logger.getLogger(Kullanici_Islemleri.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    }
     
    public void eskiyiSil(int KullaniciID, int ProgramID,int izlemeSuresi){
        try {
            String sorgu = "delete from kullaniciprogramtablosu where KullaniciId = ? and ProgramId = ? and IzlemeSuresi =?;";
            preparedStatement = con.prepareStatement(sorgu);
            preparedStatement.setInt(1, KullaniciID);
            preparedStatement.setInt(2, ProgramID);
            preparedStatement.setInt(3, izlemeSuresi);
            preparedStatement.executeUpdate();
            
        } catch (SQLException ex) {
            Logger.getLogger(Kullanici_Islemleri.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
     
     
    public void kullaniciProgramTablosuEkle(int KullaniciID, int ProgramID,String Tarih,int izlemeSuresi,int KaldigiBolum,int Puan){
        try {
            String sorgu = "insert into kullaniciprogramtablosu(KullaniciId,ProgramId,IzlemeTarihi,IzlemeSuresi,KaldigiBolum,Puan) values(?,?,?,?,?,?);";
            preparedStatement = con.prepareStatement(sorgu);
            preparedStatement.setInt(1, KullaniciID);
            preparedStatement.setInt(2, ProgramID);
            preparedStatement.setString(3, Tarih);
            preparedStatement.setInt(4, izlemeSuresi);
            preparedStatement.setInt(5, KaldigiBolum);
            preparedStatement.setInt(6, Puan);
            preparedStatement.executeUpdate();
            
        } catch (SQLException ex) {
            Logger.getLogger(Kullanici_Islemleri.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    
    public String FilmListele(String TurSecimi){
        String sorgu = "select programtablosu.Isim from programtablosu INNER JOIN programturtablosu on programtablosu.Id = programturtablosu.ProgramId INNER JOIN turtablosu on turtablosu.TurId = programturtablosu.TurId where turtablosu.Isim =? order by programtablosu.Puan DESC limit 2;";
        String sonuc = "";
        try {
            preparedStatement = con.prepareStatement(sorgu);
            preparedStatement.setString(1, TurSecimi);
            ResultSet rs = preparedStatement.executeQuery();
            while(rs.next()){
                sonuc += rs.getString("programtablosu.Isim");
                
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(Kullanici_Islemleri.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sonuc;
    }
    
   
    
    public boolean girisYap(String Email, String Sifre){
            String sorgu = "select * from kullanicitablosu where Email = ? and Sifre = ?";
            try {
            preparedStatement = con.prepareStatement(sorgu);
            preparedStatement.setString(1, Email);
            preparedStatement.setString(2, Sifre);
            ResultSet rs = preparedStatement.executeQuery();
            return rs.next(); ///eşleşme varsa true yoksa false döncek.
            
            } catch (SQLException ex) {
            Logger.getLogger(Kullanici_Islemleri.class.getName()).log(Level.SEVERE, null, ex);
            return false; ///eger exception olursa diye buraya da return yazılması gerekir.
            }
            
    }

    
    
 
public Kullanici_Islemleri(){
        String url = "jdbc:mysql://"+DataBase.host+":"+DataBase.port+"/"+DataBase.db_ismi+"?useUnicode=true&characterEncoding=utf8&autoReconnect=true&useSSL=false";
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
                System.out.println("Driver bulunamadı!");
        }
        try {
            con = (Connection) DriverManager.getConnection(url,DataBase.kullanici_adi,DataBase.parola);
            ///System.out.println("Bağlantı başarılı.");
        } catch (SQLException ex) {
            System.out.println("Bağlantı başarısız." + ex);
        }
               
    }

}
