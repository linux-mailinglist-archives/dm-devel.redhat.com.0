Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id CB827331BB
	for <lists+dm-devel@lfdr.de>; Mon,  3 Jun 2019 16:09:55 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2089EC059B9F;
	Mon,  3 Jun 2019 14:09:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E116317D0F;
	Mon,  3 Jun 2019 14:09:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3612F206D2;
	Mon,  3 Jun 2019 14:08:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x53E8Evx025305 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 3 Jun 2019 10:08:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 32E5910027C0; Mon,  3 Jun 2019 14:08:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 47D5D1001DE4;
	Mon,  3 Jun 2019 14:08:09 +0000 (UTC)
Date: Mon, 3 Jun 2019 10:08:08 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Nikos Tsironis <ntsironis@arrikto.com>
Message-ID: <20190603140808.GA21955@redhat.com>
References: <20190603134017.9323-1-ntsironis@arrikto.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190603134017.9323-1-ntsironis@arrikto.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, ejt@redhat.com, agk@redhat.com
Subject: Re: [dm-devel] dm kcopyd: Increase sub-job size to 512KiB
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Mon, 03 Jun 2019 14:09:49 +0000 (UTC)

On Mon, Jun 03 2019 at  9:40am -0400,
Nikos Tsironis <ntsironis@arrikto.com> wrote:

> Currently, kcopyd has a sub-job size of 64KiB and a maximum number of 8
> sub-jobs. As a result, for any kcopyd job, we have a maximum of 512KiB
> of I/O in flight.
> 
> This upper limit to the amount of in-flight I/O under-utilizes fast
> devices and results in decreased throughput, e.g., when writing to a
> snapshotted thin LV with I/O size less than the pool's block size (so
> COW is performed using kcopyd).
> 
> Increase kcopyd's sub-job size to 512KiB, so we have a maximum of 4MiB
> of I/O in flight for each kcopyd job. This results in an up to 96%
> improvement of bandwidth when writing to a snapshotted thin LV, with I/O
> sizes less than the pool's block size.
> 
> We evaluate the performance impact of the change by running the
> snap_breaking_throughput benchmark, from the device mapper test suite
> [1].
> 
> The benchmark:
> 
>   1. Creates a 1G thin LV
>   2. Provisions the thin LV
>   3. Takes a snapshot of the thin LV
>   4. Writes to the thin LV with:
> 
>       dd if=/dev/zero of=/dev/vg/thin_lv oflag=direct bs=<I/O size>
> 
> Running this benchmark with various thin pool block sizes and dd I/O
> sizes (all combinations triggering the use of kcopyd) we get the
> following results:
> 
> +-----------------+-------------+------------------+-----------------+
> | Pool block size | dd I/O size | BW before (MB/s) | BW after (MB/s) |
> +-----------------+-------------+------------------+-----------------+
> |       1 MB      |      256 KB |       242        |       280       |
> |       1 MB      |      512 KB |       238        |       295       |
> |                 |             |                  |                 |
> |       2 MB      |      256 KB |       238        |       354       |
> |       2 MB      |      512 KB |       241        |       380       |
> |       2 MB      |        1 MB |       245        |       394       |
> |                 |             |                  |                 |
> |       4 MB      |      256 KB |       248        |       412       |
> |       4 MB      |      512 KB |       234        |       432       |
> |       4 MB      |        1 MB |       251        |       474       |
> |       4 MB      |        2 MB |       257        |       504       |
> |                 |             |                  |                 |
> |       8 MB      |      256 KB |       239        |       420       |
> |       8 MB      |      512 KB |       256        |       431       |
> |       8 MB      |        1 MB |       264        |       467       |
> |       8 MB      |        2 MB |       264        |       502       |
> |       8 MB      |        4 MB |       281        |       537       |
> +-----------------+-------------+------------------+-----------------+
> 
> [1] https://github.com/jthornber/device-mapper-test-suite
> 
> Signed-off-by: Nikos Tsironis <ntsironis@arrikto.com>
> ---
>  drivers/md/dm-kcopyd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/md/dm-kcopyd.c b/drivers/md/dm-kcopyd.c
> index 671c24332802..db0a7d1e33b7 100644
> --- a/drivers/md/dm-kcopyd.c
> +++ b/drivers/md/dm-kcopyd.c
> @@ -28,7 +28,7 @@
>  
>  #include "dm-core.h"
>  
> -#define SUB_JOB_SIZE	128
> +#define SUB_JOB_SIZE	1024
>  #define SPLIT_COUNT	8
>  #define MIN_JOBS	8
>  #define RESERVE_PAGES	(DIV_ROUND_UP(SUB_JOB_SIZE << SECTOR_SHIFT, PAGE_SIZE))
> -- 
> 2.11.0
> 

Thanks for the patch, clearly we're leaving considerable performance on
the table.  But I'm left wondering whether we should preserve the 64K
default but allow targets to override the sub-job size at kcopyd client
create time?

Or do you feel that all slower storage wouldn't be adversely impacted by
this sub-job size increase from 64K to 512K?

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
