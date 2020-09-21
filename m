Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 399C8271FB8
	for <lists+dm-devel@lfdr.de>; Mon, 21 Sep 2020 12:09:27 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-QiYWyMRYPaGgi7uwVesfAw-1; Mon, 21 Sep 2020 06:09:24 -0400
X-MC-Unique: QiYWyMRYPaGgi7uwVesfAw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC139107464D;
	Mon, 21 Sep 2020 10:09:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B00E160C11;
	Mon, 21 Sep 2020 10:09:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 41EF3183D041;
	Mon, 21 Sep 2020 10:09:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08LA92Pn031750 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 21 Sep 2020 06:09:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 31042202450A; Mon, 21 Sep 2020 10:09:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2BD5E2024508
	for <dm-devel@redhat.com>; Mon, 21 Sep 2020 10:09:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DF8968007DF
	for <dm-devel@redhat.com>; Mon, 21 Sep 2020 10:08:59 +0000 (UTC)
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-358-h74IZdwcOhKFKoPAnaEz3Q-1; Mon, 21 Sep 2020 06:08:55 -0400
X-MC-Unique: h74IZdwcOhKFKoPAnaEz3Q-1
Received: by mail-ot1-f67.google.com with SMTP id e23so11801607otk.7;
	Mon, 21 Sep 2020 03:08:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=C2U9zgdNA+W5z39mxrnSClctTCx07o8njSeYRiDkxUQ=;
	b=oWCTKW18bKDB75HMUd+eVo36C/iKZpIH1F/1cMvkwoz2woAtK0Ylz4+lCtGcd6UUWy
	a9fAR+AOYpAT2YFmIQyiJTmwmaOGK80lX5lM1/7ZqhirWmBDq1KVm+4Ufpl55ewDzetL
	ntIFf8dRDmKFT2RwKas5QCyWRLDs86i+AUJAC53NhS6dg4gKyFuL0Chq7O+IAmWMdZvC
	srQO2yZNNBzIIrlEJykf9WFNNgVePZczMAIQseOyDwKD0EHPaGqc1vU18clrJr+PVWOu
	MNu5MQ95nj6nUVLIAxcT/DINtT1DZyP7tmST6rlHYGokrN5/ne3F0XtY3IMs3QYELQeG
	aMsg==
X-Gm-Message-State: AOAM531DSdnpaWkJFG02i8+QAq89Pdg1Sc2tIQRCHqx3Ceb2OoR5+6nZ
	mS8N1RQhSiTAX1u2ptPlMzGRB8FvZI8mFPqmOcA=
X-Google-Smtp-Source: ABdhPJx0z6nJuof9O9shP/JtBfaIqTwWgK7RVeG7KPf2KNQd6Y85WoyMiJQvHvcs+fN+TsY5UDMK5YpXqSLo0OHyosg=
X-Received: by 2002:a9d:3b76:: with SMTP id
	z109mr31653937otb.250.1600682934646; 
	Mon, 21 Sep 2020 03:08:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200921010359.GO3027113@arch-chirva.localdomain>
	<CA+G9fYtCg2KjdB2oBUDJ2DKAzUxq3u8ZnMY9Et-RG9Pnrmuf9w@mail.gmail.com>
	<20200921073218.GA3142611@kroah.com>
	<20200921095035.GC5862@quack2.suse.cz>
In-Reply-To: <20200921095035.GC5862@quack2.suse.cz>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 21 Sep 2020 12:08:43 +0200
Message-ID: <CAMuHMdX871H5zqgb877Tw3N6PczpXTvnbCGRt++4udNpf8Oftg@mail.gmail.com>
To: Jan Kara <jack@suse.cz>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: Dave Jiang <dave.jiang@intel.com>, Mike Snitzer <snitzer@redhat.com>,
	"linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	kernel list <linux-kernel@vger.kernel.org>,
	linux- stable <stable@vger.kernel.org>, dm-devel@redhat.com,
	Stuart Little <achirvasub@gmail.com>,
	Adrian Huang <ahuang12@lenovo.com>, lkft-triage@lists.linaro.org,
	Vishal Verma <vishal.l.verma@intel.com>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Dan Williams <dan.j.williams@intel.com>, Ira Weiny <ira.weiny@intel.com>
Subject: Re: [dm-devel]
	=?utf-8?q?PROBLEM=3A_5=2E9=2E0-rc6_fails_to_compile_du?=
	=?utf-8?b?ZSB0byAncmVkZWZpbml0aW9uIG9mIOKAmGRheF9zdXBwb3J0ZWTigJkn?=
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Honza,

On Mon, Sep 21, 2020 at 11:54 AM Jan Kara <jack@suse.cz> wrote:
> On Mon 21-09-20 09:32:18, Greg KH wrote:
> > On Mon, Sep 21, 2020 at 11:34:17AM +0530, Naresh Kamboju wrote:
> > > On Mon, 21 Sep 2020 at 06:34, Stuart Little <achirvasub@gmail.com> wrote:
> > > > I am trying to compile for an x86_64 machine (Intel(R) Core(TM) i7-7500U CPU @ 2.70GHz). The config file I am currently using is at
> > > >
> > > > https://termbin.com/xin7
> > > >
> > > > The build for 5.9.0-rc6 fails with the following errors:
> > > >
> > >
> > > arm and mips allmodconfig build breaks due to this error.
> >
> > all my local builds are breaking now too with this :(
> >
> > Was there a proposed patch anywhere for this?
>
> Attached patch should fix the build breakage. I'm sorry for that.

Thanks, this fixes my m68k build issues:
Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

