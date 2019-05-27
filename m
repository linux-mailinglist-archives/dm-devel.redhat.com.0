Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 250F52B139
	for <lists+dm-devel@lfdr.de>; Mon, 27 May 2019 11:19:34 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C94D4308402F;
	Mon, 27 May 2019 09:19:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BE19619A6;
	Mon, 27 May 2019 09:19:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E7A5B1806B0F;
	Mon, 27 May 2019 09:19:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4R3DAO9029849 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 26 May 2019 23:13:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 688D76682A; Mon, 27 May 2019 03:13:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 849FC4DA4A;
	Mon, 27 May 2019 03:13:05 +0000 (UTC)
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D3F73308FC4B;
	Mon, 27 May 2019 03:13:04 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id y11so3858220pfm.13;
	Sun, 26 May 2019 20:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=NCsV2gW6t5UqNhN3D3I7oSjbY9N12iBiE5UdaIK+ekw=;
	b=udCNPVOsqpgvTYuvkglh33m6JGunj9X5HQc3NtWDtttnXH79jCATY2AJaMvg7+QmxD
	bPPq3+aR5Iz2aUdQvCjT7lH/B0eoczJ5jLjiZAFbm8FcDT8alTTuk67DW6s4+lZuy/4+
	Q+iBHczTW2sIX0lYYnAGxf749r5gr81pbv+TPHH4l1As3aE2PMs2yQJ690IR271g1Zte
	AQztp1Tk7FoBVFP8oiyZjLot1+qJ+MH+guyl8tXe9UgZy3QmVhNzaHatfdtpy8VFQQoK
	ezlSfl277NQZ02/DeRavC3I5LNq4ttK0xTto1ygGUg1JPRu6BuDxFLSSGxplcOZXPjnJ
	j2Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=NCsV2gW6t5UqNhN3D3I7oSjbY9N12iBiE5UdaIK+ekw=;
	b=Na7bNCCDHYPIKHlYtMkExq4K6QHtqwWDwLFymKEMNZAI8zRHYMfvV4O5EFJI+w4lvl
	2TBraA+0ViYtx0fkKSGRFJIqnv4Zy5bcB1wyQQd9PvoNOYArD5WtV0yBzRvHJs65E8BG
	jiQWn4mOgVSbPUXYozVdv96nik8nWnN5DqMN+qFkTE2wgaDUn1pnikwgE3N8hAF/y3sU
	3EAo2e7LSXKSKaNqQmNq+BvZkZZ3k+V/VV9WRqdw1nDRnKxb7+fqGIYs9m5RxCn0dhtH
	Pdfl8YVLVgZT6uZRnXmyG9yUi9QjnlCM1oQpQdq7c4kQSrcyKCierM3KS1+XPmMrtpIr
	jJIg==
X-Gm-Message-State: APjAAAWh8qOb0pZg1PDvbMl/QH/df9di2LQbsTQ3SAkEdGcgjk1c1rjY
	nVwNMzH9XV0ATMUcQlvgGD1qxpv0
X-Google-Smtp-Source: APXvYqxwYZFVlVs73XW/twQdc6Ve/zbUt354slZJ5kqHsRCMBtJ5rQNOLjRS33wXPrrDMLUrrR/iAQ==
X-Received: by 2002:a65:614d:: with SMTP id o13mr37543080pgv.309.1558926783964;
	Sun, 26 May 2019 20:13:03 -0700 (PDT)
Received: from zhanggen-UX430UQ ([66.42.35.75])
	by smtp.gmail.com with ESMTPSA id
	l13sm8495613pjq.20.2019.05.26.20.12.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 26 May 2019 20:13:03 -0700 (PDT)
Date: Mon, 27 May 2019 11:12:51 +0800
From: Gen Zhang <blackgod016574@gmail.com>
To: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20190527031251.GA18979@zhanggen-UX430UQ>
References: <20190527005034.GA16907@zhanggen-UX430UQ>
	<20190527014913.GA10098@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190527014913.GA10098@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Mon, 27 May 2019 03:13:04 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Mon, 27 May 2019 03:13:04 +0000 (UTC) for IP:'209.85.210.196'
	DOMAIN:'mail-pf1-f196.google.com'
	HELO:'mail-pf1-f196.google.com' FROM:'blackgod016574@gmail.com'
	RCPT:''
X-RedHat-Spam-Score: 0.143  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
	SPF_PASS) 209.85.210.196 mail-pf1-f196.google.com 209.85.210.196
	mail-pf1-f196.google.com <blackgod016574@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 27 May 2019 05:18:07 -0400
Cc: dm-devel@redhat.com, linux-kernel@vger.kernel.org, agk@redhat.com
Subject: Re: [dm-devel] dm-region-hash: fix a missing-check bug in
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Mon, 27 May 2019 09:19:32 +0000 (UTC)

On Sun, May 26, 2019 at 09:49:14PM -0400, Mike Snitzer wrote:
> On Sun, May 26 2019 at  8:50pm -0400,
> Gen Zhang <blackgod016574@gmail.com> wrote:
> 
> > In function __rh_alloc(), the pointer nreg is allocated a memory space
> > via kmalloc(). And it is used in the following codes. However, when 
> > there is a memory allocation error, kmalloc() fails. Thus null pointer
> > dereference may happen. And it will cause the kernel to crash. Therefore,
> > we should check the return value and handle the error.
> > Further, in __rh_find(), we should also check the return value and
> > handle the error.
> > 
> > Signed-off-by: Gen Zhang <blackgod016574@gmail.com>
> > ---
> > diff --git a/drivers/md/dm-region-hash.c b/drivers/md/dm-region-hash.c
> > index 1f76045..2fa1641 100644
> > --- a/drivers/md/dm-region-hash.c
> > +++ b/drivers/md/dm-region-hash.c
> > @@ -290,8 +290,11 @@ static struct dm_region *__rh_alloc(struct dm_region_hash *rh, region_t region)
> >  	struct dm_region *reg, *nreg;
> >  
> >  	nreg = mempool_alloc(&rh->region_pool, GFP_ATOMIC);
> > -	if (unlikely(!nreg))
> > +	if (unlikely(!nreg)) {
> >  		nreg = kmalloc(sizeof(*nreg), GFP_NOIO | __GFP_NOFAIL);
> > +		if (!nreg)
> > +			return NULL;
> > +	}
> >  
> >  	nreg->state = rh->log->type->in_sync(rh->log, region, 1) ?
> >  		      DM_RH_CLEAN : DM_RH_NOSYNC;
> 
> This patch isn't needed.  __GFP_NOFAIL means the allocation won't fail.
> 
> And there are many other users of __GFP_NOFAIL that don't check for
> failure.  
> 
> Mike
Appreciate your reply, Mike.

Thanks
Gen

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
