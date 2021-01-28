Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 35D97308772
	for <lists+dm-devel@lfdr.de>; Fri, 29 Jan 2021 10:39:04 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-7XQzR3YCM3KQNf0Kwzhx3g-1; Fri, 29 Jan 2021 04:38:19 -0500
X-MC-Unique: 7XQzR3YCM3KQNf0Kwzhx3g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B7348030A8;
	Fri, 29 Jan 2021 09:38:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 38E416268B;
	Fri, 29 Jan 2021 09:38:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E63DD4BB7B;
	Fri, 29 Jan 2021 09:38:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10SCJC0D007472 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 28 Jan 2021 07:19:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D7B63101F0AB; Thu, 28 Jan 2021 12:19:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D3ED7101F0A3
	for <dm-devel@redhat.com>; Thu, 28 Jan 2021 12:19:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 93B7B81F467
	for <dm-devel@redhat.com>; Thu, 28 Jan 2021 12:19:09 +0000 (UTC)
Received: from out30-44.freemail.mail.aliyun.com
	(out30-44.freemail.mail.aliyun.com [115.124.30.44]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-61-HICElwQrMkGKMpK36HXwTg-1;
	Thu, 28 Jan 2021 07:19:05 -0500
X-MC-Unique: HICElwQrMkGKMpK36HXwTg-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R261e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04357;
	MF=joseph.qi@linux.alibaba.com; NM=1; PH=DS; RN=56; SR=0;
	TI=SMTPD_---0UN8ZMkY_1611836008
Received: from B-D1K7ML85-0059.local(mailfrom:joseph.qi@linux.alibaba.com
	fp:SMTPD_---0UN8ZMkY_1611836008) by smtp.aliyun-inc.com(127.0.0.1);
	Thu, 28 Jan 2021 20:13:29 +0800
To: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, dm-devel@redhat.com,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@tron.linbit.com, xen-devel@lists.xenproject.org,
	linux-nvme@lists.infradead.org, linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org, linux-fscrypt@vger.kernel.org,
	jfs-discussion@lists.sourceforge.net, linux-nilfs@vger.kernel.org,
	ocfs2-devel@oss.oracle.com, linux-pm@vger.kernel.org, linux-mm@kvack.org
References: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
	<20210128071133.60335-26-chaitanya.kulkarni@wdc.com>
From: Joseph Qi <joseph.qi@linux.alibaba.com>
Message-ID: <8ba2c461-6042-757d-a3c1-0490932e749e@linux.alibaba.com>
Date: Thu, 28 Jan 2021 20:13:28 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
	Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210128071133.60335-26-chaitanya.kulkarni@wdc.com>
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
X-Mailman-Approved-At: Fri, 29 Jan 2021 04:33:26 -0500
Cc: shaggy@kernel.org, sergey.senozhatsky.work@gmail.com, snitzer@redhat.com,
	tiwai@suse.de, djwong@kernel.org, gustavoars@kernel.org,
	pavel@ucw.cz, alex.shi@linux.alibaba.com, hch@lst.de,
	agk@redhat.com, naohiro.aota@wdc.com, sagi@grimberg.me,
	mark@fasheh.com, osandov@fb.com, ebiggers@kernel.org,
	ngupta@vflare.org, len.brown@intel.com, konrad.wilk@oracle.com,
	ming.lei@redhat.com, viro@zeniv.linux.org.uk,
	jefflexu@linux.alibaba.com, jaegeuk@kernel.org,
	konishi.ryusuke@gmail.com, bvanassche@acm.org, axboe@kernel.dk,
	damien.lemoal@wdc.com, jth@kernel.org, tytso@mit.edu,
	akpm@linux-foundation.org, martin.petersen@oracle.com,
	rjw@rjwysocki.net, philipp.reisner@linbit.com,
	minchan@kernel.org, tj@kernel.org, lars.ellenberg@linbit.com,
	roger.pau@citrix.com, asml.silence@gmail.com, jlbec@evilplan.org
Subject: Re: [dm-devel] [RFC PATCH 25/34] ocfs/cluster: use bio_new in
	dm-log-writes
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

I think you send a wrong subject by mistake.

Thanks,
Joseph

On 1/28/21 3:11 PM, Chaitanya Kulkarni wrote:
> Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
> ---
>  fs/ocfs2/cluster/heartbeat.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/ocfs2/cluster/heartbeat.c b/fs/ocfs2/cluster/heartbeat.c
> index 0179a73a3fa2..b34518036446 100644
> --- a/fs/ocfs2/cluster/heartbeat.c
> +++ b/fs/ocfs2/cluster/heartbeat.c
> @@ -515,12 +515,13 @@ static struct bio *o2hb_setup_one_bio(struct o2hb_region *reg,
>  	unsigned int cs = *current_slot;
>  	struct bio *bio;
>  	struct page *page;
> +	sector_t sect = (reg->hr_start_block + cs) << (bits - 9);
>  
>  	/* Testing has shown this allocation to take long enough under
>  	 * GFP_KERNEL that the local node can get fenced. It would be
>  	 * nicest if we could pre-allocate these bios and avoid this
>  	 * all together. */
> -	bio = bio_alloc(GFP_ATOMIC, 16);
> +	bio = bio_new(reg->hr_bdev, sect, op, op_flags, 16, GFP_ATOMIC);
>  	if (!bio) {
>  		mlog(ML_ERROR, "Could not alloc slots BIO!\n");
>  		bio = ERR_PTR(-ENOMEM);
> @@ -528,11 +529,8 @@ static struct bio *o2hb_setup_one_bio(struct o2hb_region *reg,
>  	}
>  
>  	/* Must put everything in 512 byte sectors for the bio... */
> -	bio->bi_iter.bi_sector = (reg->hr_start_block + cs) << (bits - 9);
> -	bio_set_dev(bio, reg->hr_bdev);
>  	bio->bi_private = wc;
>  	bio->bi_end_io = o2hb_bio_end_io;
> -	bio_set_op_attrs(bio, op, op_flags);
>  
>  	vec_start = (cs << bits) % PAGE_SIZE;
>  	while(cs < max_slots) {
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

