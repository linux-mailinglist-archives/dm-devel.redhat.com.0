Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B8804988F1
	for <lists+dm-devel@lfdr.de>; Thu, 22 Aug 2019 03:26:57 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1F319308FB9A;
	Thu, 22 Aug 2019 01:26:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C5CCA166A2;
	Thu, 22 Aug 2019 01:26:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F395B2551C;
	Thu, 22 Aug 2019 01:26:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7M1PCjh032753 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 21 Aug 2019 21:25:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 05B465D772; Thu, 22 Aug 2019 01:25:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0040F5D6B7
	for <dm-devel@redhat.com>; Thu, 22 Aug 2019 01:25:09 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 90CA4C0546F2
	for <dm-devel@redhat.com>; Thu, 22 Aug 2019 01:25:08 +0000 (UTC)
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net
	[73.231.172.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id BAEF82070B;
	Thu, 22 Aug 2019 01:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1566437108;
	bh=fAmchYbKEVyEzsyvePBupZlerJN00M59W8q92U6VFWE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JLwdMo+hkWLZOEkgdKA7JoF8CUwv8bb3SEouBLk6DfZo3p8jwE/B/YUmbd73PqoP+
	pY043x+Frcc6EJOugkUGrR78tacGWuftGkakWA8i4+mYeMXkiiuW6eVbkNLH1We1iR
	zmiIgwJwszIRadhGE56IP6mnlCmzfKY7o3pfKh90=
Date: Wed, 21 Aug 2019 18:25:07 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Denis Efremov <efremov@ispras.ru>
Message-Id: <20190821182507.b0dea16f57360cf0ac40deb6@linux-foundation.org>
In-Reply-To: <20190821074200.2203-1-efremov@ispras.ru>
References: <20190821074200.2203-1-efremov@ispras.ru>
Mime-Version: 1.0
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 22 Aug 2019 01:25:08 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]);
	Thu, 22 Aug 2019 01:25:08 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'akpm@linux-foundation.org' RCPT:''
X-RedHat-Spam-Score: -5.001  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_PASS) 198.145.29.99 mail.kernel.org 198.145.29.99 mail.kernel.org
	<akpm@linux-foundation.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.32
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: Vladimir Shelekhov <vshel@iis.nsk.su>, Jan Kara <jack@suse.cz>,
	Wilcox <matthew@wil.cx>, Akinobu Mita <akinobu.mita@gmail.com>,
	linux-kernel@vger.kernel.org, Matthew, dm-devel@redhat.com,
	Erdem Tumurov <erdemus@gmail.com>, linux-fsdevel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [dm-devel] [PATCH] lib/memweight.c: optimize by inlining
	bitmap_weight()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Thu, 22 Aug 2019 01:26:55 +0000 (UTC)

On Wed, 21 Aug 2019 10:42:00 +0300 Denis Efremov <efremov@ispras.ru> wrote:

> This patch inlines bitmap_weight() call.

It is better to say the patch "open codes" the bitmap_weight() call.

> Thus, removing the BUG_ON,

Why is that OK to do?

I expect all the code size improvements are from doing this?

> and 'longs to bits -> bits to longs' conversion by directly calling
> hweight_long().
> 
> ./scripts/bloat-o-meter lib/memweight.o.old lib/memweight.o.new
> add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-10 (-10)
> Function                                     old     new   delta
> memweight                                    162     152     -10
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
