Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B9E32321BFA
	for <lists+dm-devel@lfdr.de>; Mon, 22 Feb 2021 16:58:53 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-fjFY9YJeNlm7_7GJc4tpGg-1; Mon, 22 Feb 2021 10:58:48 -0500
X-MC-Unique: fjFY9YJeNlm7_7GJc4tpGg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB64A195D562;
	Mon, 22 Feb 2021 15:58:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B7FE95D9D0;
	Mon, 22 Feb 2021 15:58:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 85A8658074;
	Mon, 22 Feb 2021 15:58:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11MFwDCO010864 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 22 Feb 2021 10:58:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E5DE76D9F1; Mon, 22 Feb 2021 15:58:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E063147CEA
	for <dm-devel@redhat.com>; Mon, 22 Feb 2021 15:58:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4A0AC85A59D
	for <dm-devel@redhat.com>; Mon, 22 Feb 2021 15:58:09 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
	[209.85.208.43]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-108-wNPDp8UfOvudDqnJR1uTJQ-1; Mon, 22 Feb 2021 10:58:04 -0500
X-MC-Unique: wNPDp8UfOvudDqnJR1uTJQ-1
Received: by mail-ed1-f43.google.com with SMTP id s11so22645078edd.5;
	Mon, 22 Feb 2021 07:58:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eqt4tyVUm6sFFSl2X77cgXFxmGm9zkPl59fYAb4UtLM=;
	b=ObgN+gUSaVVGBN8RrEdmoAcWyj1PHFztQEnRimXQ3WKGnhWMQHqnjR233A+eIEgQUF
	P/QfoP7EN9FSJSy/e9wDoc5u053oWUsXztGlC+yA8zuX+qMtWr3zFKw+g/sLhfFQA4/+
	Qmw97dbrMcwRb7cU7upuKbk9XBWVadvQ+Ci7a7sahyPRTM6tO64gJGRQez/flIBbO3mw
	yh3Lpzz1IMpYtfUUBSCFjStXhFN+ew7LirdhzYuk6BcUfHcmL0/1IKLzG5bBqTawJvrR
	KrzLxvJW54pF4DhfbXzmdhFKwDR/klidq2PZxX0DBTTAZ9+gg4RwTIix8LQ6lrgADCH6
	g8Uw==
X-Gm-Message-State: AOAM531lkgbNRQBGrOVpfmqsWpAgTRj89WTcwMZY3M3Sb1hqn9s5+Loi
	LCHCg8RT0oRRrSCQeLtR+UPjTviQfC6hUM4WkSo=
X-Google-Smtp-Source: ABdhPJwZCZVZf9WeJRPU+J8UGCkToLST5tkhlxw8G27fU8a5k7VbjCKgwE2fc0X960Ko9awC2JIhDm7WjyG+QPkPyN4=
X-Received: by 2002:a50:cf02:: with SMTP id c2mr23026578edk.333.1614009483256; 
	Mon, 22 Feb 2021 07:58:03 -0800 (PST)
MIME-Version: 1.0
References: <20210219124517.79359-1-selvakuma.s1@samsung.com>
	<CGME20210219124608epcas5p2a673f9e00c3e7b5352f115497b0e2d98@epcas5p2.samsung.com>
	<20210219124517.79359-4-selvakuma.s1@samsung.com>
	<20210220033637.GA2858050@casper.infradead.org>
In-Reply-To: <20210220033637.GA2858050@casper.infradead.org>
From: Selva Jove <selvajove@gmail.com>
Date: Mon, 22 Feb 2021 21:27:50 +0530
Message-ID: <CAHqX9vYdz-SRP2y6gzR1ei5WukNGzWhrHrvtXo4L8iFw4Lb9Hg@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
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
Cc: axboe@kernel.dk, Damien Le Moal <damien.lemoal@wdc.com>, kch@kernel.org,
	SelvaKumar S <selvakuma.s1@samsung.com>, sagi@grimberg.me,
	snitzer@redhat.com, linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org, nj.shetty@samsung.com,
	linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	dm-devel@redhat.com, joshi.k@samsung.com,
	javier.gonz@samsung.com, Keith Busch <kbusch@kernel.org>,
	joshiiitr@gmail.com, hch@lst.de
Subject: Re: [dm-devel] [RFC PATCH v5 3/4] nvme: add simple copy support
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Matthew,

Maximum Source Range Count (MSRC) is limited by u8. So the maximum
number of source ranges is 256 (0 base value). The number of pages
required to be sent to the device is at most 2. Since we are
allocating the memory using kmalloc_array(), we would get a continuous
physical segment. nvme_map_data() maps the physical segment either by
setting 2 PRP pointers or by SGL. So the copy command sends two pages
to the device for copying more than128 ranges.

On Sat, Feb 20, 2021 at 9:08 AM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Fri, Feb 19, 2021 at 06:15:16PM +0530, SelvaKumar S wrote:
> > +     struct nvme_copy_range *range = NULL;
> [...]
> > +     range = kmalloc_array(nr_range, sizeof(*range),
> > +                     GFP_ATOMIC | __GFP_NOWARN);
> [...]
> > +     req->special_vec.bv_page = virt_to_page(range);
> > +     req->special_vec.bv_offset = offset_in_page(range);
> > +     req->special_vec.bv_len = sizeof(*range) * nr_range;
> [...]
> > +struct nvme_copy_range {
> > +     __le64                  rsvd0;
> > +     __le64                  slba;
> > +     __le16                  nlb;
> > +     __le16                  rsvd18;
> > +     __le32                  rsvd20;
> > +     __le32                  eilbrt;
> > +     __le16                  elbat;
> > +     __le16                  elbatm;
> > +};
>
> so ... at 32 bytes, you can get 128 per 4kB page.  What happens if you
> try to send down a command that attempts to copy 129 ranges?

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

