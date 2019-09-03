Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A97EA727C
	for <lists+dm-devel@lfdr.de>; Tue,  3 Sep 2019 20:19:58 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 52FB43018ED0;
	Tue,  3 Sep 2019 18:19:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E769A60606;
	Tue,  3 Sep 2019 18:19:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6DEFEC593;
	Tue,  3 Sep 2019 18:19:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x83IJRhG022504 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 3 Sep 2019 14:19:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 45E835C22C; Tue,  3 Sep 2019 18:19:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A37BF5C220;
	Tue,  3 Sep 2019 18:19:24 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EB2B581DE3;
	Tue,  3 Sep 2019 18:19:23 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id u16so18533891wrr.0;
	Tue, 03 Sep 2019 11:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Ty/2ohLAJ+2sCNPsz6Mg9g82ZAcXCLPeRSTUh8dn1AM=;
	b=iXrN3Q7PNVG79k4/QPwtJd360wJBFRowaCrtFARluncD92iaxPMac9rPX4B8Hxlta6
	u/egCzq2FHk7WjWNT5OjHCutDCAyvbBIMEMQuj8Uk4fIXVLKHzupt38V5eoEGLwnfxwW
	SqBXpSsY/Zq0zJG1z5wQjb1fmAE3V7w/wzzAZ519iQse6X2qAu5JHAI73GwS2t32czqK
	aEyRcgYkrUFclz9SJ+tw3xs2406lVI/hppCdyT62DYo33sOUME/5kqeaSlong/0UwJNK
	BC39yQeVjmmfS/aYtMtAzcaVCNQrjnTBP1j/Srlo1GRn0raysle8n1hJupyIU46tYxsy
	mumA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Ty/2ohLAJ+2sCNPsz6Mg9g82ZAcXCLPeRSTUh8dn1AM=;
	b=Y1zrPwECYUx0cqSQ1S/F9Nq0ZGXbXgzrHN+Pwv/Q5y8ykRW4Q8CX0j3YtEI/3NUP6K
	0ZJs1yV8BxqJJqzf3ZenvjPR8SEjX8n+rsa8ypYScurNP+F2Pk6h0Fm1fXuWCLmSxnxZ
	pjhR6G8fSzCelTUS+pxfo76N9ae0OhvGBRB36AEynOYJu8SOtSi848t4qJ/dyF5FKYHQ
	lrAD5fKC537BoTEhxMeQKEDnCoUw9gVXGDrpBqQ0SBew1+0KkPRUvFoWOg5L1ajVa7Ry
	2ru1TwV6oV9GN9ImQfJSAQdA6vy/I7YFijFQnbYaweKKu7NKZouoq45JQFu0ESxVHd3P
	nUYQ==
X-Gm-Message-State: APjAAAWoGPZTS7jQV4sKWcdjQ0pwvEhNpFLffV5uQ2UgfuBl7t6kb74p
	SyrHHO4EQaSyVH/miPiZOg==
X-Google-Smtp-Source: APXvYqxlHBA49WV+BHVeO2PilKn9QU1HiFxpBtiAo0xzOr9c+REPpHiXHtdsI/PxDenk0UyGl0Lj6A==
X-Received: by 2002:adf:fad0:: with SMTP id a16mr1790618wrs.195.1567534762701; 
	Tue, 03 Sep 2019 11:19:22 -0700 (PDT)
Received: from avx2 ([46.53.254.228]) by smtp.gmail.com with ESMTPSA id
	t14sm19292468wrs.58.2019.09.03.11.19.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Sep 2019 11:19:22 -0700 (PDT)
Date: Tue, 3 Sep 2019 21:19:20 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: Valentin Schneider <valentin.schneider@arm.com>
Message-ID: <20190903181920.GA22358@avx2>
References: <20190902210558.GA23013@avx2>
	<d8ad0be1-4ed7-df74-d415-2b1c9a44bac7@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d8ad0be1-4ed7-df74-d415-2b1c9a44bac7@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 03 Sep 2019 18:19:24 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Tue, 03 Sep 2019 18:19:24 +0000 (UTC) for IP:'209.85.221.67'
	DOMAIN:'mail-wr1-f67.google.com' HELO:'mail-wr1-f67.google.com'
	FROM:'adobriyan@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.1  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.221.67 mail-wr1-f67.google.com 209.85.221.67
	mail-wr1-f67.google.com <adobriyan@gmail.com>
X-Scanned-By: MIMEDefang 2.83 on 10.5.110.25
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, peterz@infradead.org,
	aarcange@redhat.com, linux-kernel@vger.kernel.org,
	rcu@vger.kernel.org, dm-devel@redhat.com, mingo@redhat.com
Subject: Re: [dm-devel] [PATCH] sched: make struct task_struct::state 32-bit
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Tue, 03 Sep 2019 18:19:56 +0000 (UTC)

On Tue, Sep 03, 2019 at 06:29:06PM +0100, Valentin Schneider wrote:
> On 02/09/2019 22:05, Alexey Dobriyan wrote:
> > 32-bit accesses are shorter than 64-bit accesses on x86_64.
> > Nothing uses 64-bitness of ->state.

> It looks like you missed a few places. There's a long prev_state in
> sched/core.c::finish_task_switch() for instance.
> 
> I suppose that's where coccinelle oughta help but I'm really not fluent
> in that. Is there a way to make it match p.state accesses with p task_struct?
> And if so, can we make it change the type of the variable being read from
> / written to?

Coccinelle is interesting: basic

	- foo
	+ bar

doesn't find "foo" in function arguments.

I'm scared of coccinelle.

> How did you come up with this changeset, did you pickaxe for some regexp?

No, manually, backtracking up to the call chain.
Maybe I missed a few places.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
