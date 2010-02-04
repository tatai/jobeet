<?php

class JobeetJobTable extends Doctrine_Table {
        public function getActiveJobs(Doctrine_Query $q = null)
        {
          if (is_null($q))
          {
            $q = Doctrine_Query::create()
              ->from('JobeetJob j');
          }
         
          $q->andWhere('j.expires_at > ?', date('Y-m-d H:i:s', time()))
            ->addOrderBy('j.expires_at DESC');
         
          return $q->execute();
        }
}
