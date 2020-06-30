Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id AB03E20F78A
	for <lists+dm-devel@lfdr.de>; Tue, 30 Jun 2020 16:49:18 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-xz3WZVcoNdy778PZVi2GXQ-1; Tue, 30 Jun 2020 10:49:13 -0400
X-MC-Unique: xz3WZVcoNdy778PZVi2GXQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D649F6BF85;
	Tue, 30 Jun 2020 14:48:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B6B814F6B1;
	Tue, 30 Jun 2020 14:48:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 74E2B1809561;
	Tue, 30 Jun 2020 14:48:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05UEAbVV027911 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 30 Jun 2020 10:10:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 35D37EE876; Tue, 30 Jun 2020 14:10:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F879110C55
	for <dm-devel@redhat.com>; Tue, 30 Jun 2020 14:10:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 16A45857CF5
	for <dm-devel@redhat.com>; Tue, 30 Jun 2020 14:10:33 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-120-YBbQjj3oPuyVX4BUdnzt4A-1;
	Tue, 30 Jun 2020 10:10:28 -0400
X-MC-Unique: YBbQjj3oPuyVX4BUdnzt4A-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id DC17FB614;
	Tue, 30 Jun 2020 14:10:23 +0000 (UTC)
Date: Tue, 30 Jun 2020 16:10:22 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <20200630141022.GZ21462@kitsune.suse.cz>
References: <20200630123528.29660-1-msuchanek@suse.de>
	<alpine.LRH.2.02.2006300929580.4801@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.2006300929580.4801@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 30 Jun 2020 10:48:45 -0400
Cc: Pankaj Gupta <pagupta@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
	Jan Kara <jack@suse.cz>, Jakub Staron <jstaron@google.com>,
	Mike Snitzer <snitzer@redhat.com>, linux-nvdimm@lists.01.org,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
	Yuval Shaia <yuval.shaia@oracle.com>, dm-devel@redhat.com,
	Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH] dm writecache: reject asynchronous pmem.
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Jun 30, 2020 at 09:32:01AM -0400, Mikulas Patocka wrote:
> 
> 
> On Tue, 30 Jun 2020, Michal Suchanek wrote:
> 
> > The writecache driver does not handle asynchronous pmem. Reject it when
> > supplied as cache.
> > 
> > Link: https://lore.kernel.org/linux-nvdimm/87lfk5hahc.fsf@linux.ibm.com/
> > Fixes: 6e84200c0a29 ("virtio-pmem: Add virtio pmem driver")
> > 
> > Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> > ---
> >  drivers/md/dm-writecache.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/drivers/md/dm-writecache.c b/drivers/md/dm-writecache.c
> > index 30505d70f423..57b0a972f6fd 100644
> > --- a/drivers/md/dm-writecache.c
> > +++ b/drivers/md/dm-writecache.c
> > @@ -2277,6 +2277,12 @@ static int writecache_ctr(struct dm_target *ti, unsigned argc, char **argv)
> >  
> >  		wc->memory_map_size -= (uint64_t)wc->start_sector << SECTOR_SHIFT;
> >  
> > +		if (!dax_synchronous(wc->ssd_dev->dax_dev)) {
> > +			r = -EOPNOTSUPP;
> > +			ti->error = "Asynchronous persistent memory not supported as pmem cache";
> > +			goto bad;
> > +		}
> > +
> >  		bio_list_init(&wc->flush_list);
> >  		wc->flush_thread = kthread_create(writecache_flush_thread, wc, "dm_writecache_flush");
> >  		if (IS_ERR(wc->flush_thread)) {
> > -- 
> 
> Hi
> 
> Shouldn't this be in the "if (WC_MODE_PMEM(wc))" block?
That should be always the case at this point.
> 
> WC_MODE_PMEM(wc) retrurns true if we are using persistent memory as a 
> cache device, otherwise we are using generic block device as a cache 
> device.
This is to prevent the situation where we have WC_MODE_PMEM(wc) but
cannot guarantee consistency because the async flush is not handled.

Thanks

Michal

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

