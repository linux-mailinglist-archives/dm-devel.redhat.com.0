Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 12726266359
	for <lists+dm-devel@lfdr.de>; Fri, 11 Sep 2020 18:14:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599840871;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cahTv821ebKJ6sJ45mTH2WBwymgZPB/L5SI4TtpEpNQ=;
	b=QX0S7basRNgCQ6DuXvOACRUf5ew1/3kY+xnRU9MAy6Z1vsKkpPdnBmQfDTnwPgGSQV6PbA
	HuUsV9nB1LKbaIxoeUYmqxOpxAivXDUHzTMd6N+eebUjR93wTwFtIThWVR2wGLhIUD5n+l
	Hf7uOQ0Gr2IrLjNwdBAQT5YOHJIP/xg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-0IUFRDy7PryTQFhSa0Ta2A-1; Fri, 11 Sep 2020 12:14:29 -0400
X-MC-Unique: 0IUFRDy7PryTQFhSa0Ta2A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5A271007B00;
	Fri, 11 Sep 2020 16:14:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3AC8081C49;
	Fri, 11 Sep 2020 16:14:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C9AF9181A06B;
	Fri, 11 Sep 2020 16:14:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08BGDp58015501 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 11 Sep 2020 12:13:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 87FC25D9F3; Fri, 11 Sep 2020 16:13:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F4CB5D9E8;
	Fri, 11 Sep 2020 16:13:45 +0000 (UTC)
Date: Fri, 11 Sep 2020 12:13:45 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Ming Lei <ming.lei@redhat.com>
Message-ID: <20200911161344.GA28614@redhat.com>
References: <529c2394-1b58-b9d8-d462-1f3de1b78ac8@oracle.com>
	<20200910142438.GA21919@redhat.com> <20200911122038.GA167338@T590>
MIME-Version: 1.0
In-Reply-To: <20200911122038.GA167338@T590>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
	Vijayendra Suman <vijayendra.suman@oracle.com>
Subject: Re: [dm-devel] Revert "dm: always call blk_queue_split() in
	dm_process_bio()"
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, Sep 11 2020 at  8:20am -0400,
Ming Lei <ming.lei@redhat.com> wrote:

> On Thu, Sep 10, 2020 at 10:24:39AM -0400, Mike Snitzer wrote:
> > [cc'ing dm-devel and linux-block because this is upstream concern too]
> > 
> > On Wed, Sep 09 2020 at  1:00pm -0400,
> > Vijayendra Suman <vijayendra.suman@oracle.com> wrote:
> > 
> > >    Hello Mike,
> > > 
> > >    While Running pgbench tool with  5.4.17 kernel build
> > > 
> > >    Following performance degrade is found out
> > > 
> > >    buffer read/write metric : -17.2%
> > >    cache read/write metric : -18.7%
> > >    disk read/write metric : -19%
> > > 
> > >    buffer
> > >    number of transactions actually processed: 840972
> > >    latency average = 24.013 ms
> > >    tps = 4664.153934 (including connections establishing)
> > >    tps = 4664.421492 (excluding connections establishing)
> > > 
> > >    cache
> > >    number of transactions actually processed: 551345
> > >    latency average = 36.949 ms
> > >    tps = 3031.223905 (including connections establishing)
> > >    tps = 3031.402581 (excluding connections establishing)
> > > 
> > >    After revert of Commit
> > >    2892100bc85ae446088cebe0c00ba9b194c0ac9d ( Revert "dm: always call
> > >    blk_queue_split() in dm_process_bio()")
> > 
> > I assume 2892100bc85ae446088cebe0c00ba9b194c0ac9d is 5.4-stable's
> > backport of upstream commit 120c9257f5f19e5d1e87efcbb5531b7cd81b7d74 ?
> > 
> > >    Performance is Counter measurement
> > > 
> > >    buffer ->
> > >    number of transactions actually processed: 1135735
> > >    latency average = 17.799 ms
> > >    tps = 6292.586749 (including connections establishing)
> > >    tps = 6292.875089 (excluding connections establishing)
> > > 
> > >    cache ->
> > >    number of transactions actually processed: 648177
> > >    latency average = 31.217 ms
> > >    tps = 3587.755975 (including connections establishing)
> > >    tps = 3587.966359 (excluding connections establishing)
> > > 
> > >    Following is your commit
> > > 
> > >    diff --git a/drivers/md/dm.c b/drivers/md/dm.c
> > >    index cf71a2277d60..1e6e0c970e19 100644
> > >    --- a/drivers/md/dm.c
> > >    +++ b/drivers/md/dm.c
> > >    @@ -1760,8 +1760,9 @@ static blk_qc_t dm_process_bio(struct mapped_device
> > >    *md,
> > >             * won't be imposed.
> > >             */
> > >            if (current->bio_list) {
> > >    -               blk_queue_split(md->queue, &bio);
> > >    -               if (!is_abnormal_io(bio))
> > >    +               if (is_abnormal_io(bio))
> > >    +                       blk_queue_split(md->queue, &bio);
> > >    +               else
> > >                            dm_queue_split(md, ti, &bio);
> > >            }
> > > 
> > >    Could you have a look if it is safe to revert this commit.
> > 
> > No, it really isn't a good idea given what was documented in the commit
> > header for commit 120c9257f5f19e5d1e87efcbb5531b7cd81b7d74 -- the
> > excessive splitting is not conducive to performance either.
> > 
> > So I think we need to identify _why_ reverting this commit is causing
> > such a performance improvement.  Why is calling blk_queue_split() before
> > dm_queue_split() benefiting your pgbench workload?
> 
> blk_queue_split() takes every queue's limit into account, and dm_queue_split()
> only splits bio according to max len(offset, chunk size), so the
> splitted bio may not be optimal one from device viewpoint.

Yes, but the issue is blk_queue_split() is doing the wrong thing for the
case described in the header for commit
120c9257f5f19e5d1e87efcbb5531b7cd81b7d74
 
> Maybe DM can switch to blk_queue_split() if 'chunk_sectors' limit is power-2
> aligned.

Not seeing relation to chunk_sectors being power of 2 -- other than that
is all block core supports.  But chunk_sectors isn't set for DM, you
added chunk_sectors for MD or something and DM was caught out, so
blk_queue_split() falls back to splitting on max_sectors.

You're saying DM should set 'chunk_sectors' IFF it'd be a power of 2?
While I could do that, it seems like just continuing a sequence of
hacks around earlier imposed chunk_sectors infrastructure that was a
half-measure to begin with.  Think chunk_sectors logic in block core
needs to be enhanced -- but I'll take a closer look.

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

