package starter.data;

public class User {
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRetype_password() {
        return retype_password;
    }

    public void setFullName(String retype_password) {
        this.retype_password = retype_password;
    }

    String email = "kiki.santoso@yahoo.com";
    String password = "u62myhcnvcx9ujw";
    String retype_password = "u62myhcnvcx9ujw";

    public void setRetype_password(String retype_password) {
        this.retype_password = retype_password;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJlbWFpbCI6ImFkbWluIiwiZXhwIjoxNjg3Mzg0MDUwLCJyb2xlIjoiYWRtaW4iLCJ1c2VyX2lkIjoxfQ.QrTuL333IxkMoOmQ-h2bTG_G36vJtRF3Kxdo4u_pPhA";

    public String getToken1() {
        return token1;
    }

    public void setToken1(String token1) {
        this.token1 = token1;
    }

    String token1 = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJlbWFpbCI6Imtpa2kuc2FudG9zb0B5YWhvby5jb20iLCJleHAiOjE2ODczODQzMzgsInJvbGUiOiJyZWd1bGVyIiwidXNlcl9pZCI6NDJ9.Au52holtPgplEzVMgjADOxlaMQehYDjOmGQMOiLSVnc";
}
