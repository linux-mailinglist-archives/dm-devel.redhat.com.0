Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 844A22BA533
	for <lists+dm-devel@lfdr.de>; Fri, 20 Nov 2020 09:56:57 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-tuDC6JUONfyPFM3YllRbEA-1; Fri, 20 Nov 2020 03:56:54 -0500
X-MC-Unique: tuDC6JUONfyPFM3YllRbEA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D02AB80ED8B;
	Fri, 20 Nov 2020 08:56:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 13B8C5D9C6;
	Fri, 20 Nov 2020 08:56:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B21DF180954D;
	Fri, 20 Nov 2020 08:56:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AK8uaMY018037 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 20 Nov 2020 03:56:36 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 95DDB10EB29A; Fri, 20 Nov 2020 08:56:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9239910EB294
	for <dm-devel@redhat.com>; Fri, 20 Nov 2020 08:56:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 45109103B803
	for <dm-devel@redhat.com>; Fri, 20 Nov 2020 08:56:34 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-102-xRxcgKI0MEq6UuOjcgdxBA-1;
	Fri, 20 Nov 2020 03:56:31 -0500
X-MC-Unique: xRxcgKI0MEq6UuOjcgdxBA-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 134F468B05; Fri, 20 Nov 2020 09:56:27 +0100 (CET)
Date: Fri, 20 Nov 2020 09:56:26 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jan Kara <jack@suse.cz>
Message-ID: <20201120085626.GB21715@lst.de>
References: <20201118084800.2339180-1-hch@lst.de>
	<20201118084800.2339180-12-hch@lst.de>
	<20201119094157.GT1981@quack2.suse.cz>
MIME-Version: 1.0
In-Reply-To: <20201119094157.GT1981@quack2.suse.cz>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, Mike Snitzer <snitzer@redhat.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Richard Weinberger <richard@nod.at>,
	Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
	linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	dm-devel@redhat.com, linux-mtd@lists.infradead.org,
	linux-mm@kvack.org, Jan Kara <jack@suse.com>,
	Tejun Heo <tj@kernel.org>, xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] [PATCH 11/20] block: reference struct block_device
 from struct hd_struct
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
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 19, 2020 at 10:41:57AM +0100, Jan Kara wrote:
> >  	rcu_assign_pointer(ptbl->part[0], &disk->part0);
> > @@ -1772,8 +1626,10 @@ struct gendisk *__alloc_disk_node(int minors, int node_id)
> >  	 * converted to make use of bd_mutex and sequence counters.
> >  	 */
> >  	hd_sects_seq_init(&disk->part0);
> > -	if (hd_ref_init(&disk->part0))
> > -		goto out_free_part0;
> > +	if (hd_ref_init(&disk->part0)) {
> > +		hd_free_part(&disk->part0);
> 
> Aren't you missing kfree(disk) here?

This should actually jump to out_free_bdstats, I've fixed it up.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

