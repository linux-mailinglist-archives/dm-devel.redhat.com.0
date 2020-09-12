Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id AAB2F2685CA
	for <lists+dm-devel@lfdr.de>; Mon, 14 Sep 2020 09:26:03 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-YdNePSunPEO1RtwBaaxg0Q-1; Mon, 14 Sep 2020 03:25:41 -0400
X-MC-Unique: YdNePSunPEO1RtwBaaxg0Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2643425ED;
	Mon, 14 Sep 2020 07:25:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A4425DA6B;
	Mon, 14 Sep 2020 07:25:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5476B8C7C1;
	Mon, 14 Sep 2020 07:25:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08C6HlZb009947 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Sep 2020 02:17:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D8E4B10ABCB8; Sat, 12 Sep 2020 06:17:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D362810ABCB7
	for <dm-devel@redhat.com>; Sat, 12 Sep 2020 06:17:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B008101A53F
	for <dm-devel@redhat.com>; Sat, 12 Sep 2020 06:17:45 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-255-km-XYjkuPPGuREz64z8IwQ-1;
	Sat, 12 Sep 2020 02:17:42 -0400
X-MC-Unique: km-XYjkuPPGuREz64z8IwQ-1
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
	[209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 25F45214D8;
	Sat, 12 Sep 2020 06:17:41 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id y17so8017323lfa.8;
	Fri, 11 Sep 2020 23:17:41 -0700 (PDT)
X-Gm-Message-State: AOAM532bgFkqhIg/cpIOzTuc07G5SDn+CLfrVOqYHGz2Fo77TCWta3iJ
	x01+eI9aBQaAVhTDyI4UFTuhlVj8Oty1aNHMTHI=
X-Google-Smtp-Source: ABdhPJxOiiANvrJ6fr7d6kLKZBhdGAMugfK2BYTTNlwkd2Y5yYk1Y7sPwQKbOfKHnZSoz9jAWmxnXjr56qyYcRtmpeU=
X-Received: by 2002:a19:cc09:: with SMTP id c9mr1179259lfg.482.1599891459438; 
	Fri, 11 Sep 2020 23:17:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200910144833.742260-1-hch@lst.de>
	<20200910144833.742260-6-hch@lst.de>
In-Reply-To: <20200910144833.742260-6-hch@lst.de>
From: Song Liu <song@kernel.org>
Date: Fri, 11 Sep 2020 23:17:28 -0700
X-Gmail-Original-Message-ID: <CAPhsuW56nRgq_hAs4zdg+qabVsbyYkmZk2+4+4ykzbg0Aa=W2g@mail.gmail.com>
Message-ID: <CAPhsuW56nRgq_hAs4zdg+qabVsbyYkmZk2+4+4ykzbg0Aa=W2g@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 14 Sep 2020 03:23:33 -0400
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid <linux-raid@vger.kernel.org>,
	Minchan Kim <minchan@kernel.org>, Richard Weinberger <richard@nod.at>,
	open list <linux-kernel@vger.kernel.org>,
	linux-block@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
	dm-devel@redhat.com, linux-mtd@lists.infradead.org,
	cgroups@vger.kernel.org, drbd-dev@tron.linbit.com,
	Linux-Fsdevel <linux-fsdevel@vger.kernel.org>,
	Linux-MM <linux-mm@kvack.org>
Subject: Re: [dm-devel] [PATCH 05/12] md: update the optimal I/O size on
	reshape
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 10, 2020 at 7:48 AM Christoph Hellwig <hch@lst.de> wrote:
>
> The raid5 and raid10 drivers currently update the read-ahead size,
> but not the optimal I/O size on reshape.  To prepare for deriving the
> read-ahead size from the optimal I/O size make sure it is updated
> as well.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Song Liu <song@kernel.org>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

