Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id A9E3E22AA17
	for <lists+dm-devel@lfdr.de>; Thu, 23 Jul 2020 09:54:13 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-JwsqbgtxPKCxLBC2Jb89Cw-1; Thu, 23 Jul 2020 03:54:09 -0400
X-MC-Unique: JwsqbgtxPKCxLBC2Jb89Cw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6784957;
	Thu, 23 Jul 2020 07:54:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4130419C4F;
	Thu, 23 Jul 2020 07:54:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EDD6E730C4;
	Thu, 23 Jul 2020 07:53:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06MGR3Nt022015 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 22 Jul 2020 12:27:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 538BB119D2C7; Wed, 22 Jul 2020 16:27:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E4FC119D2C6
	for <dm-devel@redhat.com>; Wed, 22 Jul 2020 16:27:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 64DA11832D21
	for <dm-devel@redhat.com>; Wed, 22 Jul 2020 16:27:00 +0000 (UTC)
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
	[209.85.166.194]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-289-avqvFBLXO5utG_e-wCiD6Q-1; Wed, 22 Jul 2020 12:26:57 -0400
X-MC-Unique: avqvFBLXO5utG_e-wCiD6Q-1
Received: by mail-il1-f194.google.com with SMTP id x9so1835508ila.3
	for <dm-devel@redhat.com>; Wed, 22 Jul 2020 09:26:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2kHXQvVGBuGkaVHirVH2ldXpqiigd2kMJlKCki7PqMg=;
	b=uVsxKm3sDxraAIHzdMyCKAeDWXe8fSL9vQrFxS56+rBjHK9h9ieXw9+NC8B8pXVCm4
	p4VDbHB9NAunSOoKsKDESBGayn5nMPyVB1QmbajEiJESKXm8rCqlffk50tZ//gYRT1Ie
	a0UOeSTQKL0cGLyaB/3MuZmgwYOmuQbvn1KsyqCbGDeuqJHwG/n8NOT89L+YJNbZg2q9
	GXM4Bf9IBv6FScTB/aVUxFPMGyqaYst7h2ZISe0a1QAugVBk9G09ShSUtlcVYekpGqoH
	A+TVxlapGPykHD3HnexyffjZeCm6wzRHobppGnotKtxba3bncKK75DHbxIYt7Qaiy8Cr
	HdCw==
X-Gm-Message-State: AOAM531NwTxginmIaCOuz8D+/11oaPi3NMSF15Emjm6PsldtkPUNISl2
	uBdUdMAjLwDbsv0TtCxm0JLXW1aeij9eaWRxadWNZQ==
X-Google-Smtp-Source: ABdhPJzNeJo6F0VTZ0S6U9fuGWdBKZjH6dGksbNLyWqgmXOtrkpA/UinCG7oju3HCUHK5DY6DzL72Fr4547fWGtbqgk=
X-Received: by 2002:a05:6e02:1253:: with SMTP id
	j19mr673988ilq.145.1595435216934; 
	Wed, 22 Jul 2020 09:26:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200722062552.212200-1-hch@lst.de>
	<20200722062552.212200-12-hch@lst.de>
In-Reply-To: <20200722062552.212200-12-hch@lst.de>
From: Shakeel Butt <shakeelb@google.com>
Date: Wed, 22 Jul 2020 09:26:45 -0700
Message-ID: <CALvZod6zF7Ak8KWf4dq0pEF2ty7JN_SyNE7PxLjrfF+EuDbZ2w@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 23 Jul 2020 03:53:01 -0400
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>, Minchan Kim <minchan@kernel.org>,
	Richard Weinberger <richard@nod.at>, LKML <linux-kernel@vger.kernel.org>,
	"open list:BLOCK LAYER" <linux-block@vger.kernel.org>,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org, Cgroups <cgroups@vger.kernel.org>,
	drbd-dev@tron.linbit.com, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Linux MM <linux-mm@kvack.org>
Subject: Re: [dm-devel] [PATCH 11/14] mm: use SWP_SYNCHRONOUS_IO more
	intelligently
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jul 21, 2020 at 11:27 PM Christoph Hellwig <hch@lst.de> wrote:
>
> There is no point in trying to call bdev_read_page if SWP_SYNCHRONOUS_IO
> is not set, as the device won't support it.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  mm/page_io.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
>
> diff --git a/mm/page_io.c b/mm/page_io.c
> index ccda7679008851..442061348dfb26 100644
> --- a/mm/page_io.c
> +++ b/mm/page_io.c
> @@ -403,15 +403,17 @@ int swap_readpage(struct page *page, bool synchronous)
>                 goto out;
>         }
>
> -       ret = bdev_read_page(sis->bdev, swap_page_sector(page), page);
> -       if (!ret) {
> -               if (trylock_page(page)) {
> -                       swap_slot_free_notify(page);
> -                       unlock_page(page);
> -               }
> +       if (sis->flags & SWP_SYNCHRONOUS_IO) {
> +               ret = bdev_read_page(sis->bdev, swap_page_sector(page), page);
> +               if (ret) {

!ret

> +                       if (trylock_page(page)) {
> +                               swap_slot_free_notify(page);
> +                               unlock_page(page);
> +                       }
>
> -               count_vm_event(PSWPIN);
> -               goto out;
> +                       count_vm_event(PSWPIN);
> +                       goto out;
> +               }
>         }
>
>         ret = 0;
> --
> 2.27.0
>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

