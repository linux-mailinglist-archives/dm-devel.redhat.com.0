Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id BA34F2C878F
	for <lists+dm-devel@lfdr.de>; Mon, 30 Nov 2020 16:18:18 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-XkPf_6FqOZi6nMGXmwyw0Q-1; Mon, 30 Nov 2020 10:18:14 -0500
X-MC-Unique: XkPf_6FqOZi6nMGXmwyw0Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3075C18C8C04;
	Mon, 30 Nov 2020 15:18:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 254C3282C6;
	Mon, 30 Nov 2020 15:18:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9F65F4BB7B;
	Mon, 30 Nov 2020 15:18:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AUFHppN022954 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 30 Nov 2020 10:17:51 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4529447CE1; Mon, 30 Nov 2020 15:17:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4030347CD0
	for <dm-devel@redhat.com>; Mon, 30 Nov 2020 15:17:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E63E3185A794
	for <dm-devel@redhat.com>; Mon, 30 Nov 2020 15:17:47 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-310-82Qx-hXfMKG61bTh3Mm6VA-1;
	Mon, 30 Nov 2020 10:17:43 -0500
X-MC-Unique: 82Qx-hXfMKG61bTh3Mm6VA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 62EECAB63;
	Mon, 30 Nov 2020 15:17:42 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id CC8061E131B; Mon, 30 Nov 2020 16:17:41 +0100 (CET)
Date: Mon, 30 Nov 2020 16:17:41 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20201130151741.GN11250@quack2.suse.cz>
References: <20201128161510.347752-1-hch@lst.de>
	<20201128161510.347752-31-hch@lst.de>
	<20201130094421.GD11250@quack2.suse.cz>
	<20201130145150.GA24694@lst.de>
MIME-Version: 1.0
In-Reply-To: <20201130145150.GA24694@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, Chao Yu <yuchao0@huawei.com>,
	Jan Kara <jack@suse.cz>, Mike Snitzer <snitzer@redhat.com>,
	linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jan Kara <jack@suse.com>, Josef Bacik <josef@toxicpanda.com>,
	Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	Tejun Heo <tj@kernel.org>, linux-bcache@vger.kernel.org
Subject: Re: [dm-devel] [PATCH 30/45] block: remove the nr_sects field in
 struct hd_struct
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

On Mon 30-11-20 15:51:50, Christoph Hellwig wrote:
> On Mon, Nov 30, 2020 at 10:44:21AM +0100, Jan Kara wrote:
> > I know I'm like a broken record about this but I still don't understand
> > here... I'd expect the new code to be:
> > 
> > 	if (size == capacity ||
> > 	    (disk->flags & (GENHD_FL_UP | GENHD_FL_HIDDEN)) != GENHD_FL_UP)
> > 		return false;
> > 	pr_info("%s: detected capacity change from %lld to %lld\n",
> > 		disk->disk_name, size, capacity);
> > +	if (!capacity || !size)
> > +		return false;
> > 	kobject_uevent_env(&disk_to_dev(disk)->kobj, KOBJ_CHANGE, envp);
> > 	return true;
> > 
> > At least that would be equivalent to the original functionality of
> > set_capacity_and_notify(). And if you indeed intend to change when
> > "RESIZE=1" events are sent, then I'd expect an explanation in the changelog
> > why this cannot break userspace (I remember we've already broken some udev
> > rules in the past by generating unexpected events and we had to revert
> > those changes in the partition code so I'm more careful now). The rest of
> > the patch looks good to me.
> 
> I explained that I think the GENHD_FL_UP is the more useful one here in
> reply to your last comment.   If the size changes to or from 0 during
> runtime we probably do want an event.

Ah, right, sorry, I missed that. And I agree that it might make sense for
changes to / from zero during runtime to send notification. But it still
seems as a thin ice with potential to breakage to me.

> But I'll add your hunk for now and we can discuss this separately.

OK, thanks. With that hunk feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

