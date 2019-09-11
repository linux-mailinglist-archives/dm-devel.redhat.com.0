Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EE8B04D2
	for <lists+dm-devel@lfdr.de>; Wed, 11 Sep 2019 22:23:16 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 578053084242;
	Wed, 11 Sep 2019 20:23:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8677619C77;
	Wed, 11 Sep 2019 20:23:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CD9D24A486;
	Wed, 11 Sep 2019 20:23:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8BKMX8h025886 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 11 Sep 2019 16:22:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 705CC5C21E; Wed, 11 Sep 2019 20:22:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AFAA45C207;
	Wed, 11 Sep 2019 20:22:28 +0000 (UTC)
Date: Wed, 11 Sep 2019 16:22:27 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Nikos Tsironis <ntsironis@arrikto.com>
Message-ID: <20190911202227.GA1413@redhat.com>
References: <201909120035.YsFPOauD%lkp@intel.com>
	<20190911182251.GA634@redhat.com>
	<c35fcc93-91a2-20c2-da4c-9bbdee94e510@arrikto.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c35fcc93-91a2-20c2-da4c-9bbdee94e510@arrikto.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Ilias Tsitsimpis <iliastsi@arrikto.com>,
	kbuild test robot <lkp@intel.com>, kbuild-all@01.org
Subject: Re: [dm-devel] [dm:for-next 29/30]
 drivers//md/dm-clone-target.c:563:14: error: implicit declaration of
 function 'vmalloc'; did you mean 'kmalloc'?
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Wed, 11 Sep 2019 20:23:14 +0000 (UTC)

On Wed, Sep 11 2019 at  2:46pm -0400,
Nikos Tsironis <ntsironis@arrikto.com> wrote:

> On 9/11/19 9:22 PM, Mike Snitzer wrote:> 
> > I resolved this and pushed new code, thanks!
> > 
> 
> Hi Mike,
> 
> I just saw the report and was about to fix it, but I noticed you have
> already fixed it. Thanks a lot.
> 
> I had forgotten to include the header file for vmalloc(), but I saw you
> used kvmalloc(), which is even better.
> 
> I took a quick look at the diff and there are a few places that still
> need fixing:
> 
> drivers/md/dm-clone-target.c:563: clone->ht = vmalloc(sz *sizeof(struct hash_table_bucket));
> drivers/md/dm-clone-target.c:579: vfree(clone->ht);
> 
> Also, the allocation of cmd->region_map is done with kvmalloc(), but the
> deallocation is still done with vfree():
> 
> drivers/md/dm-clone-metadata.c:597: vfree(cmd->region_map);
> 
> I will be away from keyboard for the rest of the day, but I will take a
> closer look at the diff tomorrow and I will send a new version fixing
> these and any other issues I might find.

I fixed the above up, thanks.

Please just send any incremental patches relative to what I have staged
now.

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
