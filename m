Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id AB900265F76
	for <lists+dm-devel@lfdr.de>; Fri, 11 Sep 2020 14:23:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599827010;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lxfllS6gbyt9EhK5MlEhTw5oY5N7W5sSynx2HLIb/iI=;
	b=ZzxE+A0GqoMMNAS5qvWp/p4aADuo5ZjJG6rstlK4a5gxCUMhpB7NDj0yxNJMxtjrpMoWcZ
	qJkYkM61cYeM1wIrMHmylvje2D9b2TyVFyQOyCTKhSqMQFNg2O+DoMu3whAPRtMRGQrqne
	//J1eZWnL3V0wF8etSl/8yDCTTMrEUw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-RN7B4kx-O0KoLdSWNfi-Tg-1; Fri, 11 Sep 2020 08:23:28 -0400
X-MC-Unique: RN7B4kx-O0KoLdSWNfi-Tg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2E2A10082E6;
	Fri, 11 Sep 2020 12:23:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 48B9876E16;
	Fri, 11 Sep 2020 12:23:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8C5AB181A06B;
	Fri, 11 Sep 2020 12:23:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08BCKrtR017005 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 11 Sep 2020 08:20:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D66885D9F7; Fri, 11 Sep 2020 12:20:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from T590 (ovpn-13-69.pek2.redhat.com [10.72.13.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B641C5D9E8;
	Fri, 11 Sep 2020 12:20:42 +0000 (UTC)
Date: Fri, 11 Sep 2020 20:20:38 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20200911122038.GA167338@T590>
References: <529c2394-1b58-b9d8-d462-1f3de1b78ac8@oracle.com>
	<20200910142438.GA21919@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200910142438.GA21919@redhat.com>
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

On Thu, Sep 10, 2020 at 10:24:39AM -0400, Mike Snitzer wrote:
> [cc'ing dm-devel and linux-block because this is upstream concern too]
> 
> On Wed, Sep 09 2020 at  1:00pm -0400,
> Vijayendra Suman <vijayendra.suman@oracle.com> wrote:
> 
> >    Hello Mike,
> > 
> >    While Running pgbench tool with  5.4.17 kernel build
> > 
> >    Following performance degrade is found out
> > 
> >    buffer read/write metric : -17.2%
> >    cache read/write metric : -18.7%
> >    disk read/write metric : -19%
> > 
> >    buffer
> >    number of transactions actually processed: 840972
> >    latency average = 24.013 ms
> >    tps = 4664.153934 (including connections establishing)
> >    tps = 4664.421492 (excluding connections establishing)
> > 
> >    cache
> >    number of transactions actually processed: 551345
> >    latency average = 36.949 ms
> >    tps = 3031.223905 (including connections establishing)
> >    tps = 3031.402581 (excluding connections establishing)
> > 
> >    After revert of Commit
> >    2892100bc85ae446088cebe0c00ba9b194c0ac9d ( Revert "dm: always call
> >    blk_queue_split() in dm_process_bio()")
> 
> I assume 2892100bc85ae446088cebe0c00ba9b194c0ac9d is 5.4-stable's
> backport of upstream commit 120c9257f5f19e5d1e87efcbb5531b7cd81b7d74 ?
> 
> >    Performance is Counter measurement
> > 
> >    buffer ->
> >    number of transactions actually processed: 1135735
> >    latency average = 17.799 ms
> >    tps = 6292.586749 (including connections establishing)
> >    tps = 6292.875089 (excluding connections establishing)
> > 
> >    cache ->
> >    number of transactions actually processed: 648177
> >    latency average = 31.217 ms
> >    tps = 3587.755975 (including connections establishing)
> >    tps = 3587.966359 (excluding connections establishing)
> > 
> >    Following is your commit
> > 
> >    diff --git a/drivers/md/dm.c b/drivers/md/dm.c
> >    index cf71a2277d60..1e6e0c970e19 100644
> >    --- a/drivers/md/dm.c
> >    +++ b/drivers/md/dm.c
> >    @@ -1760,8 +1760,9 @@ static blk_qc_t dm_process_bio(struct mapped_device
> >    *md,
> >             * won't be imposed.
> >             */
> >            if (current->bio_list) {
> >    -               blk_queue_split(md->queue, &bio);
> >    -               if (!is_abnormal_io(bio))
> >    +               if (is_abnormal_io(bio))
> >    +                       blk_queue_split(md->queue, &bio);
> >    +               else
> >                            dm_queue_split(md, ti, &bio);
> >            }
> > 
> >    Could you have a look if it is safe to revert this commit.
> 
> No, it really isn't a good idea given what was documented in the commit
> header for commit 120c9257f5f19e5d1e87efcbb5531b7cd81b7d74 -- the
> excessive splitting is not conducive to performance either.
> 
> So I think we need to identify _why_ reverting this commit is causing
> such a performance improvement.  Why is calling blk_queue_split() before
> dm_queue_split() benefiting your pgbench workload?

blk_queue_split() takes every queue's limit into account, and dm_queue_split()
only splits bio according to max len(offset, chunk size), so the
splitted bio may not be optimal one from device viewpoint.

Maybe DM can switch to blk_queue_split() if 'chunk_sectors' limit is power-2
aligned.


Thanks,
Ming

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

