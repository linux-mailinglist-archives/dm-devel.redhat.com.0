Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 29B19273AFE
	for <lists+dm-devel@lfdr.de>; Tue, 22 Sep 2020 08:33:25 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-qvwNEvD0PmScBcBiJIqcNw-1; Tue, 22 Sep 2020 02:33:22 -0400
X-MC-Unique: qvwNEvD0PmScBcBiJIqcNw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 662B6100670B;
	Tue, 22 Sep 2020 06:33:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 39D7C27BDC;
	Tue, 22 Sep 2020 06:33:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DC5831826D2C;
	Tue, 22 Sep 2020 06:33:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08LATinN003328 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 21 Sep 2020 06:29:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C8620112131F; Mon, 21 Sep 2020 10:29:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C3A581004043
	for <dm-devel@redhat.com>; Mon, 21 Sep 2020 10:29:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2643E800969
	for <dm-devel@redhat.com>; Mon, 21 Sep 2020 10:29:41 +0000 (UTC)
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-596-jJWHkwdTNA-szTC_pJZUzA-1; Mon, 21 Sep 2020 06:29:36 -0400
X-MC-Unique: jJWHkwdTNA-szTC_pJZUzA-1
Received: by mail-qt1-f193.google.com with SMTP id n18so11800991qtw.0;
	Mon, 21 Sep 2020 03:29:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=ha7uOpPsgSYW9Dzxfe8r1fOa9581cD52tuAWOWOVJgQ=;
	b=CH1qv6kA7iBJeUnxDJSJOrhWLZERd+ZrMcdcZW7aJDrT7xwlnxPm+OvSrwQFlWiKa7
	GYhkjJeRyP0SHYCX25/MS5RcBZ1Pjdfav+NdKC6s2y7aQlgvMuOLotviQouy7EY2srjD
	xmdIoxaOEQhaNeIBY55PNeq5mWKgxSnCcse3InX8kjKVzXl8yvWmE1ZHCc2dyqsESr1W
	tOPqtM4Oc+A9i56nZafa3szQUnqMaxtJfQsqNdOUk9KiLkOVlY5nAU9QaEXh0wfoUrJB
	Kk9K99VKIt9zGO+ur3SyKeON9zWTcedv7biUirW1PFT0YXrxC8m4UaTprJmA8bpLLcIJ
	ugxQ==
X-Gm-Message-State: AOAM531Owk7HmcSfrIvaDbXcWkwQ+Vru01wHgKZ4GcOXg9MobCcCc1Df
	xiwBEiNQDdPFvj4/qGS4FVkJ7e4kpPQ=
X-Google-Smtp-Source: ABdhPJyS7MgtwJ+ssdbtRNH5SJYuKINkDAEqZtCxruKBvMWxT7F7TZjyZ5h7mMWWPol4qvQ4hk36xQ==
X-Received: by 2002:aed:3bdc:: with SMTP id s28mr46154317qte.124.1600684176350;
	Mon, 21 Sep 2020 03:29:36 -0700 (PDT)
Received: from arch-chirva.localdomain
	(pool-68-133-6-220.bflony.fios.verizon.net. [68.133.6.220])
	by smtp.gmail.com with ESMTPSA id
	d5sm10328576qtm.36.2020.09.21.03.29.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 21 Sep 2020 03:29:35 -0700 (PDT)
Date: Mon, 21 Sep 2020 06:29:33 -0400
From: Stuart Little <achirvasub@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Message-ID: <20200921102933.GF3027080@arch-chirva.localdomain>
References: <20200921010359.GO3027113@arch-chirva.localdomain>
	<CA+G9fYtCg2KjdB2oBUDJ2DKAzUxq3u8ZnMY9Et-RG9Pnrmuf9w@mail.gmail.com>
	<20200921073218.GA3142611@kroah.com>
	<20200921095035.GC5862@quack2.suse.cz>
	<CAMuHMdX871H5zqgb877Tw3N6PczpXTvnbCGRt++4udNpf8Oftg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdX871H5zqgb877Tw3N6PczpXTvnbCGRt++4udNpf8Oftg@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 22 Sep 2020 02:32:23 -0400
Cc: Jan Kara <jack@suse.cz>, Mike Snitzer <snitzer@redhat.com>,
	"linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	kernel list <linux-kernel@vger.kernel.org>,
	linux- stable <stable@vger.kernel.org>, dm-devel@redhat.com,
	Adrian Huang <ahuang12@lenovo.com>, lkft-triage@lists.linaro.org,
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Confirmed: the patch fixed the build for me as well; thank you! 

On Mon, Sep 21, 2020 at 12:08:43PM +0200, Geert Uytterhoeven wrote:
> Hi Honza,
> 
> On Mon, Sep 21, 2020 at 11:54 AM Jan Kara <jack@suse.cz> wrote:
> > On Mon 21-09-20 09:32:18, Greg KH wrote:
> > > On Mon, Sep 21, 2020 at 11:34:17AM +0530, Naresh Kamboju wrote:
> > > > On Mon, 21 Sep 2020 at 06:34, Stuart Little <achirvasub@gmail.com> wrote:
> > > > > I am trying to compile for an x86_64 machine (Intel(R) Core(TM) i7-7500U CPU @ 2.70GHz). The config file I am currently using is at
> > > > >
> > > > > https://termbin.com/xin7
> > > > >
> > > > > The build for 5.9.0-rc6 fails with the following errors:
> > > > >
> > > >
> > > > arm and mips allmodconfig build breaks due to this error.
> > >
> > > all my local builds are breaking now too with this :(
> > >
> > > Was there a proposed patch anywhere for this?
> >
> > Attached patch should fix the build breakage. I'm sorry for that.
> 
> Thanks, this fixes my m68k build issues:
> Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

