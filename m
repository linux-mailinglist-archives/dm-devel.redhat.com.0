Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5F936DF3
	for <lists+dm-devel@lfdr.de>; Thu,  6 Jun 2019 09:58:23 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 103463082B69;
	Thu,  6 Jun 2019 07:58:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D226610841F0;
	Thu,  6 Jun 2019 07:58:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 885EB206D2;
	Thu,  6 Jun 2019 07:57:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x55EwrI1006732 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 5 Jun 2019 10:58:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1F4195F7C1; Wed,  5 Jun 2019 14:58:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3028A648B0;
	Wed,  5 Jun 2019 14:58:46 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 88DA630C1B9F;
	Wed,  5 Jun 2019 14:58:31 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id d17so2592202wmb.3;
	Wed, 05 Jun 2019 07:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=JMXXe6AqnjayglXVoDkqd6XGPAOEachog6ijJh1WH/M=;
	b=c69GUb5e0zImhjjK5JB+615hWzoFJvTWr+iOyLMJviK5KxLRr6jgx4UWBf5OZDtr5O
	ULDsZSGivOv11ZfUEV2OsGG9u3/8QETHCb2Ot9NobhSlJtJFqaIUbZhvKqerxqPsf4dv
	AFV1ijerqAf4dvnIKNg1r/kW2g1/JmNJbdH7hZRndW1J1WB89VlxAIKj+iVTUBOpyvli
	ZZjKkqgU9LLz8VDcrqr+w10FnSDY4Y0NnQJ/1YUArGkPzxKo8Sc2ToqtEHlHdzCwTBYI
	eM6KcvHjoI7SK/jyBVSUyHIPMHcjBLp3SOUa2uFBvk1AI4tYhw+gM1c8UL665/Brj68w
	gRXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=JMXXe6AqnjayglXVoDkqd6XGPAOEachog6ijJh1WH/M=;
	b=DnUnEt+w5FVrt8Gml/Nb7j8rEO6FOZyVdalm3B66+TvJeuBw3uwEp6/62lFGiDvB87
	fO87utLpED70zCtDcr0kYJdCb1qtp4Mjt5Lujw+XWSrwGd8OPu6yluRelpOjjopampKw
	myLWIKGQk8J6P8/13a25WxJ2FdisDJlM0mM6TtFiCUEHXOB+8bu4nGZSfzJFABpPovLj
	STApqxlfbEFbkOcwFkUIBdBIKL32eIPsRkMs/Xh6ue2hFOU41Ts6577bZuGo5MozU0X9
	jyY0V5o76wS54yMjv5s4rhuon4SAPf2oTBb7RTJpcpbiOgzbS1bnErELIQYKF7LEfgFS
	pTvA==
X-Gm-Message-State: APjAAAXykOFz9PcdcL4X9ZDKG3uzwTA7RpLJ265+JhZT051xWIOqjN6v
	aPWBp2s4H+6SBAL2ai7PQEQMPjiS
X-Google-Smtp-Source: APXvYqwvCGkjtCVV5oWpvvNG4YlrNQl+LPIGfnSh7pJDigKXy16bUNNk4KEQt0blqoM551eQkLxq6w==
X-Received: by 2002:a1c:6154:: with SMTP id v81mr22169029wmb.92.1559746710125; 
	Wed, 05 Jun 2019 07:58:30 -0700 (PDT)
Received: from zhanggen-UX430UQ ([108.61.173.19])
	by smtp.gmail.com with ESMTPSA id
	34sm28309312wre.32.2019.06.05.07.58.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Jun 2019 07:58:29 -0700 (PDT)
Date: Wed, 5 Jun 2019 22:58:20 +0800
From: Gen Zhang <blackgod016574@gmail.com>
To: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20190605145820.GA3465@zhanggen-UX430UQ>
References: <20190524031248.GA6295@zhanggen-UX430UQ>
	<79ec221d-6970-3b30-0660-4a288a4c465e@suse.cz>
	<20190605122159.GA32538@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190605122159.GA32538@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Wed, 05 Jun 2019 14:58:31 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Wed, 05 Jun 2019 14:58:31 +0000 (UTC) for IP:'209.85.128.65'
	DOMAIN:'mail-wm1-f65.google.com' HELO:'mail-wm1-f65.google.com'
	FROM:'blackgod016574@gmail.com' RCPT:''
X-RedHat-Spam-Score: 0.14  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	SPF_PASS) 209.85.128.65 mail-wm1-f65.google.com 209.85.128.65
	mail-wm1-f65.google.com <blackgod016574@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 06 Jun 2019 03:56:05 -0400
Cc: dm-devel@redhat.com, Jiri Slaby <jslaby@suse.cz>,
	linux-kernel@vger.kernel.org, agk@redhat.com
Subject: Re: [dm-devel] dm-region-hash: Fix a missing-check bug in
	__rh_alloc()
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Thu, 06 Jun 2019 07:58:20 +0000 (UTC)

On Wed, Jun 05, 2019 at 08:21:59AM -0400, Mike Snitzer wrote:
> On Wed, Jun 05 2019 at  2:05am -0400,
> Jiri Slaby <jslaby@suse.cz> wrote:
> 
> > On 24. 05. 19, 5:12, Gen Zhang wrote:
> > > In function __rh_alloc(), the pointer nreg is allocated a memory space
> > > via kmalloc(). And it is used in the following codes. However, when 
> > > there is a memory allocation error, kmalloc() fails. Thus null pointer
> > > dereference may happen. And it will cause the kernel to crash. Therefore,
> > > we should check the return value and handle the error.
> > > Further, in __rh_find(), we should also check the return value and
> > > handle the error.
> > > 
> > > Signed-off-by: Gen Zhang <blackgod016574@gmail.com>
> > > 
> > > ---
> > > diff --git a/drivers/md/dm-region-hash.c b/drivers/md/dm-region-hash.c
> > > index 1f76045..2fa1641 100644
> > > --- a/drivers/md/dm-region-hash.c
> > > +++ b/drivers/md/dm-region-hash.c
> > > @@ -290,8 +290,11 @@ static struct dm_region *__rh_alloc(struct dm_region_hash *rh, region_t region)
> > >  	struct dm_region *reg, *nreg;
> > >  
> > >  	nreg = mempool_alloc(&rh->region_pool, GFP_ATOMIC);
> > > -	if (unlikely(!nreg))
> > > +	if (unlikely(!nreg)) {
> > >  		nreg = kmalloc(sizeof(*nreg), GFP_NOIO | __GFP_NOFAIL);
> > > +		if (!nreg)
> > > +			return NULL;
> > 
> > What's the purpose of checking NO_FAIL allocations?
> 
> There isn't, that was already pointed out in a different thread for this
> same patch (think patch was posted twice):
> https://www.redhat.com/archives/dm-devel/2019-May/msg00124.html
> 
> Mike
Thanks for your reply. The first thread is not replied for a period, so
the second one is posted. But I don't know why Jiri replied to the first
thread.

Thanks
Gen

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
