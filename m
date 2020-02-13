Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 31F421659D3
	for <lists+dm-devel@lfdr.de>; Thu, 20 Feb 2020 10:06:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582189610;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bbZtI0sT0Ut5JeWDIvYY1ukB7gWFBL4QOo/Xf6yMuAk=;
	b=g6VEy9TnYGbrX6OXRVFeBzJ05WaM72ThtHJyfHrPVnHL5wkeBNooFmzKY83qGGMmh4WDUA
	torXsq1nLo3iZaJM4BZN3qinMytXQGSwl8Is/iMLacNKpIlecEAWZPp1m50A4/OvKNycyh
	ybjLH6e8fAraHqoo3hskS1ga4WP/Qp0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-lh9BkpM6MkGhjqzWE6s-IA-1; Thu, 20 Feb 2020 04:06:46 -0500
X-MC-Unique: lh9BkpM6MkGhjqzWE6s-IA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0AC318AB2DD;
	Thu, 20 Feb 2020 09:06:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B4DA28B741;
	Thu, 20 Feb 2020 09:06:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3F38E87A9B;
	Thu, 20 Feb 2020 09:06:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01DNh8QK011935 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 13 Feb 2020 18:43:09 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D6A21113F6F; Thu, 13 Feb 2020 23:43:08 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D2336120EDD
	for <dm-devel@redhat.com>; Thu, 13 Feb 2020 23:43:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C675E101D25D
	for <dm-devel@redhat.com>; Thu, 13 Feb 2020 23:43:04 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-416-5Bq2ZDFBM9yvZWDHFEtVUQ-1;
	Thu, 13 Feb 2020 18:43:00 -0500
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
	[209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 8080924676;
	Thu, 13 Feb 2020 23:42:58 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id o15so8635232ljg.6;
	Thu, 13 Feb 2020 15:42:58 -0800 (PST)
X-Gm-Message-State: APjAAAXKyu3bgN7AD8KaN/StiCbuKTTcc1BmrDZDERKRHpKBs3x5Hjt9
	8JyRIDdrHS1327JKOXgxpq8ilKtZFMXhOR9/V4g=
X-Google-Smtp-Source: APXvYqyMTY5BiLP/4jYWIAjsVYrB8h/h7Ek++s0e6pxXO6PqFXN3+xu4BLWRYI1/YeOOm0rQ6bFf5+MVwGHlLSORLHc=
X-Received: by 2002:a2e:a553:: with SMTP id e19mr168246ljn.64.1581637376641;
	Thu, 13 Feb 2020 15:42:56 -0800 (PST)
MIME-Version: 1.0
References: <20200213141823.2174236-1-mplaneta@os.inf.tu-dresden.de>
	<20200213153645.GA11313@redhat.com>
	<82715589-8b59-5cfd-a32f-1e57871327fe@os.inf.tu-dresden.de>
In-Reply-To: <82715589-8b59-5cfd-a32f-1e57871327fe@os.inf.tu-dresden.de>
From: Song Liu <song@kernel.org>
Date: Thu, 13 Feb 2020 15:42:45 -0800
X-Gmail-Original-Message-ID: <CAPhsuW70_HtmxA0qmUVLk4L+Ls5t=0j0k5D4fbT4fNY59L2UpQ@mail.gmail.com>
Message-ID: <CAPhsuW70_HtmxA0qmUVLk4L+Ls5t=0j0k5D4fbT4fNY59L2UpQ@mail.gmail.com>
To: Maksym Planeta <mplaneta@os.inf.tu-dresden.de>
X-MC-Unique: 5Bq2ZDFBM9yvZWDHFEtVUQ-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01DNh8QK011935
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 20 Feb 2020 04:05:51 -0500
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Mike Snitzer <snitzer@redhat.com>,
	Chao Yu <chao@kernel.org>, Zhou Wang <wangzhou1@hisilicon.com>,
	open list <linux-kernel@vger.kernel.org>,
	linux-raid <linux-raid@vger.kernel.org>, dm-devel@redhat.com,
	linux-crypto@vger.kernel.org, Gao Xiang <xiang@kernel.org>,
	linux-erofs@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
	Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] Remove WQ_CPU_INTENSIVE flag from unbound wq's
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

On Thu, Feb 13, 2020 at 8:19 AM Maksym Planeta
<mplaneta@os.inf.tu-dresden.de> wrote:
>
>
>
> On 13/02/2020 16:36, Mike Snitzer wrote:
> > On Thu, Feb 13 2020 at  9:18am -0500,
> > Maksym Planeta <mplaneta@os.inf.tu-dresden.de> wrote:
> >
> >> The documentation [1] says that WQ_CPU_INTENSIVE is "meaningless" for
> >> unbound wq. I remove this flag from places where unbound queue is
> >> allocated. This is supposed to improve code readability.
> >>
> >> 1. https://www.kernel.org/doc/html/latest/core-api/workqueue.html#flags
> >>
> >> Signed-off-by: Maksym Planeta <mplaneta@os.inf.tu-dresden.de>
> >
> > What the Documentation says aside, have you cross referenced with the
> > code?  And/or have you done benchmarks to verify no changes?
> >
>
> It seems so from the code. Although, I'm not 100% confident. I did not
> run benchmarks, instead I relied that on the assumption that
> documentation is correct.

>From the code, WQ_CPU_INTENSIVE is only used to set
WORKER_CPU_INTENSIVE, and WORKER_CPU_INTENSIVE is only used
as part of WORKER_NOT_RUNNING, which includes WORKER_UNBOUND.
So, I agree that with current code, WQ_CPU_INTENSIVE with WQ_UNBOUND
is same as WQ_UNBOUND alone.

However, I don't think it is necessary to make the changes. They don't really
improve readability of the code.

Thanks,
Song


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

