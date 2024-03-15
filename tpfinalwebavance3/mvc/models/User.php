<?php
namespace App\Models;
use App\Models\CRUD;

class User extends CRUD{
    protected $table = "user";
    protected $primaryKey = "id";
    protected $fillable = ['name', 'username', 'password', 'email', 'privilege_id'];

    public function hashPassword($password, $cost = 10){
        return  password_hash($password, PASSWORD_BCRYPT, ['cost' => $cost]);
    }

    public function checkUser($username, $password){
       // return $password;
        $user = $this->unique('username', $username);
        if($user){
            if(password_verify($password, $user['password'])){
                session_regenerate_id();
                $_SESSION['user_id']= $user['id'];
                $_SESSION['user_name']= $user['name'];
                $_SESSION['privilege_id']= $user['privilege_id'];
                $_SESSION['fingerPrint'] = md5($_SERVER['HTTP_USER_AGENT'] . $_SERVER['REMOTE_ADDR']);
                return true;
            }else{
                return false;
            }
        }else{
            return false;
        }
    }

    public function logs(){
    return $this->hasMany('App\Models\UserLog', 'user_id');
    }

    public function logActivity($ipAddress, $visitedPage){

    $log = new UserLog;
    $log->user_id = $this->id;
    $log->username = $this->username;
    $log->ip_address = $ipAddress;
    $log->visited_page = $visitedPage;
    $log->save();
    }

    public static function findByUsername($username) {
        $db = static::getDB();
        $sql = "SELECT * FROM users WHERE username = :username";
        $stmt = $db->prepare($sql);
        $stmt->bindParam(':username', $username, \PDO::PARAM_STR);
        $stmt->execute();
        return $stmt->fetch(\PDO::FETCH_ASSOC);
    }
}
