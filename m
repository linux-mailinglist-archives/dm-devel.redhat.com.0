Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id E1F53203258
	for <lists+dm-devel@lfdr.de>; Mon, 22 Jun 2020 10:47:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592815658;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2NoSB7xUyk2jgMwMYvAqy8fLGfjJn5BJXTeY5ks/0Ms=;
	b=HR2D261PhAYP6tYeB6RHFdwxV4FJfebnrkkpQX86XaWWEexwGZTt3w86TfqYZzvBU400MA
	cIRBA7w+TGw0U3P/WOZt6eK/+wadpusm2wvDpstiu7SvRwkv/BShSkelMGhOeEuQC6MvAq
	sKlotAXKm+4yRJ1ludbev6ffdz5xXJQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-sm9rOrXqMKe1D-LMEb8wUA-1; Mon, 22 Jun 2020 04:47:34 -0400
X-MC-Unique: sm9rOrXqMKe1D-LMEb8wUA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ECD7E107ACF3;
	Mon, 22 Jun 2020 08:47:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6ED90100238D;
	Mon, 22 Jun 2020 08:47:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 454E2833CD;
	Mon, 22 Jun 2020 08:47:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05JJjEXC023803 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Jun 2020 15:45:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 81FA310B7CAB; Fri, 19 Jun 2020 19:45:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D4C110B7C90
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 19:45:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 79D0B8007A4
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 19:45:12 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-221-IMZVvh6LNFCamdFtoy_Czg-1; Fri, 19 Jun 2020 15:45:10 -0400
X-MC-Unique: IMZVvh6LNFCamdFtoy_Czg-1
Received: by mail-wr1-f65.google.com with SMTP id e1so10815033wrt.5
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 12:45:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Qa/SGQ5p7b66E33hW6+x88Sl1GCC1UqRDbxtplLHMyo=;
	b=oQdmmXZLAwMxsAgRkhdDKRVCyfFdXOb7yp85fx5M7qmD4rcpJyI9aWleQaWqljJCxD
	pd93vUJIOGqLS591iELnMODMZLLdIH9JLhfNctrfN/0+etgNzZTWL7aJLm/QBY2Kxqe2
	T9nFsxsrHRysxCQVfJrHKPm2o9kUuL0/piuiIylrRxpev1BaUTCoGVOHXSM4MH2wEZvN
	Oru7RYQsrEbh0BZFerCDNnCObvD9gtgVXjaAw/sIdW3UNj5Dl/yNSNx5L6qPb+pmcpgY
	ruseh9it2cXC0wrvilPFMNcB9CQEI6C8Zr45jdIMcBJBbOCxlR6TYr6smFIub672XEIS
	QRpA==
X-Gm-Message-State: AOAM533BU+NYgpvrGHTozJfxxEhkSXaZejIA+2F+cPZbghusLWyR8C7N
	3IIc0grf9DhwMMWkMKsLzhwyzbd/B+j6d33xqQrE1w==
X-Google-Smtp-Source: ABdhPJxbC6lp4MxQf0dfsCqDKCB2VGeC8/eWBp3p6IZm0evbtMuNDv3X63KOzuz2U5svP/1Vk0NdYx1m+kIGwkUHFrc=
X-Received: by 2002:adf:958a:: with SMTP id p10mr5367723wrp.323.1592595908766; 
	Fri, 19 Jun 2020 12:45:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200619164132.1648-1-ignat@cloudflare.com>
	<20200619165548.GA24779@redhat.com>
	<alpine.LRH.2.02.2006191429060.23991@file01.intranet.prod.int.rdu2.redhat.com>
In-Reply-To: <alpine.LRH.2.02.2006191429060.23991@file01.intranet.prod.int.rdu2.redhat.com>
From: Ignat Korchagin <ignat@cloudflare.com>
Date: Fri, 19 Jun 2020 20:44:58 +0100
Message-ID: <CALrw=nEBjfV5e35z89Nxy0Gix1SeLyGOP5pvxF8xS0Wy7XfDYw@mail.gmail.com>
To: Mikulas Patocka <mpatocka@redhat.com>
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 22 Jun 2020 04:47:18 -0400
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Mike Snitzer <snitzer@redhat.com>,
	kernel-team <kernel-team@cloudflare.com>, dm-crypt@saout.de,
	linux-kernel <linux-kernel@vger.kernel.org>, dm-devel@redhat.com,
	"David S. Miller" <davem@davemloft.net>, agk@redhat.com
Subject: Re: [dm-devel] [RFC PATCH 0/1] dm-crypt excessive overhead
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jun 19, 2020 at 7:39 PM Mikulas Patocka <mpatocka@redhat.com> wrote:
>
>
>
> On Fri, 19 Jun 2020, Mike Snitzer wrote:
>
> > On Fri, Jun 19 2020 at 12:41pm -0400,
> > Ignat Korchagin <ignat@cloudflare.com> wrote:
> >
> > > This is a follow up from the long-forgotten [1], but with some more convincing
> > > evidence. Consider the following script:
> > >
> > > [1]: https://www.spinics.net/lists/dm-crypt/msg07516.html
> > > [2]: https://blog.cloudflare.com/speeding-up-linux-disk-encryption/
> > >
> > > Ignat Korchagin (1):
> > >   Add DM_CRYPT_FORCE_INLINE flag to dm-crypt target
> > >
> > >  drivers/md/dm-crypt.c | 55 +++++++++++++++++++++++++++++++++----------
> > >  1 file changed, 43 insertions(+), 12 deletions(-)
> > >
> > > --
> > > 2.20.1
> > >
> >
> > Hi,
> >
> > I saw [2] and have been expecting something from cloudflare ever since.
> > Nice to see this submission.
> >
> > There is useful context in your 0th patch header.  I'll likely merge
> > parts of this patch header with the more terse 1/1 header (reality is
> > there only needed to be a single patch submission).
> >
> > Will review and stage accordingly if all looks fine to me.  Mikulas,
> > please have a look too.
> >
> > Thanks,
> > Mike
>
> +       if (test_bit(DM_CRYPT_FORCE_INLINE, &cc->flags)) {
> +               if (in_irq()) {
> +                       /* Crypto API will fail hard in hard IRQ context */
> +                       tasklet_init(&io->tasklet, kcryptd_crypt_tasklet, (unsigned long)&io->work);
> +                       tasklet_schedule(&io->tasklet);
> +               } else
> +                       kcryptd_crypt(&io->work);
> +       } else {
> +               INIT_WORK(&io->work, kcryptd_crypt);
> +               queue_work(cc->crypt_queue, &io->work);
> +       }
>
> I'm looking at this and I'd like to know why does the crypto API fail in
> hard-irq context and why does it work in tasklet context. What's the exact
> reason behind this?

This comes from
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/crypto/skcipher.c?id=5e857ce6eae7ca21b2055cca4885545e29228fe2#n433
And, I believe, it is there for the same reason kcryptd was introduced
in 2005 in dm-crypt:
"...because it would be very unwise to do decryption in an interrupt
context..." (that is, when other interrupts are disabled). In tasklet
however we can still service other interrupts even if we process a
large block.

>
>
> Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

