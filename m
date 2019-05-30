Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA8E2FFFB
	for <lists+dm-devel@lfdr.de>; Thu, 30 May 2019 18:13:49 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BBA983179156;
	Thu, 30 May 2019 16:12:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F356E5C22E;
	Thu, 30 May 2019 16:12:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A90E2206D2;
	Thu, 30 May 2019 16:12:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4UGB9PR019892 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 30 May 2019 12:11:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 211EF1001DFA; Thu, 30 May 2019 16:11:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C18591001E93;
	Thu, 30 May 2019 16:11:04 +0000 (UTC)
Date: Thu, 30 May 2019 12:11:03 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Gen Zhang <blackgod016574@gmail.com>
Message-ID: <20190530161103.GA30026@redhat.com>
References: <20190529013320.GA3307@zhanggen-UX430UQ>
	<fcf2c3c0-e479-9e74-59d5-79cd2a0bade6@acm.org>
	<20190529152443.GA4076@zhanggen-UX430UQ>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190529152443.GA4076@zhanggen-UX430UQ>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Bart Van Assche <bvanassche@acm.org>, agk@redhat.com,
	linux-kernel@vger.kernel.org
Subject: Re: [dm-devel] dm-init: fix 2 incorrect use of kstrndup()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Thu, 30 May 2019 16:13:48 +0000 (UTC)

On Wed, May 29 2019 at 11:24am -0400,
Gen Zhang <blackgod016574@gmail.com> wrote:

> On Wed, May 29, 2019 at 05:23:53AM -0700, Bart Van Assche wrote:
> > On 5/28/19 6:33 PM, Gen Zhang wrote:
> > > In drivers/md/dm-init.c, kstrndup() is incorrectly used twice.
> > > 
> > > It should be: char *kstrndup(const char *s, size_t max, gfp_t gfp);
> > 
> > Should the following be added to this patch?
> > 
> > Fixes: 6bbc923dfcf5 ("dm: add support to directly boot to a mapped
> > device") # v5.1.
> > Cc: stable
> > 
> > Thanks,
> > 
> > Bart.
> Personally, I am not quite sure about this question, because I am not 
> the maintainer of this part.

Yes, it should have the tags Bart suggested.

I'll take care it.

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
