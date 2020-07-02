Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 4DC712134EB
	for <lists+dm-devel@lfdr.de>; Fri,  3 Jul 2020 09:27:03 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-9eX8j8X4OU26V-fd3q5xZw-1; Fri, 03 Jul 2020 03:26:45 -0400
X-MC-Unique: 9eX8j8X4OU26V-fd3q5xZw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E63868015F6;
	Fri,  3 Jul 2020 07:26:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C67645FC2D;
	Fri,  3 Jul 2020 07:26:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 55228180954D;
	Fri,  3 Jul 2020 07:26:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 062Fr6Wa022069 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 2 Jul 2020 11:53:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 90639114F373; Thu,  2 Jul 2020 15:53:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 24DFC114F36E
	for <dm-devel@redhat.com>; Thu,  2 Jul 2020 15:53:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 28E058007B3
	for <dm-devel@redhat.com>; Thu,  2 Jul 2020 15:53:02 +0000 (UTC)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-245-bSiLg-XuOz6gbKPgP_k3-g-1; Thu, 02 Jul 2020 11:53:00 -0400
X-MC-Unique: bSiLg-XuOz6gbKPgP_k3-g-1
Received: by mail-lj1-f196.google.com with SMTP id s1so32877595ljo.0
	for <dm-devel@redhat.com>; Thu, 02 Jul 2020 08:52:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=X1hZZYHT2jx0soQwDY2Nw4ZNux9TK2TS4ou5sFWlySY=;
	b=a5HYLJVWZGYV2Cky+Gqe3z8Si5SPlJUMPiZyVV/N7sp37gthdjGoOIV2lzD0WY8YDV
	xmgZ4Pa1gOrczq+e2mPyoatK5i8MaXwA8lGHUZZB497vOSeocqgvgH9VBgqkvtq/7rdO
	qUL9QuYDkmxPAuK2ISGp5rcBeD8+7Qk/8qla9LS/k7XtEOvJSOSO+04iQvmjQXYewysR
	lmMNtoyAWmxssPAHXmYyS+kEMhu2ULPprkZhi+wAE3ZbNYx1TOJpoHNaEWKL9XqTAlSO
	ou9h1ZrYQsKv4Jz+ddKkpM7ZC+LH3eapExynpCbJCqloRtiHXsfJidwic1nPcozEaMHB
	/Lhw==
X-Gm-Message-State: AOAM532JjdjyZsEtpOvIbQI55gC4tYAA5LlNOkIIcNXhJZvfBjd5neYE
	u/Oa46m9mEK5LeChnJvguMCywb/hAzFV/eG59xj4bg==
X-Google-Smtp-Source: ABdhPJz3ABkPWjkv8L0FIiK+Kjjg6BO4eaaimJnKQo1xzAYZPxzmmzDpXVUF4bLDPypwEcFJ8kmLmaUrHoL1B8Z52PM=
X-Received: by 2002:a2e:b88c:: with SMTP id r12mr16463205ljp.266.1593705177353;
	Thu, 02 Jul 2020 08:52:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200629193947.2705954-1-hch@lst.de>
	<20200629193947.2705954-19-hch@lst.de>
	<20200702141001.GA3834@lca.pw> <20200702151453.GA1799@lst.de>
In-Reply-To: <20200702151453.GA1799@lst.de>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 2 Jul 2020 21:22:46 +0530
Message-ID: <CA+G9fYv6DfJB=DeQFVptAuaVv1Ng-BK0fRHgFZ=DNzymu8LVvw@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 03 Jul 2020 03:26:16 -0400
Cc: Jens Axboe <axboe@kernel.dk>, linux-xtensa@linux-xtensa.org,
	linux-m68k@vger.kernel.org, linux-nvdimm@lists.01.org,
	linux-s390@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
	linux-nvme@lists.infradead.org, Alexander Potapenko <glider@google.com>,
	linux-raid@vger.kernel.org, dm-devel@redhat.com,
	Qian Cai <cai@lca.pw>, kasan-dev@googlegroups.com,
	drbd-dev@tron.linbit.com, Andrey Ryabinin <aryabinin@virtuozzo.com>,
	linux-bcache@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	Dmitry Vyukov <dvyukov@google.com>
Subject: Re: [dm-devel] [PATCH 18/20] block: refator submit_bio_noacct
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2 Jul 2020 at 20:45, Christoph Hellwig <hch@lst.de> wrote:
>
> On Thu, Jul 02, 2020 at 10:10:10AM -0400, Qian Cai wrote:
> > On Mon, Jun 29, 2020 at 09:39:45PM +0200, Christoph Hellwig wrote:
> > > Split out a __submit_bio_noacct helper for the actual de-recursion
> > > algorithm, and simplify the loop by using a continue when we can't
> > > enter the queue for a bio.
> > >
> > > Signed-off-by: Christoph Hellwig <hch@lst.de>
> >
> > Reverting this commit and its dependencies,
> >
> > 5a6c35f9af41 block: remove direct_make_request
> > ff93ea0ce763 block: shortcut __submit_bio_noacct for blk-mq drivers
> >
> > fixed the stack-out-of-bounds during boot,
> >
> > https://lore.kernel.org/linux-block/000000000000bcdeaa05a97280e4@google.com/
>
> Yikes.  bio_alloc_bioset pokes into bio_list[1] in a totally
> undocumented way.  But even with that the problem should only show
> up with "block: shortcut __submit_bio_noacct for blk-mq drivers".
>
> Can you try this patch?

Applied your patch on top of linux-next 20200702 and tested on
arm64 and x86_64 devices and the reported BUG fixed.

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>

>
> diff --git a/block/blk-core.c b/block/blk-core.c
> index bf882b8d84450c..9f1bf8658b611a 100644
> --- a/block/blk-core.c
> +++ b/block/blk-core.c
> @@ -1155,11 +1155,10 @@ static blk_qc_t __submit_bio_noacct(struct bio *bio)
>  static blk_qc_t __submit_bio_noacct_mq(struct bio *bio)
>  {
>         struct gendisk *disk = bio->bi_disk;
> -       struct bio_list bio_list;
> +       struct bio_list bio_list[2] = { };
>         blk_qc_t ret = BLK_QC_T_NONE;
>
> -       bio_list_init(&bio_list);
> -       current->bio_list = &bio_list;
> +       current->bio_list = bio_list;
>
>         do {
>                 WARN_ON_ONCE(bio->bi_disk != disk);
> @@ -1174,7 +1173,7 @@ static blk_qc_t __submit_bio_noacct_mq(struct bio *bio)
>                 }
>
>                 ret = blk_mq_submit_bio(bio);
> -       } while ((bio = bio_list_pop(&bio_list)));
> +       } while ((bio = bio_list_pop(&bio_list[0])));
>
>         current->bio_list = NULL;
>         return ret;

ref:
https://lkft.validation.linaro.org/scheduler/job/1538359#L288
https://lkft.validation.linaro.org/scheduler/job/1538360#L572


- Naresh

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

