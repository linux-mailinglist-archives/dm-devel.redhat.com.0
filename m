Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id CB96BC0152
	for <lists+dm-devel@lfdr.de>; Fri, 27 Sep 2019 10:38:07 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2889910CC1FE;
	Fri, 27 Sep 2019 08:38:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DFB155D6B0;
	Fri, 27 Sep 2019 08:38:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0D59D4EE68;
	Fri, 27 Sep 2019 08:37:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8R8WpJZ020395 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 27 Sep 2019 04:32:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0F3B260C5D; Fri, 27 Sep 2019 08:32:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.33.36.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6D05960BE2;
	Fri, 27 Sep 2019 08:32:40 +0000 (UTC)
Date: Fri, 27 Sep 2019 09:32:39 +0100
From: Joe Thornber <thornber@redhat.com>
To: Eric Wheeler <dm-devel@lists.ewheeler.net>
Message-ID: <20190927083239.xy6jwbkbektwqu3h@reti>
Mail-Followup-To: Eric Wheeler <dm-devel@lists.ewheeler.net>,
	Mike Snitzer <snitzer@redhat.com>, ejt@redhat.com,
	Coly Li <colyli@suse.de>, dm-devel@redhat.com,
	linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
	lvm-devel@redhat.com, joe.thornber@gmail.com
References: <alpine.LRH.2.11.1909251814220.15810@mx.ewheeler.net>
	<20190925200138.GA20584@redhat.com>
	<alpine.LRH.2.11.1909261819300.15810@mx.ewheeler.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.LRH.2.11.1909261819300.15810@mx.ewheeler.net>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: joe.thornber@gmail.com, Mike Snitzer <snitzer@redhat.com>,
	dm-devel@redhat.com, linux-bcache@vger.kernel.org,
	Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
	ejt@redhat.com, lvm-devel@redhat.com
Subject: Re: [dm-devel] kernel BUG at
 drivers/md/persistent-data/dm-space-map-disk.c:178 with
 scsi_mod.use_blk_mq=y
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.65]); Fri, 27 Sep 2019 08:38:06 +0000 (UTC)

Hi Eric,

On Thu, Sep 26, 2019 at 06:27:09PM +0000, Eric Wheeler wrote:
> I pvmoved the tmeta to an SSD logical volume (dm-linear) on a non-bcache 
> volume and we got the same trace this morning, so while the tdata still 
> passes through bcache, all meta operations are direct to an SSD. This is 
> still using multi-queue scsi, but dm_mod.use_blk_mq=N.
> 
> Since bcache is no longer involved with metadata operations, and since 
> this appears to be a metadata issue, are there any other reasons to 
> suspect bcache?

Did you recreate the pool, or are you just using the existing pool but with
a different IO path?  If it's the latter then there could still be something
wrong with the metadata, introduced while bcache was in the stack.

Would it be possible to send me a copy of the metadata device please so
I can double check the space maps (I presume you've run thin_check on it)?

[Assuming you're using the existing pool] Another useful experiment would be to 
thump_dump and then thin_restore the metadata, which will create totally fresh
metadata and see if you can still reproduce the issue.

Thanks,

- Joe

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
