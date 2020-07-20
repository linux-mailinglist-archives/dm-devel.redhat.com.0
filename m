Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 7E9F4227C27
	for <lists+dm-devel@lfdr.de>; Tue, 21 Jul 2020 11:53:56 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-qMUEjZNXMYKrMVBKHhll0g-1; Tue, 21 Jul 2020 05:53:53 -0400
X-MC-Unique: qMUEjZNXMYKrMVBKHhll0g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2FBB81B2C984;
	Tue, 21 Jul 2020 09:53:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2093B75546;
	Tue, 21 Jul 2020 09:53:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3A7BE9A147;
	Tue, 21 Jul 2020 09:53:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06KLSFri018411 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 20 Jul 2020 17:28:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D8C84114B315; Mon, 20 Jul 2020 21:28:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D47BC114B307
	for <dm-devel@redhat.com>; Mon, 20 Jul 2020 21:28:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 07EA585A5B2
	for <dm-devel@redhat.com>; Mon, 20 Jul 2020 21:28:13 +0000 (UTC)
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-203-iry4cyG3MT-Oub9LALoPWg-1; Mon, 20 Jul 2020 17:28:10 -0400
X-MC-Unique: iry4cyG3MT-Oub9LALoPWg-1
Received: by mail-qk1-f196.google.com with SMTP id x69so4618580qkb.1;
	Mon, 20 Jul 2020 14:28:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Sh/KLSzQqnJr0/PMf2DmO5rUtVYfFwMH4ti+obo2a7s=;
	b=MPAAsyqcm/hlWle889G0QcinW0FXNzed1uArtqidZhmwzTmmm/6QQjWqEuY5o9OmlP
	obshMvw2lrmvc01qt9y+TgQmMPwQsCRAZGHqtxR1m7RhJyAGwtoNKl2aQiNgE2uUpq8B
	+yWCdoIvnbTa2Ct48SSKWZ/A1IwQQYeTO0AGLmHMgmnRBOJNa7Z/lm680vrRBU3IhVeQ
	AuA2j1gkoC99XBNhm6qzvWMrF/Yc4++WLGoFjPFMvRE6wFCf1ZVoSvJ74gyPjgymz3pI
	VcdmQu/6LDrZWEl2TcG4bQ4FO0rrxMoAMs+o/S3JFepG/JjkDPEAqPes2u01MExnargl
	twiA==
X-Gm-Message-State: AOAM5328Gq1/BXxRKQpzR0WpDAr1+sAS1dD8QOQ7C9GLkkSKOmAya/O7
	hFbRWcSXTfnoMxnxA7dq6TXZdsTKrR0qeS5V2YoSyfLdDlU=
X-Google-Smtp-Source: ABdhPJzsaontx5ozyXPRUXIspav4OYKL8Yae9yGB7WLujLekyBKPAJ+mXHiIErPXcPeOXd4tel2AAhIoC764A4fM5+Q=
X-Received: by 2002:a37:9147:: with SMTP id t68mr23191512qkd.34.1595280488864; 
	Mon, 20 Jul 2020 14:28:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200720075148.172156-1-hch@lst.de>
	<20200720075148.172156-5-hch@lst.de>
	<CAFLxGvxNHGEOrj6nKTtDeiU+Rx4xv_6asjSQYcFWXhk5m=1cBA@mail.gmail.com>
	<20200720120734.GA29061@lst.de>
	<2827a5dbd94bc5c2c1706a6074d9a9a32a590feb.camel@gmail.com>
In-Reply-To: <2827a5dbd94bc5c2c1706a6074d9a9a32a590feb.camel@gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 20 Jul 2020 23:27:57 +0200
Message-ID: <CAFLxGvyxtYnJ5UdD18uNA97zQaDB8-Wv8MHQn2g9GYD74v7cTg@mail.gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 21 Jul 2020 05:46:39 -0400
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	Song Liu <song@kernel.org>, Richard Weinberger <richard@nod.at>,
	drbd-dev@tron.linbit.com, LKML <linux-kernel@vger.kernel.org>,
	linux-raid@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
	device-mapper development <dm-devel@redhat.com>,
	linux-mtd@lists.infradead.org, linux-mm@kvack.org,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	cgroups mailinglist <cgroups@vger.kernel.org>,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] [PATCH 04/14] bdi: initialize ->ra_pages in bdi_init
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jul 20, 2020 at 2:37 PM Artem Bityutskiy <dedekind1@gmail.com> wrote:
>
> On Mon, 2020-07-20 at 14:07 +0200, Christoph Hellwig wrote:
> > What about jffs2 and blk2mtd raw block devices?

I don't worry much about blk2mtd.

> If my memory serves me correctly JFFS2 did not mind readahead.

This covers my knowledge too.
I fear enabling readahead on JFFS2 will cause performance issues, this
filesystem
is mostly used on small and slow NOR devices.

-- 
Thanks,
//richard

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

