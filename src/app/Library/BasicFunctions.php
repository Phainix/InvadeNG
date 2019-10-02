<?php

namespace App\Library;

class BasicFunctions {

    public static function dump() {
        $args = func_get_args();
        echo "<pre>";
        foreach ($args as $key => $arg) {
            var_dump($arg);
        }
        echo "</pre>";
    }

    public static function ddump() {
        $args = func_get_args();
        echo "<pre>";
        foreach ($args as $key => $arg) {
            var_dump($arg);
        }
        echo "</pre>";
        die();
    }

    public static function genRand($length, $keyspace = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ')
    {
        $pieces = [];
        $max = mb_strlen($keyspace, '8bit') - 1;
        for ($i = 0; $i < $length; ++$i) {
            $pieces []= $keyspace[random_int(0, $max)];
        }
        return implode('', $pieces);
    }

}