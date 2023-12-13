package ClassMétier;

public class Medecin {
	private int id;
    private String nom;
    private String specialite;
    private String adress;


    public Medecin(int id,String nom, String specialite, String adress) {
		super();
		this.id=id;
		this.nom = nom;
		this.specialite = specialite;
		this.adress = adress;
	}
	public String getAdress() {
		return adress;
	}
	
	@Override
	public String toString() {
		return "Medecin [ nom=" + nom + ", specialite=" + specialite + ", adress=" + adress
				+ "]";
	}
	
	public void setAdress(String adress) {
		this.adress = adress;
	}
	public int getId() {
		return id;
	}
	public void setId(int medecinId) {
		this.id= medecinId;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getSpecialite() {
		return specialite;
	}
	public void setSpecialite(String specialite) {
		this.specialite = specialite;
	}

    // Getters et Setters
    // ...
}

