Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E4A4B0804
	for <lists+dm-devel@lfdr.de>; Thu, 10 Feb 2022 09:19:08 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-YLyjKWeQO5Wk30yRdzlw1Q-1; Thu, 10 Feb 2022 03:18:47 -0500
X-MC-Unique: YLyjKWeQO5Wk30yRdzlw1Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5719610247AC;
	Thu, 10 Feb 2022 08:18:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CF771042A66;
	Thu, 10 Feb 2022 08:18:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D5AE3180B654;
	Thu, 10 Feb 2022 08:18:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 2199DP5w022973 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 9 Feb 2022 04:13:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id F28E42166B13; Wed,  9 Feb 2022 09:13:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE6F12166B14
	for <dm-devel@redhat.com>; Wed,  9 Feb 2022 09:13:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CEDB61C04B41
	for <dm-devel@redhat.com>; Wed,  9 Feb 2022 09:13:21 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
	[209.85.218.41]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-613-FGR72RXQOXWohpxLwTGAHQ-1; Wed, 09 Feb 2022 04:13:20 -0500
X-MC-Unique: FGR72RXQOXWohpxLwTGAHQ-1
Received: by mail-ej1-f41.google.com with SMTP id k25so5371127ejp.5
	for <dm-devel@redhat.com>; Wed, 09 Feb 2022 01:13:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=A0aS6PsHWqLfuEf0mpE1atYMX0+ueYp+jlUgmxEtLqY=;
	b=vTSfICa57n67YIKTFPAUeksu/SvnrTmkuW5KPYETxf5/a+woCdjF4eOFRXAvIuFObr
	oqMFFHyBrM1NLXOth9U80EbdBOhNprZqZlhEZ5UqGJImbTfFx4NNcvbN/3Jb+P2kdIKN
	r+glynGle8Lp51z7QFiLoEaiDlFtre8egk4Lh/JLo1dI9AbKP4VshlJpGnxigjdxEobI
	FoSpKgGZf7zCMbrvqvJJA/AsKnyTDSYIHb/o2d7KJgjrdn+poIAnJWbNLHq9yZo1C58X
	6WabJ9bh7CQcFzKkSFAupCtGM+qUXMOcYx4aJYtCIV3tID9EA1Ztb+HChl/T3XK9Q+zP
	WF7w==
X-Gm-Message-State: AOAM530LnqJFVaGRe6+8AU+vP90gJGoE5OFNH67kgnTNK/C67PYsrgoI
	2EXDtjaPf1CPwNq0nOHOiylKdwa9+7f+7C246tCHDQ==
X-Google-Smtp-Source: ABdhPJwXBtBmq59kwj593KMdIS7kgVxhoLsds+ZjZ43rf+IIYpSxMGmDPqwgtWYgnVZDMIdJ2pvE/ZGIfbLuC68TslE=
X-Received: by 2002:a17:906:2ed1:: with SMTP id
	s17mr1012913eji.441.1644397998273; 
	Wed, 09 Feb 2022 01:13:18 -0800 (PST)
MIME-Version: 1.0
References: <20220209082828.2629273-1-hch@lst.de>
	<20220209082828.2629273-4-hch@lst.de>
	<4f1565b2-0f83-0cfa-58bd-86d5dee48e51@linux.dev>
In-Reply-To: <4f1565b2-0f83-0cfa-58bd-86d5dee48e51@linux.dev>
From: Jinpu Wang <jinpu.wang@ionos.com>
Date: Wed, 9 Feb 2022 10:13:07 +0100
Message-ID: <CAMGffE=FmVj26PJtu5fwtr3rNbtE+-dcfxOrmT4hEt3sO7Kw2A@mail.gmail.com>
To: Guoqing Jiang <guoqing.jiang@linux.dev>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 2199DP5w022973
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 10 Feb 2022 03:18:24 -0500
Cc: axboe@kernel.dk, manoj@linux.ibm.com, linux-scsi@vger.kernel.org,
	martin.petersen@oracle.com, philipp.reisner@linbit.com,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	target-devel@vger.kernel.org, haris.iqbal@ionos.com,
	ukrishn@linux.ibm.com, lars.ellenberg@linbit.com,
	drbd-dev@lists.linbit.com, Christoph Hellwig <hch@lst.de>,
	mrochs@linux.ibm.com
Subject: Re: [dm-devel] [PATCH 3/7] rnbd: drop WRITE_SAME support
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Feb 9, 2022 at 10:05 AM Guoqing Jiang <guoqing.jiang@linux.dev> wrote:
>
>
>
> On 2/9/22 4:28 PM, Christoph Hellwig wrote:
> > REQ_OP_WRITE_SAME was only ever submitted by the legacy Linux zeroing
> > code, which has switched to use REQ_OP_WRITE_ZEROES long before rnbd was
> > even merged.
> >
> > Signed-off-by: Christoph Hellwig<hch@lst.de>
> > ---
> >   drivers/block/rnbd/rnbd-clt.c   | 7 ++-----
> >   drivers/block/rnbd/rnbd-clt.h   | 1 -
> >   drivers/block/rnbd/rnbd-proto.h | 6 ------
> >   drivers/block/rnbd/rnbd-srv.c   | 3 +--
> >   4 files changed, 3 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/block/rnbd/rnbd-clt.c b/drivers/block/rnbd/rnbd-clt.c
> > index c08971de369fc..dc192d2738854 100644
> > --- a/drivers/block/rnbd/rnbd-clt.c
> > +++ b/drivers/block/rnbd/rnbd-clt.c
> > @@ -82,7 +82,6 @@ static int rnbd_clt_set_dev_attr(struct rnbd_clt_dev *dev,
> >       dev->nsectors               = le64_to_cpu(rsp->nsectors);
> >       dev->logical_block_size     = le16_to_cpu(rsp->logical_block_size);
> >       dev->physical_block_size    = le16_to_cpu(rsp->physical_block_size);
> > -     dev->max_write_same_sectors = le32_to_cpu(rsp->max_write_same_sectors);
> >       dev->max_discard_sectors    = le32_to_cpu(rsp->max_discard_sectors);
> >       dev->discard_granularity    = le32_to_cpu(rsp->discard_granularity);
> >       dev->discard_alignment      = le32_to_cpu(rsp->discard_alignment);
> > @@ -1359,8 +1358,6 @@ static void setup_request_queue(struct rnbd_clt_dev *dev)
> >       blk_queue_logical_block_size(dev->queue, dev->logical_block_size);
> >       blk_queue_physical_block_size(dev->queue, dev->physical_block_size);
> >       blk_queue_max_hw_sectors(dev->queue, dev->max_hw_sectors);
> > -     blk_queue_max_write_same_sectors(dev->queue,
> > -                                      dev->max_write_same_sectors);
> >
> >       /*
> >        * we don't support discards to "discontiguous" segments
> > @@ -1610,10 +1607,10 @@ struct rnbd_clt_dev *rnbd_clt_map_device(const char *sessname,
> >       }
> >
> >       rnbd_clt_info(dev,
> > -                    "map_device: Device mapped as %s (nsectors: %zu, logical_block_size: %d, physical_block_size: %d, max_write_same_sectors: %d, max_discard_sectors: %d, discard_granularity: %d, discard_alignment: %d, secure_discard: %d, max_segments: %d, max_hw_sectors: %d, rotational: %d, wc: %d, fua: %d)\n",
> > +                    "map_device: Device mapped as %s (nsectors: %zu, logical_block_size: %d, physical_block_size: %d, max_discard_sectors: %d, discard_granularity: %d, discard_alignment: %d, secure_discard: %d, max_segments: %d, max_hw_sectors: %d, rotational: %d, wc: %d, fua: %d)\n",
> >                      dev->gd->disk_name, dev->nsectors,
> >                      dev->logical_block_size, dev->physical_block_size,
> > -                    dev->max_write_same_sectors, dev->max_discard_sectors,
> > +                    dev->max_discard_sectors,
> >                      dev->discard_granularity, dev->discard_alignment,
> >                      dev->secure_discard, dev->max_segments,
> >                      dev->max_hw_sectors, dev->rotational, dev->wc, dev->fua);
> > diff --git a/drivers/block/rnbd/rnbd-clt.h b/drivers/block/rnbd/rnbd-clt.h
> > index 0c2cae7f39b9f..6946ba23d62e5 100644
> > --- a/drivers/block/rnbd/rnbd-clt.h
> > +++ b/drivers/block/rnbd/rnbd-clt.h
> > @@ -122,7 +122,6 @@ struct rnbd_clt_dev {
> >       bool                    wc;
> >       bool                    fua;
> >       u32                     max_hw_sectors;
> > -     u32                     max_write_same_sectors;
> >       u32                     max_discard_sectors;
> >       u32                     discard_granularity;
> >       u32                     discard_alignment;
>
> I am planning to remove more members inside struct rnbd_clt_dev.
>
> > diff --git a/drivers/block/rnbd/rnbd-proto.h b/drivers/block/rnbd/rnbd-proto.h
> > index de5d5a8df81d7..3eb8b34bd1886 100644
> > --- a/drivers/block/rnbd/rnbd-proto.h
> > +++ b/drivers/block/rnbd/rnbd-proto.h
> > @@ -249,9 +249,6 @@ static inline u32 rnbd_to_bio_flags(u32 rnbd_opf)
> >       case RNBD_OP_SECURE_ERASE:
> >               bio_opf = REQ_OP_SECURE_ERASE;
> >               break;
> > -     case RNBD_OP_WRITE_SAME:
> > -             bio_opf = REQ_OP_WRITE_SAME;
> > -             break;
> >       default:
> >               WARN(1, "Unknown RNBD type: %d (flags %d)\n",
> >                    rnbd_op(rnbd_opf), rnbd_opf);
> > @@ -284,9 +281,6 @@ static inline u32 rq_to_rnbd_flags(struct request *rq)
> >       case REQ_OP_SECURE_ERASE:
> >               rnbd_opf = RNBD_OP_SECURE_ERASE;
> >               break;
> > -     case REQ_OP_WRITE_SAME:
> > -             rnbd_opf = RNBD_OP_WRITE_SAME;
> > -             break;
> >       case REQ_OP_FLUSH:
> >               rnbd_opf = RNBD_OP_FLUSH;
> >               break;
> > diff --git a/drivers/block/rnbd/rnbd-srv.c b/drivers/block/rnbd/rnbd-srv.c
> > index 132e950685d59..0e6b5687f8321 100644
> > --- a/drivers/block/rnbd/rnbd-srv.c
> > +++ b/drivers/block/rnbd/rnbd-srv.c
> > @@ -548,8 +548,7 @@ static void rnbd_srv_fill_msg_open_rsp(struct rnbd_msg_open_rsp *rsp,
> >               cpu_to_le16(rnbd_dev_get_max_segs(rnbd_dev));
> >       rsp->max_hw_sectors =
> >               cpu_to_le32(rnbd_dev_get_max_hw_sects(rnbd_dev));
> > -     rsp->max_write_same_sectors =
> > -             cpu_to_le32(bdev_write_same(rnbd_dev->bdev));
> > +     rsp->max_write_same_sectors = 0;
>
> IIUC, I think we can delete max_write_same_sectors from rsp as well given
> the earlier change in setup_request_queue and rnbd_clt_set_dev_attr.
No, I don't think it's a good idea, we need to keep the protocol
compatible, so client for old kernel version
won't be confused.

The patch looks good to me, but I want to run a regression test before
give an acked.

Thanks!
Jinpu
>
> Thanks,
> Guoqing


--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

