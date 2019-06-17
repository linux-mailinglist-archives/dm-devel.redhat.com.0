Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E18F49A31
	for <lists+dm-devel@lfdr.de>; Tue, 18 Jun 2019 09:16:53 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9531F64DA8;
	Tue, 18 Jun 2019 07:16:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E0E015BBC8;
	Tue, 18 Jun 2019 07:16:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C77F11806B18;
	Tue, 18 Jun 2019 07:16:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5H9RMvt004300 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 17 Jun 2019 05:27:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DA71C10246F4; Mon, 17 Jun 2019 09:27:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 382B510246F6;
	Mon, 17 Jun 2019 09:27:18 +0000 (UTC)
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 992C9308A951;
	Mon, 17 Jun 2019 09:27:17 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id m30so5349006pff.8;
	Mon, 17 Jun 2019 02:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=dUidyHQAftHbjerQV/i5Ugw4tqRsaZ6rcF/lI+eVsNg=;
	b=IP7fYX1QtOaM1GZZaP19/gJzQ+WdGbPMHu7ox2R+UUAh9IKBL9iwbck7DLhXtK/Zg/
	PMVerRsS/SMMQsr370+l54t6eXYBkE0pZeQENazWFiAdZ/zoiGyZeJ3aPwsf2rqiWbnD
	D2E2qNkWcBN9dwZduvXxDJ7CJkVc9nFD2DMNqsVRG1LuIISUCEsSZLELmrv3S9EcnGCm
	4bJP9kZnz+ahwDb0ZaUXqfTdsHXMSS7Qr0eYP57kJSkIxPZ9VS9Pj4kZgVXzFlQoaj2x
	irWpfwlGLckkM5yegrpBmLVm84iay9dx6JHXxSZL6ofR3qkZjwiW14aAHI0LTna2z05B
	BOzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=dUidyHQAftHbjerQV/i5Ugw4tqRsaZ6rcF/lI+eVsNg=;
	b=jaxBGj1cOM89cpd/pvy8QFQk/Z70ubgFtuR49jKKhs85ZsrbwtnC2ajmnt8qcDIVtt
	5UCPkNAJVu2t4Zz3Ly6OB+8LTC0c3+NeTy7CnD28+S2hmgRKLR1aop+MP9HHyeA2DZ2n
	m+RATGO1CozXhFw71HenI0Yl/tOygZSjSSMAeQCJlNFaXAKOMQiGZ8JMlS7wkJuMClw4
	U15XsSnxCozkEOhsESG8Xzt58lRUi4qdxhDTopTrIcwgpq+DfVK7XfvUIEddeJoNpTfs
	V3kamqrOGVk5Vj/pNROaekU30+Dca8RW9rZXyIJoj4QG6bc6bwKStUIjrK5bKf0NN53I
	JPLg==
X-Gm-Message-State: APjAAAX9wtikCQ3aaSrGNy9M3GixootFw4Nngv8NZn0wRUxs28++2wtz
	u0rHXK1p58M4KgYA1KgT00a/LVnO0SOatA==
X-Google-Smtp-Source: APXvYqz53GKM2zDcID98ilbdDtCAXVgPYIJEdqCrBU+h411vYFaSdMeVFTOnnUzXyq5MPCjyQN7tsA==
X-Received: by 2002:a65:510c:: with SMTP id f12mr46645590pgq.92.1560763636871; 
	Mon, 17 Jun 2019 02:27:16 -0700 (PDT)
Received: from ubuntu ([104.192.108.10]) by smtp.gmail.com with ESMTPSA id
	m20sm10282703pjn.16.2019.06.17.02.27.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Jun 2019 02:27:16 -0700 (PDT)
Date: Mon, 17 Jun 2019 02:27:10 -0700
From: Gen Zhang <blackgod016574@gmail.com>
To: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20190617092710.GB3764@ubuntu>
References: <20190529013320.GA3307@zhanggen-UX430UQ>
	<fcf2c3c0-e479-9e74-59d5-79cd2a0bade6@acm.org>
	<20190529152443.GA4076@zhanggen-UX430UQ>
	<20190530161103.GA30026@redhat.com>
	<20190606092725.GA21792@zhanggen-UX430UQ>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190606092725.GA21792@zhanggen-UX430UQ>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Mon, 17 Jun 2019 09:27:17 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]);
	Mon, 17 Jun 2019 09:27:17 +0000 (UTC) for IP:'209.85.210.196'
	DOMAIN:'mail-pf1-f196.google.com'
	HELO:'mail-pf1-f196.google.com' FROM:'blackgod016574@gmail.com'
	RCPT:''
X-RedHat-Spam-Score: 0.143  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
	SPF_PASS) 209.85.210.196 mail-pf1-f196.google.com 209.85.210.196
	mail-pf1-f196.google.com <blackgod016574@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.41
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 18 Jun 2019 03:15:24 -0400
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Tue, 18 Jun 2019 07:16:47 +0000 (UTC)

On Thu, Jun 06, 2019 at 05:27:25PM +0800, Gen Zhang wrote:
> On Thu, May 30, 2019 at 12:11:03PM -0400, Mike Snitzer wrote:
> > On Wed, May 29 2019 at 11:24am -0400,
> > Gen Zhang <blackgod016574@gmail.com> wrote:
> > 
> > > On Wed, May 29, 2019 at 05:23:53AM -0700, Bart Van Assche wrote:
> > > > On 5/28/19 6:33 PM, Gen Zhang wrote:
> > > > > In drivers/md/dm-init.c, kstrndup() is incorrectly used twice.
> > > > > 
> > > > > It should be: char *kstrndup(const char *s, size_t max, gfp_t gfp);
> > > > 
> > > > Should the following be added to this patch?
> > > > 
> > > > Fixes: 6bbc923dfcf5 ("dm: add support to directly boot to a mapped
> > > > device") # v5.1.
> > > > Cc: stable
> > > > 
> > > > Thanks,
> > > > 
> > > > Bart.
> > > Personally, I am not quite sure about this question, because I am not 
> > > the maintainer of this part.
> > 
> > Yes, it should have the tags Bart suggested.
> > 
> > I'll take care it.
> > 
> > Thanks,
> > Mike
> Hi,
> Is there any updates about this patch? I want to check if it is apllied
> beacause I have to write it down in my paper and the deadline is close.
> 
> Thanks
> Gen
Could anyone look into this patch? It's not updated for about 20 days.
And I am really on a deadline to get this patch applied.

Thanks
Gen

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
