<?php

class JobeetCategoryTable extends Doctrine_Table {
	public function getWithJobs() {
		$q = $this->createQuery('c')
			->leftJoin('c.JobeetJobs j')
			->where('j.expires_at > ?', date('Y-m-d h:i:s', time()));

		$q->andWhere('j.is_activated = ?', 1);

		return $q->execute();
	}
}
