<?php


class Run extends Session
{

    private $run;

    private $hashEmail;

    private $hashClient;

    private $date;

    //Admins array
    private $admin = array(
        'm@internet.media.pl' => array('image' => 'dk.jpg', 'password' => 'd65c6137b071abf517487b473ab207e27cb0035c')
    );

    private function checkAdmin($email, $password) {

        if(isset($this->admin[$email])) {

            $adminData = $this->admin[$email];

            if ($adminData['password'] === $password) {

                $this->hashEmail = sha1($email . $this->getSalt() . $this->date);//Name of file (server side security)

                $this->hashClient = $this->encode(sha1($_SERVER['REMOTE_ADDR'] . $this->getSalt() . $this->date));//Content of file (server side security)

                $this->setSession('admin', array('email' => $email, 'image' => $adminData['image']));

                $this->stamp();

                $this->session();

                $this->run = true;

            } else $this->run = false;

        } else $this->run = false;

    }

    private function stamp() {

        file_put_contents('stamp/'.$this->hashEmail.'.txt', $this->hashClient);

    }

    private function session() {

        $this->init();

        //Destroy in tool.class/logout()

        $this->setSession('token', sha1($this->sessionId().$this->getSalt().$this->date));

        $this->setSession(md5($this->hashEmail), $this->hashClient);

    }

    public function __construct($email, $password)
    {
        parent::__construct();

        $this->date = date("Y-m-d");

        $this->checkAdmin($email, $password);
    }

    public function getRun() {

        return $this->run;

    }

}