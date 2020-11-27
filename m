Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6F1342C6233
	for <lists+dm-devel@lfdr.de>; Fri, 27 Nov 2020 10:49:11 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-yJZ6n298MquZV9i5WKRkpQ-1; Fri, 27 Nov 2020 04:49:08 -0500
X-MC-Unique: yJZ6n298MquZV9i5WKRkpQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA8598049D8;
	Fri, 27 Nov 2020 09:49:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8828B1A88B;
	Fri, 27 Nov 2020 09:49:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F0AFD4A7C6;
	Fri, 27 Nov 2020 09:48:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AR9mpEi030283 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 27 Nov 2020 04:48:51 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 27ADE2166B2A; Fri, 27 Nov 2020 09:48:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 216B82166B2B
	for <dm-devel@redhat.com>; Fri, 27 Nov 2020 09:48:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E3ED3108C0A0
	for <dm-devel@redhat.com>; Fri, 27 Nov 2020 09:48:47 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-32-vpSSJF7NMiWUhhSdZ2whMQ-1;
	Fri, 27 Nov 2020 04:48:45 -0500
X-MC-Unique: vpSSJF7NMiWUhhSdZ2whMQ-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 9707D68B05; Fri, 27 Nov 2020 10:48:42 +0100 (CET)
Date: Fri, 27 Nov 2020 10:48:42 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jan Kara <jack@suse.cz>
Message-ID: <20201127094842.GA15984@lst.de>
References: <20201126130422.92945-1-hch@lst.de>
	<20201126130422.92945-38-hch@lst.de>
	<20201126182219.GC422@quack2.suse.cz>
MIME-Version: 1.0
In-Reply-To: <20201126182219.GC422@quack2.suse.cz>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, Chao Yu <yuchao0@huawei.com>,
	Mike Snitzer <snitzer@redhat.com>, linux-mm@kvack.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jan Kara <jack@suse.com>, Josef Bacik <josef@toxicpanda.com>,
	Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	Tejun Heo <tj@kernel.org>, linux-bcache@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] [PATCH 37/44] block: switch partition lookup to use
 struct block_device
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 26, 2020 at 07:22:19PM +0100, Jan Kara wrote:
> On Thu 26-11-20 14:04:15, Christoph Hellwig wrote:
> >  struct hd_struct *disk_get_part(struct gendisk *disk, int partno)
> >  {
> > -	struct hd_struct *part;
> > +	struct block_device *part;
> >  
> >  	rcu_read_lock();
> >  	part = __disk_get_part(disk, partno);
> > -	if (part)
> > -		get_device(part_to_dev(part));
> > -	rcu_read_unlock();
> > +	if (!part) {
> > +		rcu_read_unlock();
> > +		return NULL;
> > +	}
> >  
> > -	return part;
> > +	get_device(part_to_dev(part->bd_part));
> > +	rcu_read_unlock();
> > +	return part->bd_part;
> >  }
> 
> This is not directly related to this particular patch but I'm wondering:
> What prevents say del_gendisk() from racing with disk_get_part(), so that
> delete_partition() is called just after we fetched 'part' pointer and the
> last 'part' kobject ref is dropped before disk_get_part() calls
> get_device()? I don't see anything preventing that and so we'd hand out
> 'part' that is soon to be freed (after RCU grace period expires).

At this point the hd_struct is already allocated together with the
block_device, and thus only freed after the last block_device reference
goes away plus the inode freeing RCU grace period.  So the device model
ref to part is indeed gone, but that simply does not matter any more.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

