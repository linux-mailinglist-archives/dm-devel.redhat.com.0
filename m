Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id F0372775E7
	for <lists+dm-devel@lfdr.de>; Sat, 27 Jul 2019 04:17:30 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 933063082141;
	Sat, 27 Jul 2019 02:17:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 51DB1600C0;
	Sat, 27 Jul 2019 02:17:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B9E3D1800204;
	Sat, 27 Jul 2019 02:16:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6R2G3c2017504 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 26 Jul 2019 22:16:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 646CA605C3; Sat, 27 Jul 2019 02:16:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from ming.t460p (ovpn-8-20.pek2.redhat.com [10.72.8.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 87B8F600C0;
	Sat, 27 Jul 2019 02:15:48 +0000 (UTC)
Date: Sat, 27 Jul 2019 10:15:44 +0800
From: Ming Lei <ming.lei@redhat.com>
To: kernel test robot <rong.a.chen@intel.com>
Message-ID: <20190727021523.GB6926@ming.t460p>
References: <20190720030637.14447-3-ming.lei@redhat.com>
	<20190725104629.GC3640@shao2-debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725104629.GC3640@shao2-debian>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, Hannes Reinecke <hare@suse.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	linux-scsi@vger.kernel.org, "James E . J . Bottomley" <jejb@linux.ibm.com>,
	"Ewan D . Milne" <emilne@redhat.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Mike Snitzer <snitzer@redhat.com>, stable@vger.kernel.org,
	lkp@01.org, Christoph Hellwig <hch@lst.de>,
	Bart Van Assche <bvanassche@acm.org>
Subject: Re: [dm-devel] [scsi] ae86a1c553:
	BUG:kernel_NULL_pointer_dereference, address
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Sat, 27 Jul 2019 02:17:29 +0000 (UTC)

Hi,

Thanks for your report!

On Thu, Jul 25, 2019 at 06:46:29PM +0800, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-7):
> 
> commit: ae86a1c5530b52dc44a280e78feb0c4eb2dd8595 ("[PATCH V2 2/2] scsi: implement .cleanup_rq callback")
> url: https://github.com/0day-ci/linux/commits/Ming-Lei/blk-mq-add-callback-of-cleanup_rq/20190720-133431
> 
> 
> in testcase: blktests
> with following parameters:
> 
> 	disk: 1SSD
> 	test: block-group1
> 
> 
> 
> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 4G
> 
> caused below changes (please refer to attached dmesg/kmsg for entire log/backtrace):
> 
> 
> +---------------------------------------------------------------------------------------------------------------+------------+------------+
> |                                                                                                               | bd222ca85f | ae86a1c553 |
> +---------------------------------------------------------------------------------------------------------------+------------+------------+
> | boot_successes                                                                                                | 0          | 0          |
> | boot_failures                                                                                                 | 11         | 14         |
> | BUG:kernel_reboot-without-warning_in_test_stage                                                               | 11         | 1          |
> | BUG:kernel_NULL_pointer_dereference,address                                                                   | 0          | 4          |
> | Oops:#[##]                                                                                                    | 0          | 4          |
> | RIP:scsi_queue_rq                                                                                             | 0          | 4          |
> | Kernel_panic-not_syncing:Fatal_exception                                                                      | 0          | 4          |
> | invoked_oom-killer:gfp_mask=0x                                                                                | 0          | 9          |
> | Mem-Info                                                                                                      | 0          | 9          |
> | page_allocation_failure:order:#,mode:#(GFP_KERNEL|__GFP_RETRY_MAYFAIL),nodemask=(null),cpuset=/,mems_allowed= | 0          | 2          |
> +---------------------------------------------------------------------------------------------------------------+------------+------------+
> 
> 
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <rong.a.chen@intel.com>
> 
> 
> [  140.974865] BUG: kernel NULL pointer dereference, address: 000000000000001c

Yeah, I know this issue, and it has been fixed in either V3 or V4.

Thanks,
Ming

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
