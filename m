Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 4CF791FD234
	for <lists+dm-devel@lfdr.de>; Wed, 17 Jun 2020 18:31:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592411459;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=HITQ4UBMx8uWCuNZdgHVBWvL7Kxg54vO1AZ9uFu9nSs=;
	b=G3yZTGmGzAKVYwoIg0RR6UDI6GjmJ/rGxLfp49pk7n9mDtLQ6tG+maXs7s48T8gYfhFlfu
	sLzoNDuj4ebQP9iczL3f9JtQUYOWfQ/Hpv0yM0gJ/JG1NkWdEVJPbC7dr0r/LwKOfdi5KY
	E1aRagN50M/L90s+Gv9QAw+KRW6UL/Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-xrjesDUhMLKmxJdl8C5PdQ-1; Wed, 17 Jun 2020 12:30:55 -0400
X-MC-Unique: xrjesDUhMLKmxJdl8C5PdQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF56DECB61;
	Wed, 17 Jun 2020 16:30:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 52EE2707C6;
	Wed, 17 Jun 2020 16:30:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E397D180954D;
	Wed, 17 Jun 2020 16:30:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05HGU93i024635 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 17 Jun 2020 12:30:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 456BC5C296; Wed, 17 Jun 2020 16:30:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C7985C1D4;
	Wed, 17 Jun 2020 16:30:09 +0000 (UTC)
Date: Wed, 17 Jun 2020 12:30:08 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Message-ID: <20200617163008.GA12083@redhat.com>
References: <20190828183825.GA4216@embeddedor>
	<885e7ea3-b29a-eba0-569e-64760102016e@embeddedor.com>
MIME-Version: 1.0
In-Reply-To: <885e7ea3-b29a-eba0-569e-64760102016e@embeddedor.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, linux-kernel@vger.kernel.org,
	Alasdair Kergon <agk@redhat.com>, Kees Cook <keescook@chromium.org>
Subject: Re: [dm-devel] dm ioctl: Use struct_size() helper
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Jun 16 2020 at  6:06pm -0400,
Gustavo A. R. Silva <gustavo@embeddedor.com> wrote:

> Hi all,
> 
> Friendly ping: who can take this?
> 
> It's been almost a year... and I just noticed there was a problem
> with the email addresses back then...
> 
> I just fixed the issue and this patch should now appear on
> dm-devel@redhat.com and LKML.

I don't see any resubmit from you on either list.  But I've applied the
fix by hand and attributed it to you.

Thanks,
Mike


> On 8/28/19 13:38, Gustavo A. R. Silva wrote:
> > One of the more common cases of allocation size calculations is finding
> > the size of a structure that has a zero-sized array at the end, along
> > with memory for some number of elements for that array. For example:
> > 
> > struct dm_target_deps {
> > 	...
> >         __u64 dev[0];   /* out */
> > };
> > 
> > Make use of the struct_size() helper instead of an open-coded version
> > in order to avoid any potential type mistakes.
> > 
> > So, replace the following form:
> > 
> > sizeof(*deps) + (sizeof(*deps->dev) * count)
> > 
> > with:
> > 
> > struct_size(deps, dev, count)
> > 
> > This code was detected with the help of Coccinelle.
> > 
> > Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> > ---
> >  drivers/md/dm-ioctl.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/md/dm-ioctl.c b/drivers/md/dm-ioctl.c
> > index fb6f8fb1f13d..b2d52cec70d4 100644
> > --- a/drivers/md/dm-ioctl.c
> > +++ b/drivers/md/dm-ioctl.c
> > @@ -1446,7 +1446,7 @@ static void retrieve_deps(struct dm_table *table,
> >  	/*
> >  	 * Check we have enough space.
> >  	 */
> > -	needed = sizeof(*deps) + (sizeof(*deps->dev) * count);
> > +	needed = struct_size(deps, dev, count);
> >  	if (len < needed) {
> >  		param->flags |= DM_BUFFER_FULL_FLAG;
> >  		return;
> > 
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

