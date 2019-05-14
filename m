Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 943931E44E
	for <lists+dm-devel@lfdr.de>; Wed, 15 May 2019 00:13:35 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5CF7CCCFE8;
	Tue, 14 May 2019 22:13:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EFA825D6A6;
	Tue, 14 May 2019 22:13:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D590F18089CB;
	Tue, 14 May 2019 22:13:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4EMD6fs017205 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 14 May 2019 18:13:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D2AC55D725; Tue, 14 May 2019 22:13:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD42B5D724
	for <dm-devel@redhat.com>; Tue, 14 May 2019 22:13:04 +0000 (UTC)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com
	[209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CBCE7307D910
	for <dm-devel@redhat.com>; Tue, 14 May 2019 22:13:02 +0000 (UTC)
Received: by mail-vs1-f44.google.com with SMTP id l20so378175vsp.3
	for <dm-devel@redhat.com>; Tue, 14 May 2019 15:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wVIzeix7iLELUYXl5m49E5wdhPumzJ5vp2cjgvebQJQ=;
	b=ULnWl7ReV9rhaVd9pYIsvgg33E+PGKtMfc+ur2c8hcDVjhewK0cqzVQ/57ij9VsgjQ
	5Y69oZ7Mzh9fQPFmr2uXOzsFsmL/k9mCx144O+AehmgtTh59VxK83LKZqOWIeKnin8wQ
	0IIZse0BJQXufZcusH2jn6JvGYIO8IsvjbGNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wVIzeix7iLELUYXl5m49E5wdhPumzJ5vp2cjgvebQJQ=;
	b=eHql1KaDEk0utKXq7lZFAbNYEcLRz1U41TYCHC/KGGseKt/ddFP2MJRGycC+rs9cAy
	CyiGAuiRSQtqwmBlOF+wzMkvkzL3eIBeXbFBwbTW1xPIF711R38GyL8tHSbwTtx6AjwE
	f/Tqr6m1qylm9KNt+KFoMeh/lk15+9HeEisfdQLEpBqz7+B7MCTIl4MWfMkmRZfgJe7B
	zs+Sh1DuEFHkeYL1O1VwGk1utmBq6u8cJVaJARhHvFhm/dA+S8dlYA4LDcjLFmEZDCvF
	Xc+P2jL1tIggCeBvXovmQFvol34oNFPhQuGzopFgXiE0/a3fAIBGO4GUDUNJ2o4SUG+s
	m63A==
X-Gm-Message-State: APjAAAV/0CtTihd3FdkK6FoMd3H+k7dnTbGDVGkzQliwgayHvIjdn5pj
	eEo2fE8S1kMBStpuYmo9BBb7ZsY2FLw=
X-Google-Smtp-Source: APXvYqwz8j4pVAOiJOarV/2rmCRJkpq2BEOwsx/NSnOiuzDuecbVETg1k0r3bBUOnrR2WPjF5LME7A==
X-Received: by 2002:a67:fa8e:: with SMTP id f14mr1482630vsq.17.1557871981733; 
	Tue, 14 May 2019 15:13:01 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com.
	[209.85.217.52])
	by smtp.gmail.com with ESMTPSA id t68sm17232vkd.12.2019.05.14.15.13.00
	for <dm-devel@redhat.com>
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 May 2019 15:13:01 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id g187so363007vsc.8
	for <dm-devel@redhat.com>; Tue, 14 May 2019 15:13:00 -0700 (PDT)
X-Received: by 2002:a67:b348:: with SMTP id b8mr10745210vsm.144.1557871980393; 
	Tue, 14 May 2019 15:13:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAD=FV=VOAjgdrvkK8YKPP-8zqwPpo39rA43JH2BCeYLB0UkgAQ@mail.gmail.com>
	<20190513171519.GA26166@redhat.com>
	<CAD=FV=X7GDNoJVvRgBTDoVkf9UYA69B-rTY2G3888w=9iS=RtQ@mail.gmail.com>
	<20190514172938.GA31835@redhat.com>
In-Reply-To: <20190514172938.GA31835@redhat.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 14 May 2019 15:12:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VTn7OKOG03YDTjzDPJMYD7ar+HdswHb=VUHm_yp=8vMg@mail.gmail.com>
Message-ID: <CAD=FV=VTn7OKOG03YDTjzDPJMYD7ar+HdswHb=VUHm_yp=8vMg@mail.gmail.com>
To: Mike Snitzer <snitzer@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Tue, 14 May 2019 22:13:03 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Tue, 14 May 2019 22:13:03 +0000 (UTC) for IP:'209.85.217.44'
	DOMAIN:'mail-vs1-f44.google.com' HELO:'mail-vs1-f44.google.com'
	FROM:'dianders@chromium.org' RCPT:''
X-RedHat-Spam-Score: -0.112  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	SPF_PASS) 209.85.217.44 mail-vs1-f44.google.com 209.85.217.44
	mail-vs1-f44.google.com <dianders@chromium.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: Vito Caputo <vcaputo@pengaru.com>, LKML <linux-kernel@vger.kernel.org>,
	Tim Murray <timmurray@google.com>,
	Enric Balletbo i Serra <enric.balletbo@collabora.com>,
	dm-devel@redhat.com, Guenter Roeck <groeck@chromium.org>,
	Tejun Heo <tj@kernel.org>
Subject: Re: [dm-devel] Problems caused by dm crypt: use WQ_HIGHPRI for the
	IO and crypt workqueues
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Tue, 14 May 2019 22:13:33 +0000 (UTC)

Hi,

On Tue, May 14, 2019 at 10:29 AM Mike Snitzer <snitzer@redhat.com> wrote:

> > tl;dr: High priority (even without CPU_INTENSIVE) definitely causes
> > interference with my high priority work starving it for > 8 ms, but
> > dm-crypt isn't unique here--loopback devices also have problems.
>
> Well I read it all ;)
>
> I don't have a commit 37a186225a0c, the original commit in querstion is
> a1b89132dc4 right?

commit 37a186225a0c ("platform/chrome: cros_ec_spi: Transfer messages
at high priority") is only really relevant to my particular test case
of using cros_ec to reproduce the problem.


> But I think we need a deeper understanding from workqueue maintainers on
> what the right way forward is here.  I cc'd Tejun in my previous reply
> but IIRC he no longer looks after the workqueue code.
>
> I think it'd be good for you to work with the original author of commit
> a1b89132dc4 (Tim, on cc) to see if you can reach consensus on what works
> for both of your requirements.

Basically what I decided in the end was that the workqueue code didn't
offer enough flexibility in terms of priorities.  To get realtime
priority I needed to fallback to using kthread_create_worker() to
create my worker.  Presumably if you want something nicer than the
"min_nice" priority you get with the high priority workqueue flag then
you'd have to do something similar (but moving in the opposite
direction).


> Given 7 above, if your new "cros_ec at realtime" series fixes it.. ship
> it?

Yeah, that's the plan.  Right now I have
<https://lkml.kernel.org/r/20190514183935.143463-2-dianders@chromium.org>
but Guenter pointed out some embarrassing bugs in my patch so I'll
post up a v4 tomorrow.  I pointed to a Chrome OS review that has a
preview of my v4 if you for some reason can't wait.  That can be found
at <https://crrev.com/c/1612165>.


-Doug

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
