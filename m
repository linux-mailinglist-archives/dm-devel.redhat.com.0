Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DFB4AEBF0
	for <lists+dm-devel@lfdr.de>; Wed,  9 Feb 2022 09:12:26 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-340-lC0rPZRsNuSDdUD-FqElzA-1; Wed, 09 Feb 2022 03:12:21 -0500
X-MC-Unique: lC0rPZRsNuSDdUD-FqElzA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2DAEF192D788;
	Wed,  9 Feb 2022 08:12:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D7CFF6C181;
	Wed,  9 Feb 2022 08:12:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6F7114BB7C;
	Wed,  9 Feb 2022 08:12:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
	[10.11.54.7])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 2194cfUQ029258 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 8 Feb 2022 23:38:41 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 66B7B1402401; Wed,  9 Feb 2022 04:38:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 61EC7142B950
	for <dm-devel@redhat.com>; Wed,  9 Feb 2022 04:38:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 44F1B811E76
	for <dm-devel@redhat.com>; Wed,  9 Feb 2022 04:38:41 +0000 (UTC)
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-458-Dm36gIXzPh-0LCMcs0sTUg-1; Tue, 08 Feb 2022 23:38:39 -0500
X-MC-Unique: Dm36gIXzPh-0LCMcs0sTUg-1
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id
	20220209043836epoutp028cfe702f5824999557bf6203c643b11e~SBEbgooNG1279912799epoutp02C
	for <dm-devel@redhat.com>; Wed,  9 Feb 2022 04:38:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
	20220209043836epoutp028cfe702f5824999557bf6203c643b11e~SBEbgooNG1279912799epoutp02C
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTP id
	20220209043835epcas5p1ee6c56b765d238a016403d90930d732f~SBEae6L5f0268902689epcas5p1A;
	Wed,  9 Feb 2022 04:38:35 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.177]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4JtnFK477qz4x9Qb;
	Wed,  9 Feb 2022 04:38:29 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
	epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	34.EC.06423.54543026; Wed,  9 Feb 2022 13:38:29 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20220208184834epcas5p3a3396d81aeedc6075c2746dba6e5478c~R5BQyfGa20152701527epcas5p3q;
	Tue,  8 Feb 2022 18:48:34 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20220208184834epsmtrp19d1025712f2309762feb9b4e5764c603~R5BQxAddT1266912669epsmtrp1P;
	Tue,  8 Feb 2022 18:48:34 +0000 (GMT)
X-AuditID: b6c32a49-b13ff70000001917-d5-6203454590b2
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	6D.C5.29871.20BB2026; Wed,  9 Feb 2022 03:48:34 +0900 (KST)
Received: from test-zns (unknown [107.110.206.5]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20220208184829epsmtip27e4be18b4c9e849a698142fcd717cafc~R5BMi6Xwc2722127221epsmtip2F;
	Tue,  8 Feb 2022 18:48:29 +0000 (GMT)
Date: Wed, 9 Feb 2022 00:13:35 +0530
From: Nitesh Shetty <nj.shetty@samsung.com>
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Message-ID: <20220208184335.GA7698@test-zns>
MIME-Version: 1.0
In-Reply-To: <af214223-8bb9-a1ca-6394-9c403c9becef@opensource.wdc.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA02Te1BUVRzH59x79+5CgjeU6UgaO4ulKOCu7OLBRJpCuoIkptOUldsV7iwE
	7G776CGTgAuNCMhLHdhmZH0B8YiHDfEWcIB4JhEGynNYTOIhIgYMIAG7VP99f9/z+5zf7/x+
	c3i4TS3Xjhcs17AqORMqIC2JkruOjs6HDuGnhYtNW1FlzzMOyu1LJNGVqXkcPakd5qCUxDQu
	Wmj7FUedRmtUNfk9B92bi8LQcPEyhiqvp2Doh9x6DP2ZdQOg2JZ7GFocEqH65QkSpdTdB6jq
	wW5UWdVEoIzMES6K+6OURNVjVTjKanyBoeTzXRhq1y+SqNQYBdDd/i4C5S4iNDbXRKKY+Hnu
	W6/Rnb/70sm6SS5dpu/j0jpDL0F3tmnp4pxYkr59M4JO7c4CdEVPJEmfa63H6bTpGZJO0E2S
	dFnMAId+OvKAoEuGErj0k+ou0t/2ZMiBIJYJZFV8Vh6gCAyWyzwEvsel70glbkKRs8gd7RPw
	5UwY6yHwOuLv7B0cujIqAf9LJlS7YvkzarVgz8EDKoVWw/KDFGqNh4BVBoYqxUoXNROm1spl
	LnJWs18kFO6VrCR+FhJkPJ9BKHs8v57JWgKRoM31ArDgQUoMb10cBBeAJc+GqgBw6WoyZgqm
	AXyYnmoO/gZwObkNrCPZUYVmpArAJN06/wjAZ2Nl+GoWQW2HuQbdCs7jkdRu2LLMW7U3UxI4
	ER9DrObjlIED05svc1cPNlEfwLqOxbUKVpQTzEyt55j0y7Ap3UisagvKG07MF6/db0s5wJqS
	xrX2IDVtATPybnJN7XnBuO4m0qQ3wb8afzL7dnA08TuuCYgDcK51wEynAahL0pkJT9hRubTW
	Nk4FwYGc9032Nni5+UdsVeOUNUxYMGIm3wqWXl3XDjCvwGC+Zgu8Pxtl1jTM1ceYR1SDweLy
	fpAE7PX/e53+v3L6tRJO0FAxTZrsV2HWC55JOsKC8j0GwMkBW1ilOkzGqiVKkZz96t+VByjC
	isHaX9p1uBT0DU651AGMB+oA5OGCzVZb45YZG6tA5pszrEohVWlDWXUdkKwsKxm3sw1QrHxG
	uUYqErsLxW5ubmJ3VzeR4BWrFlkhY0PJGA0bwrJKVrXOYTwLu0js05c22MfOtxMHzyhSksaH
	hMLn1fXjtyN6R6McfLTkrCf3i5RrhoifUe23d2QanXQ4aXFYG/y2xcbPH75etCOms09yYlIY
	GXK8x1KUH/1ImR0OY/OPfIgx6We121p87pxokEW/mx99eHt76fAxa/7QRM2lmZmywLNeRrL8
	sVOEULK/sLpoA8BG7Ccb3Burla46nyvZC9dnRzVhRwe740szw+r794WLAw3Rvd41RU+n2uL1
	4QVzfRuFUsN7vnrd40i/tOZzF4998gt/rHVHx97TR4fFO/NEp4iP23I+AuO/2ftdKzo1NP0G
	0vkpBPNZcsicvOQefaur7obqzZ0tRiLgeYOAUAcxol24Ss38AyemZ0TUBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpileLIzCtJLcpLzFFi42LZdlhJXpdpN1OSweMDXBZ7bn5mtVh9t5/N
	YtqHn8wW7w8+ZrWY1D+D3eL32fPMFpef8FnsfTeb1eLCj0Ymi8eb/jNZ7Fk0icli5eqjTBbP
	ly9mtOg8fYHJ4s9DQ4uj/9+yWUw6dI3RYu8tbYs9e0+yWMxf9pTdovv6DjaLfa/3MlssP/6P
	yWJix1Umi3Oz/rBZ7HjSyGhx+N5VFovVfywsXv84yWbR2vOT3UHO4/IVb4+Jze/YPXbOusvu
	0bzgDovH5bOlHptWdbJ5bF5S7zH5xnJGj903G9g8ms4cZfaY8ekLm0dv8zs2j52t91k9Pj69
	xeKx7WEvu8f7fVfZAkSjuGxSUnMyy1KL9O0SuDI+3r/AUjDTtuL+4bdsDYzLDLsYOTkkBEwk
	VjRuYOxi5OIQEtjNKHHr7CE2iISkxLK/R5ghbGGJlf+es0MUPWGUaLy3DqyIRUBFYvWCZqYu
	Rg4ONgFtidP/OUDCIgKmEm97WllA6pkFFrFKTLi1ixEkISwQJnHo4h8wm1dAR2LZ5KOsEEMP
	MEnMf3iADSIhKHFy5hMWEJtZQEvixr+XYAuYBaQllv8DW8Ap4Cbx9ucmsONEBZQlDmw7zjSB
	UXAWku5ZSLpnIXQvYGRexSiZWlCcm55bbFhgmJdarlecmFtcmpeul5yfu4kRnEy0NHcwbl/1
	Qe8QIxMH4yFGCQ5mJRFeme7/iUK8KYmVValF+fFFpTmpxYcYpTlYlMR5L3SdjBcSSE8sSc1O
	TS1ILYLJMnFwSjUwLZzdE/fK6uqV/XN+Gskv+6bQEvv2rSafsM8xxf42sXy/dLHHl7/fmq4p
	P/lxcPbrBycPnI9fdNKzJ6GpeH10zZEKdYvVl79J7P/QY/WFM65yXsbeUhtdu9cVnPk1D592
	7JDNORPZ3r/qNXfotrV2p3WN0mdYLugX2tm1NC0k53Bvdq3qO86E10IWVRtPXzz6J3GiT0D1
	Qj0haysRFcVS9tXBxn8PWskY7b34en6i7PyAAw+lZGa9UMzWf/79cF/amYnNqhMirf1uKUe9
	LZPm9/u6wGZP85bl69Wsw47Hxr+sZphydXrBf5MTU2VdGz4xqsev3isX5JR+e8tR1lTLO/x1
	r655Jkhd2u1+/eZLJZbijERDLeai4kQAsolVpJUDAAA=
X-CMS-MailID: 20220208184834epcas5p3a3396d81aeedc6075c2746dba6e5478c
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220207141913epcas5p4d41cb549b7cca1ede5c7a66bbd110da0
References: <CAOSviJ0HmT9iwdHdNtuZ8vHETCosRMpR33NcYGVWOV0ki3EYgw@mail.gmail.com>
	<20220207141348.4235-1-nj.shetty@samsung.com>
	<CGME20220207141913epcas5p4d41cb549b7cca1ede5c7a66bbd110da0@epcas5p4.samsung.com>
	<20220207141348.4235-3-nj.shetty@samsung.com>
	<af214223-8bb9-a1ca-6394-9c403c9becef@opensource.wdc.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 09 Feb 2022 03:12:00 -0500
Cc: djwong@kernel.org, linux-nvme@lists.infradead.org, clm@fb.com,
	dm-devel@redhat.com, osandov@fb.com, javier@javigon.com,
	bvanassche@acm.org, linux-scsi@vger.kernel.org,
	nitheshshetty@gmail.com, hch@lst.de, roland@purestorage.com,
	dsterba@suse.com, chaitanyak@nvidia.com,
	SelvaKumar S <selvakuma.s1@samsung.com>, msnitzer@redhat.com,
	josef@toxicpanda.com, linux-block@vger.kernel.org,
	mpatocka@redhat.com, kbusch@kernel.org,
	Frederick.Knight@netapp.com, axboe@kernel.dk, tytso@mit.edu,
	joshi.k@samsung.com, martin.petersen@oracle.com,
	arnav.dawn@samsung.com, jack@suse.com,
	linux-fsdevel@vger.kernel.org, lsf-pc@lists.linux-foundation.org
Subject: Re: [dm-devel] [PATCH v2 02/10] block: Introduce queue limits for
 copy-offload support
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed;
	boundary="----7Im1L.vKorTl163deO4rxYDAHxkziUWsBhtki-3JrW1s26Hg=_5a767_"

------7Im1L.vKorTl163deO4rxYDAHxkziUWsBhtki-3JrW1s26Hg=_5a767_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Feb 08, 2022 at 04:01:23PM +0900, Damien Le Moal wrote:
> On 2/7/22 23:13, Nitesh Shetty wrote:
> > Add device limits as sysfs entries,
> >         - copy_offload (READ_WRITE)
> >         - max_copy_sectors (READ_ONLY)
>
> Why read-only ? With the name as you have it, it seems to be the soft
> control for the max size of copy operations rather than the actual
> device limit. So it would be better to align to other limits like max
> sectors/max_hw_sectors and have:
> 
> 	max_copy_sectors (RW)
> 	max_hw_copy_sectors (RO)
>

Idea was to have minimal number of sysfs.
We will add R/W limits in next series.

> >         - max_copy_ranges_sectors (READ_ONLY)
> >         - max_copy_nr_ranges (READ_ONLY)
> 
> Same for these.
> 
> > 
> > copy_offload(= 0), is disabled by default. This needs to be enabled if
> > copy-offload needs to be used.
> 
> How does this work ? This limit will be present for a DM device AND the
> underlying devices of the DM target. But "offload" applies only to the
> underlying devices, not the DM device...
> 
> Also, since this is not an underlying device limitation but an on/off
> switch, this should probably be moved to a request_queue boolean field
> or flag bit, controlled with sysfs.

copy_offload was used as a flag to switch between emulation/offload in
block layer.
Yeah, it makes sense to use request_queue flag for the same, also will
make dm limit calculations simple. Will add in next series.

> > max_copy_sectors = 0, indicates the device doesn't support native copy.
> > 
> > Signed-off-by: Nitesh Shetty <nj.shetty@samsung.com>
> > Signed-off-by: SelvaKumar S <selvakuma.s1@samsung.com>
> > Signed-off-by: Kanchan Joshi <joshi.k@samsung.com>
> > ---
> >  block/blk-settings.c   |  4 ++++
> >  block/blk-sysfs.c      | 51 ++++++++++++++++++++++++++++++++++++++++++
> >  include/linux/blkdev.h | 12 ++++++++++
> >  3 files changed, 67 insertions(+)
> > 
> > diff --git a/block/blk-settings.c b/block/blk-settings.c
> > index b880c70e22e4..818454552cf8 100644
> > --- a/block/blk-settings.c
> > +++ b/block/blk-settings.c
> > @@ -57,6 +57,10 @@ void blk_set_default_limits(struct queue_limits *lim)
> >  	lim->misaligned = 0;
> >  	lim->zoned = BLK_ZONED_NONE;
> >  	lim->zone_write_granularity = 0;
> > +	lim->copy_offload = 0;
> > +	lim->max_copy_sectors = 0;
> > +	lim->max_copy_nr_ranges = 0;
> > +	lim->max_copy_range_sectors = 0;
> >  }
> >  EXPORT_SYMBOL(blk_set_default_limits);
> >  
> > diff --git a/block/blk-sysfs.c b/block/blk-sysfs.c
> > index 9f32882ceb2f..dc68ae6b55c9 100644
> > --- a/block/blk-sysfs.c
> > +++ b/block/blk-sysfs.c
> > @@ -171,6 +171,48 @@ static ssize_t queue_discard_granularity_show(struct request_queue *q, char *pag
> >  	return queue_var_show(q->limits.discard_granularity, page);
> >  }
> >  
> > +static ssize_t queue_copy_offload_show(struct request_queue *q, char *page)
> > +{
> > +	return queue_var_show(q->limits.copy_offload, page);
> > +}
> > +
> > +static ssize_t queue_copy_offload_store(struct request_queue *q,
> > +				       const char *page, size_t count)
> > +{
> > +	unsigned long copy_offload;
> > +	ssize_t ret = queue_var_store(&copy_offload, page, count);
> > +
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	if (copy_offload && q->limits.max_copy_sectors == 0)
> > +		return -EINVAL;
> > +
> > +	if (copy_offload)
> > +		q->limits.copy_offload = BLK_COPY_OFFLOAD;
> > +	else
> > +		q->limits.copy_offload = 0;
> > +
> > +	return ret;
> > +}
> > +
> > +static ssize_t queue_max_copy_sectors_show(struct request_queue *q, char *page)
> > +{
> > +	return queue_var_show(q->limits.max_copy_sectors, page);
> > +}
> > +
> > +static ssize_t queue_max_copy_range_sectors_show(struct request_queue *q,
> > +		char *page)
> > +{
> > +	return queue_var_show(q->limits.max_copy_range_sectors, page);
> > +}
> > +
> > +static ssize_t queue_max_copy_nr_ranges_show(struct request_queue *q,
> > +		char *page)
> > +{
> > +	return queue_var_show(q->limits.max_copy_nr_ranges, page);
> > +}
> > +
> >  static ssize_t queue_discard_max_hw_show(struct request_queue *q, char *page)
> >  {
> >  
> > @@ -597,6 +639,11 @@ QUEUE_RO_ENTRY(queue_nr_zones, "nr_zones");
> >  QUEUE_RO_ENTRY(queue_max_open_zones, "max_open_zones");
> >  QUEUE_RO_ENTRY(queue_max_active_zones, "max_active_zones");
> >  
> > +QUEUE_RW_ENTRY(queue_copy_offload, "copy_offload");
> > +QUEUE_RO_ENTRY(queue_max_copy_sectors, "max_copy_sectors");
> > +QUEUE_RO_ENTRY(queue_max_copy_range_sectors, "max_copy_range_sectors");
> > +QUEUE_RO_ENTRY(queue_max_copy_nr_ranges, "max_copy_nr_ranges");
> > +
> >  QUEUE_RW_ENTRY(queue_nomerges, "nomerges");
> >  QUEUE_RW_ENTRY(queue_rq_affinity, "rq_affinity");
> >  QUEUE_RW_ENTRY(queue_poll, "io_poll");
> > @@ -643,6 +690,10 @@ static struct attribute *queue_attrs[] = {
> >  	&queue_discard_max_entry.attr,
> >  	&queue_discard_max_hw_entry.attr,
> >  	&queue_discard_zeroes_data_entry.attr,
> > +	&queue_copy_offload_entry.attr,
> > +	&queue_max_copy_sectors_entry.attr,
> > +	&queue_max_copy_range_sectors_entry.attr,
> > +	&queue_max_copy_nr_ranges_entry.attr,
> >  	&queue_write_same_max_entry.attr,
> >  	&queue_write_zeroes_max_entry.attr,
> >  	&queue_zone_append_max_entry.attr,
> > diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
> > index efed3820cbf7..f63ae50f1de3 100644
> > --- a/include/linux/blkdev.h
> > +++ b/include/linux/blkdev.h
> > @@ -51,6 +51,12 @@ extern struct class block_class;
> >  /* Doing classic polling */
> >  #define BLK_MQ_POLL_CLASSIC -1
> >  
> > +/* Define copy offload options */
> > +enum blk_copy {
> > +	BLK_COPY_EMULATE = 0,
> > +	BLK_COPY_OFFLOAD,
> > +};
> > +
> >  /*
> >   * Maximum number of blkcg policies allowed to be registered concurrently.
> >   * Defined here to simplify include dependency.
> > @@ -253,6 +259,10 @@ struct queue_limits {
> >  	unsigned int		discard_granularity;
> >  	unsigned int		discard_alignment;
> >  	unsigned int		zone_write_granularity;
> > +	unsigned int            copy_offload;
> > +	unsigned int            max_copy_sectors;
> > +	unsigned short          max_copy_range_sectors;
> > +	unsigned short          max_copy_nr_ranges;
> >  
> >  	unsigned short		max_segments;
> >  	unsigned short		max_integrity_segments;
> > @@ -562,6 +572,7 @@ struct request_queue {
> >  #define QUEUE_FLAG_RQ_ALLOC_TIME 27	/* record rq->alloc_time_ns */
> >  #define QUEUE_FLAG_HCTX_ACTIVE	28	/* at least one blk-mq hctx is active */
> >  #define QUEUE_FLAG_NOWAIT       29	/* device supports NOWAIT */
> > +#define QUEUE_FLAG_COPY		30	/* supports copy offload */
> 
> Then what is the point of max_copy_sectors limit ? You can test support
> by the device by looking at max_copy_sectors != 0, no ? This flag is
> duplicated information.
> I would rather use it for the on/off switch for the copy offload,
> removing the copy_offload limit.
> 

Same as above

> >  
> >  #define QUEUE_FLAG_MQ_DEFAULT	((1 << QUEUE_FLAG_IO_STAT) |		\
> >  				 (1 << QUEUE_FLAG_SAME_COMP) |		\
> > @@ -585,6 +596,7 @@ bool blk_queue_flag_test_and_set(unsigned int flag, struct request_queue *q);
> >  #define blk_queue_io_stat(q)	test_bit(QUEUE_FLAG_IO_STAT, &(q)->queue_flags)
> >  #define blk_queue_add_random(q)	test_bit(QUEUE_FLAG_ADD_RANDOM, &(q)->queue_flags)
> >  #define blk_queue_discard(q)	test_bit(QUEUE_FLAG_DISCARD, &(q)->queue_flags)
> > +#define blk_queue_copy(q)	test_bit(QUEUE_FLAG_COPY, &(q)->queue_flags)
> >  #define blk_queue_zone_resetall(q)	\
> >  	test_bit(QUEUE_FLAG_ZONE_RESETALL, &(q)->queue_flags)
> >  #define blk_queue_secure_erase(q) \
> 
> 
> -- 
> Damien Le Moal
> Western Digital Research
> 

--
Thank you
Nitesh

------7Im1L.vKorTl163deO4rxYDAHxkziUWsBhtki-3JrW1s26Hg=_5a767_
Content-Type: text/plain; charset="utf-8"


------7Im1L.vKorTl163deO4rxYDAHxkziUWsBhtki-3JrW1s26Hg=_5a767_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel
------7Im1L.vKorTl163deO4rxYDAHxkziUWsBhtki-3JrW1s26Hg=_5a767_--

