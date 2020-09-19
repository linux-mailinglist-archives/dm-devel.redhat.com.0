Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 87385270B55
	for <lists+dm-devel@lfdr.de>; Sat, 19 Sep 2020 09:01:45 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-1uMIsvWcNWyIM0vx1f_bZw-1; Sat, 19 Sep 2020 03:01:42 -0400
X-MC-Unique: 1uMIsvWcNWyIM0vx1f_bZw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B6AD801F9A;
	Sat, 19 Sep 2020 07:01:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1910C7367A;
	Sat, 19 Sep 2020 07:01:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9912344A47;
	Sat, 19 Sep 2020 07:01:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08J71UGx007928 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 19 Sep 2020 03:01:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8EC5A2157F26; Sat, 19 Sep 2020 07:01:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 892022157F24
	for <dm-devel@redhat.com>; Sat, 19 Sep 2020 07:01:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C0509858286
	for <dm-devel@redhat.com>; Sat, 19 Sep 2020 07:01:25 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-305-IMVdMAtoN_G-tOAMOxMgaQ-1;
	Sat, 19 Sep 2020 03:01:20 -0400
X-MC-Unique: IMVdMAtoN_G-tOAMOxMgaQ-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 6D18468BEB; Sat, 19 Sep 2020 09:01:17 +0200 (CEST)
Date: Sat, 19 Sep 2020 09:01:17 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jan Kara <jack@suse.cz>
Message-ID: <20200919070117.GB8237@lst.de>
References: <20200910144833.742260-1-hch@lst.de>
	<20200910144833.742260-5-hch@lst.de>
	<20200917100459.GK7347@quack2.suse.cz>
MIME-Version: 1.0
In-Reply-To: <20200917100459.GK7347@quack2.suse.cz>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>, Minchan Kim <minchan@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org, linux-mm@kvack.org,
	cgroups@vger.kernel.org, drbd-dev@tron.linbit.com,
	linux-fsdevel@vger.kernel.org, David Sterba <dsterba@suse.com>,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] [PATCH 04/12] bdi: initialize ->ra_pages and
 ->io_pages in bdi_init
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Sep 17, 2020 at 12:04:59PM +0200, Jan Kara wrote:
> On Thu 10-09-20 16:48:24, Christoph Hellwig wrote:
> > Set up a readahead size by default, as very few users have a good
> > reason to change it.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > Acked-by: David Sterba <dsterba@suse.com> [btrfs]
> > Acked-by: Richard Weinberger <richard@nod.at> [ubifs, mtd]
> 
> Looks good but what about coda, ecryptfs, and orangefs? Currenly they have
> readahead disabled and this patch would seem to enable it?

When going through this I pinged all maintainers and asked if anyone
had a reason to actually disable the readahead, and only vbox and
the mtd/ubifs maintainers came up with a reason.

> 
> > diff --git a/mm/backing-dev.c b/mm/backing-dev.c
> > index 8e8b00627bb2d8..2dac3be6127127 100644
> > --- a/mm/backing-dev.c
> > +++ b/mm/backing-dev.c
> > @@ -746,6 +746,8 @@ struct backing_dev_info *bdi_alloc(int node_id)
> >  		kfree(bdi);
> >  		return NULL;
> >  	}
> > +	bdi->ra_pages = VM_READAHEAD_PAGES;
> > +	bdi->io_pages = VM_READAHEAD_PAGES;
> 
> Won't this be more logical in bdi_init() than in bdi_alloc()?

bdi_init is also used for noop_backing_dev_info, which should not
have readahead enabled.  In fact the only caller except for
bdi_alloc is the initialization of noop_backing_dev_info.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

