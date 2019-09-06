Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 2806BAAFDA
	for <lists+dm-devel@lfdr.de>; Fri,  6 Sep 2019 02:32:41 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6C7DE30833C1;
	Fri,  6 Sep 2019 00:32:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 50F316060D;
	Fri,  6 Sep 2019 00:32:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AAC0A18089C8;
	Fri,  6 Sep 2019 00:32:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x860VkgO024965 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 5 Sep 2019 20:31:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 800275D6A3; Fri,  6 Sep 2019 00:31:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from ming.t460p (ovpn-8-16.pek2.redhat.com [10.72.8.16])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 799B75D6A5;
	Fri,  6 Sep 2019 00:31:35 +0000 (UTC)
Date: Fri, 6 Sep 2019 08:31:30 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Damien Le Moal <damien.lemoal@wdc.com>
Message-ID: <20190906003129.GA27116@ming.t460p>
References: <20190905095135.26026-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190905095135.26026-1-damien.lemoal@wdc.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Mike Snitzer <snitzer@redhat.com>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, linux-scsi@vger.kernel.org
Subject: Re: [dm-devel] [PATCH v5 0/7] Elevator cleanups and improvements
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Fri, 06 Sep 2019 00:32:39 +0000 (UTC)

On Thu, Sep 05, 2019 at 06:51:28PM +0900, Damien Le Moal wrote:
> This patch series implements some cleanup of the elevator initialization
> code and introduces elevator features identification and device matching
> to enhance checks for elevator/device compatibility and fitness.
> 
> The first 2 patches of the series are simple cleanups which simplify 
> elevator initialization for newly allocated device queues.
> 
> Patch 3 introduce elevator features, allowing a clean and extensible
> definition of devices and features that an elevator supports and match
> these against features required by a block device. With this, the sysfs
> elevator list for a device always shows only elevators matching the
> features that a particular device requires, with the exception of the
> none elevator which has no features but is always available for use
> with any device.
> 
> The first feature defined is for zoned block device sequential write
> constraint support through zone write locking which prevents the use of
> any elevator that does not support this feature with zoned devices.
> 
> The last 4 patches of this series rework the default elevator selection
> and initialization to allow for the elevator/device features matching
> to work, doing so addressing cases not currently well supported, namely,
> multi-queue zoned block devices.
> 
> Changes from v4:
> * Fix patch 5 again to correctly handle request based DM devices and
>   avoid that default queue elevator of these devices end up always
>   being "none".
> 
> Changes from v3:
> * Fixed patch 5 to correctly handle DM devices which do not register a
>   request queue and so do not need elevator initialization.
> 
> Changes from v2:
> * Fixed patch 4
> * Call elevator_init_mq() earlier in device_add_disk() as suggested by
>   Christoph (patch 5)
> * Fixed title of patch 7
> 
> Changes from v1:
> * Addressed Johannes comments
> * Rebased on newest for-next branch to include Ming's sysfs lock changes
> 
> Damien Le Moal (7):
>   block: Cleanup elevator_init_mq() use
>   block: Change elevator_init_mq() to always succeed
>   block: Introduce elevator features
>   block: Improve default elevator selection
>   block: Delay default elevator initialization
>   block: Set ELEVATOR_F_ZBD_SEQ_WRITE for nullblk zoned disks
>   sd: Set ELEVATOR_F_ZBD_SEQ_WRITE for ZBC disks
> 
>  block/blk-mq.c                |  20 +++--
>  block/blk-settings.c          |  16 ++++
>  block/blk.h                   |   2 +-
>  block/elevator.c              | 137 ++++++++++++++++++++++++++--------
>  block/genhd.c                 |   9 +++
>  block/mq-deadline.c           |   1 +
>  drivers/block/null_blk_main.c |   2 +
>  drivers/md/dm-rq.c            |   2 +-
>  drivers/scsi/sd_zbc.c         |   2 +
>  include/linux/blk-mq.h        |   3 +-
>  include/linux/blkdev.h        |   4 +
>  include/linux/elevator.h      |   8 ++
>  12 files changed, 161 insertions(+), 45 deletions(-)

Looks fine for the series:

Reviewed-by: Ming Lei <ming.lei@redhat.com>


Thanks,
Ming

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
