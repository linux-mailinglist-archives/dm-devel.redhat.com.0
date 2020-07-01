Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 9CF9F2111EA
	for <lists+dm-devel@lfdr.de>; Wed,  1 Jul 2020 19:28:29 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-hrd44ANXMBanY2Kb0QlqBA-1; Wed, 01 Jul 2020 13:28:26 -0400
X-MC-Unique: hrd44ANXMBanY2Kb0QlqBA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD19E80183C;
	Wed,  1 Jul 2020 17:28:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D6C771662;
	Wed,  1 Jul 2020 17:28:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C9C5E1809543;
	Wed,  1 Jul 2020 17:28:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 061F3pFF027956 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 1 Jul 2020 11:03:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3C8FE2063227; Wed,  1 Jul 2020 15:03:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 74C222063239
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 15:03:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D85D8EF3A7
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 15:03:47 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-212-pyqfy6pPNAKrz9o2hT19CA-1;
	Wed, 01 Jul 2020 11:03:45 -0400
X-MC-Unique: pyqfy6pPNAKrz9o2hT19CA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 9FCFBAEC2;
	Wed,  1 Jul 2020 14:48:22 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
	id 88D47DA781; Wed,  1 Jul 2020 16:48:06 +0200 (CEST)
Date: Wed, 1 Jul 2020 16:48:06 +0200
From: David Sterba <dsterba@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200701144805.GC27795@twin.jikos.cz>
Mail-Followup-To: dsterba@suse.cz, Christoph Hellwig <hch@lst.de>,
	Jens Axboe <axboe@kernel.dk>, Tejun Heo <tj@kernel.org>,
	dm-devel@redhat.com, cgroups@vger.kernel.org,
	linux-block@vger.kernel.org, drbd-dev@tron.linbit.com,
	linux-bcache@vger.kernel.org, linux-raid@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
References: <20200701090622.3354860-1-hch@lst.de>
	<20200701090622.3354860-5-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20200701090622.3354860-5-hch@lst.de>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 01 Jul 2020 13:23:44 -0400
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
	linux-mm@kvack.org, linux-bcache@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	drbd-dev@tron.linbit.com, dm-devel@redhat.com,
	Tejun Heo <tj@kernel.org>, cgroups@vger.kernel.org,
	linux-btrfs@vger.kernel.org
Subject: Re: [dm-devel] [PATCH 4/4] writeback: remove bdi->congested_fn
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: dsterba@suse.cz
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Jul 01, 2020 at 11:06:22AM +0200, Christoph Hellwig wrote:
> Except for pktdvd, the only places setting congested bits are file
> systems that allocate their own backing_dev_info structures.  And
> pktdvd is a deprecated driver that isn't useful in stack setup
> either.  So remove the dead congested_fn stacking infrastructure.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/block/drbd/drbd_main.c   | 59 --------------------------------
>  drivers/md/bcache/request.c      | 43 -----------------------
>  drivers/md/bcache/super.c        |  1 -
>  drivers/md/dm-cache-target.c     | 19 ----------
>  drivers/md/dm-clone-target.c     | 15 --------
>  drivers/md/dm-era-target.c       | 15 --------
>  drivers/md/dm-raid.c             | 12 -------
>  drivers/md/dm-table.c            | 37 +-------------------
>  drivers/md/dm-thin.c             | 16 ---------
>  drivers/md/dm.c                  | 33 ------------------
>  drivers/md/dm.h                  |  1 -
>  drivers/md/md-linear.c           | 24 -------------
>  drivers/md/md-multipath.c        | 23 -------------
>  drivers/md/md.c                  | 23 -------------
>  drivers/md/md.h                  |  4 ---
>  drivers/md/raid0.c               | 16 ---------
>  drivers/md/raid1.c               | 31 -----------------
>  drivers/md/raid10.c              | 26 --------------
>  drivers/md/raid5.c               | 25 --------------

For the btrfs bits

>  fs/btrfs/disk-io.c               | 23 -------------

Acked-by: David Sterba <dsterba@suse.com>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

