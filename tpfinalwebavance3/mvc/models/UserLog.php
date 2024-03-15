<?php

namespace App\Models;

use PDO;

class UserLog extends CRUD {
    protected $table = 'user_logs';
    protected $primaryKey = 'id';

protected $fillable = ['username','ip_address','visited_page','created_at','user_id'];


public function insert($data){
    $data_keys = array_fill_keys($this->fillable, '');
    $data = array_intersect_key($data, $data_keys);
    $fieldName = implode(', ', array_keys($data));
    $fieldValue = ':'.implode(', :', array_keys($data));
    $sql = "INSERT INTO $this->table ($fieldName) VALUES ($fieldValue);";
    $stmt = $this->prepare($sql);
    foreach($data as $key=>$value){
        $stmt->bindValue(":$key", $value);
    }
    if($stmt->execute()){
        return $this->lastInsertId();
    }else{
        return false;
    }      
}

}