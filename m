Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 29C942702B0
	for <lists+dm-devel@lfdr.de>; Fri, 18 Sep 2020 18:55:49 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-0EiLOk_yMg2PQcGGbJ_oSg-1; Fri, 18 Sep 2020 12:55:45 -0400
X-MC-Unique: 0EiLOk_yMg2PQcGGbJ_oSg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A7004801AC8;
	Fri, 18 Sep 2020 16:55:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5013419D6C;
	Fri, 18 Sep 2020 16:55:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 702B8183D041;
	Fri, 18 Sep 2020 16:55:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08IGt9eZ019903 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 18 Sep 2020 12:55:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8428D109EF86; Fri, 18 Sep 2020 16:55:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F6AB109EF88
	for <dm-devel@redhat.com>; Fri, 18 Sep 2020 16:55:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BF49C900C68
	for <dm-devel@redhat.com>; Fri, 18 Sep 2020 16:55:06 +0000 (UTC)
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-423-ov2mctWsPVSFLea0_jnL7Q-1; Fri, 18 Sep 2020 12:55:04 -0400
X-MC-Unique: ov2mctWsPVSFLea0_jnL7Q-1
Received: by mail-ed1-f65.google.com with SMTP id t16so6739126edw.7
	for <dm-devel@redhat.com>; Fri, 18 Sep 2020 09:55:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yxwRMmZAvscI9qLISrOKxKWDWXBsK0Qiq++otHhpMpM=;
	b=QXEXwG0bQTeYoSYKnHYpEhH/9ym3Ls8hEriA3cp7rmSrIbpHIyAOcdc81PsdTV6xNK
	8N6hhyllJHtARbaec2tw1M6jEGiB7GbBI1SAJxYF+cwaxpLxYHvOMDoX0uf2PfGD2sPs
	AS5A8rmkuV+hMPKkiroWbmhTfcGzIOcGEZaWIta1OLGqkidMNGkdn6wF3TpZhpjH4lHf
	hkTN9uGJcJBtRWo4Okj2du5CBr0iQxHI2jPOqHgDkSp3OnwqYA9CCU5qCHEQjYecZZuN
	C+ZtzmKR7fdalhqPtHsgv/Tb94n6OXra1BM2gdFPjNPKTeXYP3YwHFKM/FcgeVcRMAFb
	Bxtg==
X-Gm-Message-State: AOAM530vSqC6cZvX1w4xY22WBD7X1BbBdbHFP497msqSUYy8xGIrwyEs
	vDQen/Ucr3FSEmPanm+1K44T1zx1mLjdlJUpZEnkIA==
X-Google-Smtp-Source: ABdhPJxcLHTp2HmWlgI7Su041TxmNFgVD/jngcdBcxMjvp5IOfJeNJy8OR2y4k4Bfa6ELWveIGOQjFysEqiHQiktakY=
X-Received: by 2002:aa7:c511:: with SMTP id o17mr40445469edq.300.1600448103080;
	Fri, 18 Sep 2020 09:55:03 -0700 (PDT)
MIME-Version: 1.0
References: <160040692945.25320.13233625491405115889.stgit@dwillia2-desk3.amr.corp.intel.com>
	<20200918153041.GN7954@magnolia>
In-Reply-To: <20200918153041.GN7954@magnolia>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 18 Sep 2020 09:54:51 -0700
Message-ID: <CAPcyv4ii+NWnJhLWwz=Z+2aAJ=DdjwQoqPC+hO88CsM2ub5FEw@mail.gmail.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
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
Cc: Jan Kara <jack@suse.cz>, Mike Snitzer <snitzer@redhat.com>,
	linux-nvdimm <linux-nvdimm@lists.01.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	stable <stable@vger.kernel.org>,
	device-mapper development <dm-devel@redhat.com>,
	Adrian Huang <ahuang12@lenovo.com>,
	Mikulas Patocka <mpatocka@redhat.com>, "Weiny, Ira" <ira.weiny@intel.com>
Subject: Re: [dm-devel] [PATCH v2] dm: Call proper helper to determine dax
	support
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

On Fri, Sep 18, 2020 at 8:31 AM Darrick J. Wong <darrick.wong@oracle.com> wrote:
>
> On Thu, Sep 17, 2020 at 10:30:03PM -0700, Dan Williams wrote:
> > From: Jan Kara <jack@suse.cz>
> >
> > DM was calling generic_fsdax_supported() to determine whether a device
> > referenced in the DM table supports DAX. However this is a helper for "leaf" device drivers so that
> > they don't have to duplicate common generic checks. High level code
> > should call dax_supported() helper which that calls into appropriate
> > helper for the particular device. This problem manifested itself as
> > kernel messages:
> >
> > dm-3: error: dax access failed (-95)
> >
> > when lvm2-testsuite run in cases where a DM device was stacked on top of
> > another DM device.
>
> Is there somewhere where it is documented which of:
>
> bdev_dax_supported, generic_fsdax_supported, and dax_supported
>
> one is supposed to use for a given circumstance?

generic_fsdax_supported should be private to device drivers populating
their dax_operations. I think it deserves a rename at this point.
dax_supported() knows how to route through multiple layers of stacked
block-devices to ask the "is dax supported" question at each level.

> I guess the last two can test a given range w/ blocksize; the first one
> only does blocksize; and the middle one also checks with whatever fs
> might be mounted? <shrug>
>
> (I ask because it took me a while to figure out how to revert correctly
> the brokenness in rc3-5 that broke my nightly dax fstesting.)

Again, apologies for that.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

