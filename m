Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0343A6CFBA6
	for <lists+dm-devel@lfdr.de>; Thu, 30 Mar 2023 08:33:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680157993;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=UGLAec32RdUypxpjkZDMS7DT7dUdbjfN6JCgEYUV36o=;
	b=WMrKPmnKW1VGEbImnpuUX7Dje5WQO4qkaSfvx+qqW4Vm+hnJIP/h5RiA5i6sazCEIt2c/T
	rLJFP6NQ/85iFlHeMVsG3/F2JOm1N4eGgmMLOsnKPGnvw1ceUJr/FEcA8bkTsOxiLfZfP4
	bTVG4AK5fkxW5valJTMd9ZkaBm4hxgE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-22-HxESycEjPl--DvU1BIk4fQ-1; Thu, 30 Mar 2023 02:33:10 -0400
X-MC-Unique: HxESycEjPl--DvU1BIk4fQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 63B671C0754A;
	Thu, 30 Mar 2023 06:33:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 49E7F1121331;
	Thu, 30 Mar 2023 06:33:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7F32919472FC;
	Thu, 30 Mar 2023 06:33:00 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 44A971946587
 for <dm-devel@listman.corp.redhat.com>; Wed, 29 Mar 2023 15:32:19 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 336622027041; Wed, 29 Mar 2023 15:32:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B5172027040
 for <dm-devel@redhat.com>; Wed, 29 Mar 2023 15:32:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4CCEE3C115D6
 for <dm-devel@redhat.com>; Wed, 29 Mar 2023 15:32:04 +0000 (UTC)
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-402-YuJ0BaaSNTivyEOfDjvn7Q-1; Wed, 29 Mar 2023 11:31:49 -0400
X-MC-Unique: YuJ0BaaSNTivyEOfDjvn7Q-1
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20230329153140epoutp010f586642e175df1c338ca2191c630536~Q7ZiaVEZY1616116161epoutp01S
 for <dm-devel@redhat.com>; Wed, 29 Mar 2023 15:31:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20230329153140epoutp010f586642e175df1c338ca2191c630536~Q7ZiaVEZY1616116161epoutp01S
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTP id
 20230329153140epcas5p2187b6222977220b478707e4110832287~Q7Zh4Jy120206202062epcas5p2p;
 Wed, 29 Mar 2023 15:31:40 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.180]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4PmrBL3fRcz4x9Pp; Wed, 29 Mar
 2023 15:31:38 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
 epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 D5.35.55678.AD954246; Thu, 30 Mar 2023 00:31:38 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20230329122332epcas5p18d8fb49860b4f620c83d864f983dc318~Q41RtmV-v3011130111epcas5p1S;
 Wed, 29 Mar 2023 12:23:32 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20230329122332epsmtrp285677189ce45d399a733d85b41537988~Q41Rsdqha1377213772epsmtrp2A;
 Wed, 29 Mar 2023 12:23:32 +0000 (GMT)
X-AuditID: b6c32a4a-6a3ff7000000d97e-0d-642459da83eb
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 C1.61.31821.4CD24246; Wed, 29 Mar 2023 21:23:32 +0900 (KST)
Received: from green5 (unknown [107.110.206.5]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20230329122329epsmtip1d7e903ca9345c0a0898a40661b608708~Q41OSH1Cq1731717317epsmtip1Y;
 Wed, 29 Mar 2023 12:23:28 +0000 (GMT)
Date: Wed, 29 Mar 2023 17:52:48 +0530
From: Nitesh Shetty <nj.shetty@samsung.com>
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Message-ID: <20230329122248.GD11932@green5>
MIME-Version: 1.0
In-Reply-To: <71d9f461-a708-341f-d012-d142086c026e@opensource.wdc.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA02Tf0xTVxTHc99rX1uTbm8g8VpA2GNqAMEWWrxswMQR8jJxYyMmwMJYQ1+A
 Fdqur1UnGFHEn1OQX0ohAkrmAIFYmZZf4mCAxTG28ENkMmFCtglFfsQtyhhrfbD43+ec7zn3
 3HNOjhB3uiSQCFM1BkavUaZRxDrezU5vH7/RuLdU0ocFEtTQ242jo3nLOKodyyXQdOcCQMVz
 z3G01NePo7bZUj56cKcJQ62X8zFUXduFoZbKeQx1rdgIlN8xDNDUkAlDbaO+qLXNykMDzWUE
 Kv96SoA6CrIxZJk8AlD99FMeujvqih6fOQlQ/3IPfyekBwZ306ZHfQTdZBoT0P2/XufRA31G
 2lxziqBvVB2mWx5kEfTZ7Fl7QM4jPv309hBBn2usAfSNexn0onkTbZ60YdGvx6tDUhilitF7
 MpokrSpVkxxK7Y5JfC9RESSV+cmC0Q7KU6NMZ0KpiKhov8jUNPscKM99yjSj3RWtZFlqe1iI
 Xms0MJ4pWtYQSjE6VZpOrvNnlemsUZPsr2EMb8uk0gCFPfAzdcrMH8U8nVV2oK7wFMgCFVtP
 A5EQknLY8P0SOA3WCZ3IFgDvd1r5nLEA4G/to6vGIoBtAyfxtZSBvFmCE5oBzF20EQ7BiZwE
 MOcnDwfzyM2wfHpKcBoIhQTpC++tCB3u9aQC2r7K4TlycbKPD39oGuQ7BGdyF6xqvQYcLLbH
 l49/x+f4DWgtmeQ5WERGwoIT1QIHu5Be8M7NHszxECRvieA/piKM+10EHFso5nHsDJ/0NAo4
 lsDF2TaC4/2wuvAbgks+BqDpvglwwrswpzf3ZZs4mQpXRur5nN8dFvXWY5z/NXh2aXK1mBha
 Lq2xF7zWULFaYCMc/vvIKtOwOn9odVwvAJyoKwJ5wMP0SnemV+pxvA1WtCwQJvv0cNIVXv1X
 yKE3bGjeXgH4NWAjo2PTkxlWoQvQMPv/X3mSNt0MXh6Kz/sWMDE+598BMCHoAFCIU+vFS8OU
 ykmsUn55kNFrE/XGNIbtAAr7ts7jEpckrf3SNIZEmTxYKg8KCpIHBwbJqA3iraHWJCcyWWlg
 1AyjY/RreZhQJMnCUhfmlz4q871bDcJn/jrY1NUqLdnTv3dzzVhY8Ljt88vdIvWuedeiiFww
 JQ3/1OA2Uui25eKWhM5Qs2iwXiTPdBFoJlwP/2m71Us56+SJ8guWAxsCSzNWLC61E8t1YTPe
 or1hQ1/E2lTPLdOfxGvVj48H2T6OUVe+yMAl+T/Lb+f+2N9UzT5UYVk9x85EvXm9/dnMibDY
 iPodFd2bEnS8uItuYl3U+bLhK6LBuV9CCmbKDrWHj3lVJgf6x4pKE9Ilma77bCUftn9Q5Zp8
 pczcabE8cXc/qjTjxqs+x62/b0tcnmBTGyP37AyISvFWeLzjHhN4YeZQ9reZTtJn8XEjPp4S
 isemKGU+uJ5V/gcPX30/sQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0xSYRjHe885HI4W64iWb1ps0M1Zatf1rqVp63K2Plhfu0pxBoYXBmJW
 W2lZlHYh2SqxZnahxK6aRQpdMAU1M2eillor6WYSxWyVFxJZq2//Pb/f/3neDy+F83uIMCo5
 LYNVpolTRGQgcbdGJIh6EjVDMm+gcja62VCHo/3aYRyVdZ8gUV/Nd4BOuX/haLCpGUcWVxEH
 dT66jyHzhQIMlZbVYqi65BuGar39JCqwOgBytukxZHk5B5kt9QRqrTpLomKDk4usugMYMvXm
 AHSj7yuB7C/D0bv8wwA1D9s48ZBpfbGW0b9uIpn7+m4u09xzm2Bam9RMufEIyVRc2sdUd2aT
 zLEDrlHh4GsO8/VBG8kcv2METEXjHsZTLmDKe/uxdRM3BC6TsCnJmawyJi4pUHbx8y7FoZgs
 j/Ming1+zMgDARSkF8FWrYvMA4EUnzYB+PDmHcIPpkDD8BPcn4Nh6cgHrl96C2BhUSXmAwQ9
 Exb3OUcBRZH0HNjopXzjEHox7D96kPD5ON3CgbrK72N+ML0CXjJfA77MG/WL3zzm+Jf+BtDW
 9YLjB0GwvrB37BU4HQk7Rj5hvgM4HQ6vjIwdCKBXQ52mlOvLk+jp8NFdG6YFQfr/2vr/2vp/
 7fMAN4IprEKVKk1VzVcsSGN3RqvEqSp1mjR6e3pqORj7ApGRJmA2uqOtAKOAFUAKF4XwBh0i
 CZ8nEe/azSrTtyrVKazKCsIpQhTKe55Xv5VPS8UZrJxlFazyL8WogLBsLHkbP3b8UndSRvDA
 qx5NXNahz12sV7yj7ENO7G3epoVGy1SNZ0irsT8jr7cMiO0rQ7/sNk1M6AobaqqIyOl1Jsji
 GvrGVdUsjNfZDLHVRaGNBn6n5+nk6to6pz6hIMVxLiLZsdEl3xZ22TO9SqAxk9ulQSMyaYsu
 wt7xwLkoPsiYk+kWyGWy3/I1lgX17lXLo9o3tF1NzDI1TNsxOb3jmMz5cEtu4T2hN/R9TPuN
 pJ+iPWf653qeBdsEe9XGzCPC9e23hK7MxSE/Srne0yV12hKedudVXeJmh2QwWsHIc4Udue0Z
 LsMs4VN7wcdG9ckJRkX+UPeSXHzl7DP78xUiQiUTz4/ElSrxH5nrAAZxAwAA
X-CMS-MailID: 20230329122332epcas5p18d8fb49860b4f620c83d864f983dc318
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230327084331epcas5p2510ed79d04fe3432c2ec84ce528745c6
References: <20230327084103.21601-1-anuj20.g@samsung.com>
 <CGME20230327084331epcas5p2510ed79d04fe3432c2ec84ce528745c6@epcas5p2.samsung.com>
 <20230327084103.21601-10-anuj20.g@samsung.com>
 <71d9f461-a708-341f-d012-d142086c026e@opensource.wdc.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mailman-Approved-At: Thu, 30 Mar 2023 06:32:57 +0000
Subject: Re: [dm-devel] [PATCH v8 9/9] null_blk: add support for copy offload
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: Vincent Fu <vincent.fu@samsung.com>, linux-nvme@lists.infradead.org,
 dm-devel@redhat.com, Christoph Hellwig <hch@lst.de>,
 Alasdair Kergon <agk@redhat.com>, Sagi Grimberg <sagi@grimberg.me>,
 gost.dev@samsung.com, nitheshshetty@gmail.com,
 James Smart <james.smart@broadcom.com>, Chaitanya Kulkarni <kch@nvidia.com>,
 Anuj Gupta <anuj20.g@samsung.com>, Mike Snitzer <snitzer@kernel.org>,
 ming.lei@redhat.com, linux-block@vger.kernel.org,
 Keith Busch <kbusch@kernel.org>, bvanassche@acm.org,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 joshi.k@samsung.com, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: samsung.com
Content-Type: multipart/mixed;
 boundary="----3NzO0p8.1sh3-RRiYuI9FQqPO8oRjrHoddadEkfGMyLJmz0h=_118cd0_"

------3NzO0p8.1sh3-RRiYuI9FQqPO8oRjrHoddadEkfGMyLJmz0h=_118cd0_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Mar 29, 2023 at 06:04:49PM +0900, Damien Le Moal wrote:
> On 3/27/23 17:40, Anuj Gupta wrote:
> > From: Nitesh Shetty <nj.shetty@samsung.com>
> > 
> > Implementaion is based on existing read and write infrastructure.
> > 
> > Suggested-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> > Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
> > Signed-off-by: Nitesh Shetty <nj.shetty@samsung.com>
> > Signed-off-by: Vincent Fu <vincent.fu@samsung.com>
> > ---
> >  drivers/block/null_blk/main.c     | 94 +++++++++++++++++++++++++++++++
> >  drivers/block/null_blk/null_blk.h |  7 +++
> >  2 files changed, 101 insertions(+)
> > 
> > diff --git a/drivers/block/null_blk/main.c b/drivers/block/null_blk/main.c
> > index 9e6b032c8ecc..84c5fbcd67a5 100644
> > --- a/drivers/block/null_blk/main.c
> > +++ b/drivers/block/null_blk/main.c
> > @@ -1257,6 +1257,81 @@ static int null_transfer(struct nullb *nullb, struct page *page,
> >  	return err;
> >  }
> >  
> > +static inline int nullb_setup_copy_read(struct nullb *nullb,
> > +		struct bio *bio)
> > +{
> > +	struct nullb_copy_token *token = bvec_kmap_local(&bio->bi_io_vec[0]);
> > +
> > +	memcpy(token->subsys, "nullb", 5);
> > +	token->sector_in = bio->bi_iter.bi_sector;
> > +	token->nullb = nullb;
> > +	token->sectors = bio->bi_iter.bi_size >> SECTOR_SHIFT;
> > +
> > +	return 0;
> > +}
> > +
> > +static inline int nullb_setup_copy_write(struct nullb *nullb,
> > +		struct bio *bio, bool is_fua)
> > +{
> > +	struct nullb_copy_token *token = bvec_kmap_local(&bio->bi_io_vec[0]);
> > +	sector_t sector_in, sector_out;
> > +	void *in, *out;
> > +	size_t rem, temp;
> > +	unsigned long offset_in, offset_out;
> > +	struct nullb_page *t_page_in, *t_page_out;
> > +	int ret = -EIO;
> > +
> > +	if (unlikely(memcmp(token->subsys, "nullb", 5)))
> > +		return -EOPNOTSUPP;
> > +	if (unlikely(token->nullb != nullb))
> > +		return -EOPNOTSUPP;
> > +	if (WARN_ON(token->sectors != bio->bi_iter.bi_size >> SECTOR_SHIFT))
> > +		return -EOPNOTSUPP;
> 
> EOPNOTSUPP is strange. These are EINVAL, no ?.
> 
acked, will update in next revision.

> > +
> > +	sector_in = token->sector_in;
> > +	sector_out = bio->bi_iter.bi_sector;
> > +	rem = token->sectors << SECTOR_SHIFT;
> > +
> > +	spin_lock_irq(&nullb->lock);
> > +	while (rem > 0) {
> > +		temp = min_t(size_t, nullb->dev->blocksize, rem);
> > +		offset_in = (sector_in & SECTOR_MASK) << SECTOR_SHIFT;
> > +		offset_out = (sector_out & SECTOR_MASK) << SECTOR_SHIFT;
> > +
> > +		if (null_cache_active(nullb) && !is_fua)
> > +			null_make_cache_space(nullb, PAGE_SIZE);
> > +
> > +		t_page_in = null_lookup_page(nullb, sector_in, false,
> > +			!null_cache_active(nullb));
> > +		if (!t_page_in)
> > +			goto err;
> > +		t_page_out = null_insert_page(nullb, sector_out,
> > +			!null_cache_active(nullb) || is_fua);
> > +		if (!t_page_out)
> > +			goto err;
> > +
> > +		in = kmap_local_page(t_page_in->page);
> > +		out = kmap_local_page(t_page_out->page);
> > +
> > +		memcpy(out + offset_out, in + offset_in, temp);
> > +		kunmap_local(out);
> > +		kunmap_local(in);
> > +		__set_bit(sector_out & SECTOR_MASK, t_page_out->bitmap);
> > +
> > +		if (is_fua)
> > +			null_free_sector(nullb, sector_out, true);
> > +
> > +		rem -= temp;
> > +		sector_in += temp >> SECTOR_SHIFT;
> > +		sector_out += temp >> SECTOR_SHIFT;
> > +	}
> > +
> > +	ret = 0;
> > +err:
> > +	spin_unlock_irq(&nullb->lock);
> > +	return ret;
> > +}
> > +
> >  static int null_handle_rq(struct nullb_cmd *cmd)
> >  {
> >  	struct request *rq = cmd->rq;
> > @@ -1267,6 +1342,14 @@ static int null_handle_rq(struct nullb_cmd *cmd)
> >  	struct req_iterator iter;
> >  	struct bio_vec bvec;
> >  
> > +	if (rq->cmd_flags & REQ_COPY) {
> > +		if (op_is_write(req_op(rq)))
> > +			return nullb_setup_copy_write(nullb, rq->bio,
> > +						rq->cmd_flags & REQ_FUA);
> > +		else
> 
> No need for this else.
> 

acked

> > +			return nullb_setup_copy_read(nullb, rq->bio);
> > +	}
> > +
> >  	spin_lock_irq(&nullb->lock);
> >  	rq_for_each_segment(bvec, rq, iter) {
> >  		len = bvec.bv_len;
> > @@ -1294,6 +1377,14 @@ static int null_handle_bio(struct nullb_cmd *cmd)
> >  	struct bio_vec bvec;
> >  	struct bvec_iter iter;
> >  
> > +	if (bio->bi_opf & REQ_COPY) {
> > +		if (op_is_write(bio_op(bio)))
> > +			return nullb_setup_copy_write(nullb, bio,
> > +							bio->bi_opf & REQ_FUA);
> > +		else
> 
> No need for this else.
> 

acked

> > +			return nullb_setup_copy_read(nullb, bio);
> > +	}
> > +
> >  	spin_lock_irq(&nullb->lock);
> >  	bio_for_each_segment(bvec, bio, iter) {
> >  		len = bvec.bv_len;
> > @@ -2146,6 +2237,9 @@ static int null_add_dev(struct nullb_device *dev)
> >  	list_add_tail(&nullb->list, &nullb_list);
> >  	mutex_unlock(&lock);
> >  
> > +	blk_queue_max_copy_sectors_hw(nullb->disk->queue, 1024);
> > +	blk_queue_flag_set(QUEUE_FLAG_COPY, nullb->disk->queue);
> 
> This should NOT be unconditionally enabled with a magic value of 1K sectors. The
> max copy sectors needs to be set with a configfs attribute so that we can
> enable/disable the copy offload support, to be able to exercise both block layer
> emulation and native device support.
> 

acked

> > +
> >  	pr_info("disk %s created\n", nullb->disk_name);
> >  
> >  	return 0;
> > diff --git a/drivers/block/null_blk/null_blk.h b/drivers/block/null_blk/null_blk.h
> > index eb5972c50be8..94e524e7306a 100644
> > --- a/drivers/block/null_blk/null_blk.h
> > +++ b/drivers/block/null_blk/null_blk.h
> > @@ -67,6 +67,13 @@ enum {
> >  	NULL_Q_MQ	= 2,
> >  };
> >  
> > +struct nullb_copy_token {
> > +	char subsys[5];
> > +	struct nullb *nullb;
> > +	u64 sector_in;
> > +	u64 sectors;
> > +};
> > +
> >  struct nullb_device {
> >  	struct nullb *nullb;
> >  	struct config_item item;
> 
> -- 
> Damien Le Moal
> Western Digital Research
> 
> 
Thank you,
Nitesh Shetty

------3NzO0p8.1sh3-RRiYuI9FQqPO8oRjrHoddadEkfGMyLJmz0h=_118cd0_
Content-Type: text/plain; charset="utf-8"


------3NzO0p8.1sh3-RRiYuI9FQqPO8oRjrHoddadEkfGMyLJmz0h=_118cd0_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

------3NzO0p8.1sh3-RRiYuI9FQqPO8oRjrHoddadEkfGMyLJmz0h=_118cd0_--

