Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAAA44B4E6
	for <lists+dm-devel@lfdr.de>; Tue,  9 Nov 2021 22:46:45 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-kfM8f-D3NGqMpmpP9QZn7w-1; Tue, 09 Nov 2021 16:46:43 -0500
X-MC-Unique: kfM8f-D3NGqMpmpP9QZn7w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 237A9804141;
	Tue,  9 Nov 2021 21:46:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F03256A8A;
	Tue,  9 Nov 2021 21:46:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 588454EA2A;
	Tue,  9 Nov 2021 21:46:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A9L2c9M006639 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 9 Nov 2021 16:02:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5319F404727C; Tue,  9 Nov 2021 21:02:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F0B04047279
	for <dm-devel@redhat.com>; Tue,  9 Nov 2021 21:02:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 36DD685A5BE
	for <dm-devel@redhat.com>; Tue,  9 Nov 2021 21:02:38 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
	[209.85.210.182]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-10-rSP8iUTiPcWOk_EOKR2NpQ-1; Tue, 09 Nov 2021 16:02:34 -0500
X-MC-Unique: rSP8iUTiPcWOk_EOKR2NpQ-1
Received: by mail-pf1-f182.google.com with SMTP id c4so569001pfj.2
	for <dm-devel@redhat.com>; Tue, 09 Nov 2021 13:02:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NGCSLoiUEixbJUJjsAamjo0128u/1ab9KY+NrB7bwnI=;
	b=K9rMVoB0A0+6aauTivFMDVA61aF+K/2XrrsEPvkU4UBWuCoZA8ouTti40B90C8dwmZ
	9hFrnCQNK3mVDDN7ZbRjcHMxpd/1dhCNr3/Hc4+aoR97su9m6PXglCqMdXji4aNdWTMv
	EqpX0QxeSJsSXqZ5rlbwGYszdf9DlNatesxUf2F95s+MJgHE1qxdCKcFctj06wXdsqUS
	fsfgHDmGZOSObcH9WEZ462Ow8+r6OiMAg0K4/iU/cnWAnA63RIxKvzOmYuP90K6nJ5sT
	UqHMmUvt+7hzMJ9KazrkPtqcDPcg1ReqjJ+g3CmOiy9L0QPRVtUtI27q0u4iiOUucy1P
	GLXg==
X-Gm-Message-State: AOAM530Vv3hNbm59u8uGkMElEKGfDtGGlps6SZseNO8JYVN7Okj5KF7O
	bEuDJWUdsHxTqFOdEUaftx+OKC4DdeyppilYLv8cXg==
X-Google-Smtp-Source: ABdhPJxLkjcYAJ6xF4i22dGgcThaQc5MIlNV4NzhpLHAutoT4ZKPk8dFHjZwxwWusNLUT463Jmt8uLtznOEGS++66P4=
X-Received: by 2002:a05:6a00:140e:b0:444:b077:51ef with SMTP id
	l14-20020a056a00140e00b00444b07751efmr11438892pfu.61.1636491753212;
	Tue, 09 Nov 2021 13:02:33 -0800 (PST)
MIME-Version: 1.0
References: <20211106011638.2613039-1-jane.chu@oracle.com>
	<20211106011638.2613039-3-jane.chu@oracle.com>
	<YYoi2JiwTtmxONvB@infradead.org>
	<CAPcyv4hQrUEhDOK-Ys1_=Sxb8f+GJZvpKZHTUPKQvVMaMe8XMg@mail.gmail.com>
	<15f01d51-2611-3566-0d08-bdfbec53f88c@oracle.com>
In-Reply-To: <15f01d51-2611-3566-0d08-bdfbec53f88c@oracle.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 9 Nov 2021 13:02:23 -0800
Message-ID: <CAPcyv4gwbZ=Z6xCjDCASpkPnw1EC8NMAJDh9_sa3n2PAG5+zAA@mail.gmail.com>
To: Jane Chu <jane.chu@oracle.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-loop: dm-devel@redhat.com
Cc: Linux NVDIMM <nvdimm@lists.linux.dev>, Dave Jiang <dave.jiang@intel.com>,
	Mike Snitzer <snitzer@redhat.com>, "Darrick J. Wong" <djwong@kernel.org>,
	david <david@fromorbit.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Christoph Hellwig <hch@infradead.org>,
	device-mapper development <dm-devel@redhat.com>,
	Vivek Goyal <vgoyal@redhat.com>, Vishal L Verma <vishal.l.verma@intel.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, "Weiny,
	Ira" <ira.weiny@intel.com>, linux-xfs <linux-xfs@vger.kernel.org>,
	Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH v2 2/2] dax,
	pmem: Implement pmem based dax data recovery
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 9, 2021 at 11:59 AM Jane Chu <jane.chu@oracle.com> wrote:
>
> On 11/9/2021 10:48 AM, Dan Williams wrote:
> > On Mon, Nov 8, 2021 at 11:27 PM Christoph Hellwig <hch@infradead.org> wrote:
> >>
> >> On Fri, Nov 05, 2021 at 07:16:38PM -0600, Jane Chu wrote:
> >>>   static size_t pmem_copy_from_iter(struct dax_device *dax_dev, pgoff_t pgoff,
> >>>                void *addr, size_t bytes, struct iov_iter *i, int mode)
> >>>   {
> >>> +     phys_addr_t pmem_off;
> >>> +     size_t len, lead_off;
> >>> +     struct pmem_device *pmem = dax_get_private(dax_dev);
> >>> +     struct device *dev = pmem->bb.dev;
> >>> +
> >>> +     if (unlikely(mode == DAX_OP_RECOVERY)) {
> >>> +             lead_off = (unsigned long)addr & ~PAGE_MASK;
> >>> +             len = PFN_PHYS(PFN_UP(lead_off + bytes));
> >>> +             if (is_bad_pmem(&pmem->bb, PFN_PHYS(pgoff) / 512, len)) {
> >>> +                     if (lead_off || !(PAGE_ALIGNED(bytes))) {
> >>> +                             dev_warn(dev, "Found poison, but addr(%p) and/or bytes(%#lx) not page aligned\n",
> >>> +                                     addr, bytes);
> >>> +                             return (size_t) -EIO;
> >>> +                     }
> >>> +                     pmem_off = PFN_PHYS(pgoff) + pmem->data_offset;
> >>> +                     if (pmem_clear_poison(pmem, pmem_off, bytes) !=
> >>> +                                             BLK_STS_OK)
> >>> +                             return (size_t) -EIO;
> >>> +             }
> >>> +     }
> >>
> >> This is in the wrong spot.  As seen in my WIP series individual drivers
> >> really should not hook into copying to and from the iter, because it
> >> really is just one way to write to a nvdimm.  How would dm-writecache
> >> clear the errors with this scheme?
> >>
> >> So IMHO going back to the separate recovery method as in your previous
> >> patch really is the way to go.  If/when the 64-bit store happens we
> >> need to figure out a good way to clear the bad block list for that.
> >
> > I think we just make error management a first class citizen of a
> > dax-device and stop abstracting it behind a driver callback. That way
> > the driver that registers the dax-device can optionally register error
> > management as well. Then fsdax path can do:
> >
> >          rc = dax_direct_access(..., &kaddr, ...);
> >          if (unlikely(rc)) {
> >                  kaddr = dax_mk_recovery(kaddr);
>
> Sorry, what does dax_mk_recovery(kaddr) do?

I was thinking this just does the hackery to set a flag bit in the
pointer, something like:

return (void *) ((unsigned long) kaddr | DAX_RECOVERY)

>
> >                  dax_direct_access(..., &kaddr, ...);
> >                  return dax_recovery_{read,write}(..., kaddr, ...);
> >          }
> >          return copy_{mc_to_iter,from_iter_flushcache}(...);
> >
> > Where, the recovery version of dax_direct_access() has the opportunity
> > to change the page permissions / use an alias mapping for the access,
>
> again, sorry, what 'page permissions'?  memory_failure_dev_pagemap()
> changes the poisoned page mem_type from 'rw' to 'uc-' (should be NP?),
> do you mean to reverse the change?

Right, the result of the conversation with Boris is that
memory_failure() should mark the page as NP in call cases, so
dax_direct_access() needs to create a UC mapping and
dax_recover_{read,write}() would sink that operation and either return
the page to NP after the access completes, or convert it to WB if the
operation cleared the error.

> > dax_recovery_read() allows reading the good cachelines out of a
> > poisoned page, and dax_recovery_write() coordinates error list
> > management and returning a poison page to full write-back caching
> > operation when no more poisoned cacheline are detected in the page.
> >
>
> How about to introduce 3 dax_recover_ APIs:
>    dax_recover_direct_access(): similar to dax_direct_access except
>       it ignores error list and return the kaddr, and hence is also
>       optional, exported by device driver that has the ability to
>       detect error;
>    dax_recovery_read(): optional, supported by pmem driver only,
>       reads as much data as possible up to the poisoned page;

It wouldn't be a property of the pmem driver, I expect it would be a
flag on the dax device whether to attempt recovery or not. I.e. get
away from this being a pmem callback and make this a native capability
of a dax device.

>    dax_recovery_write(): optional, supported by pmem driver only,
>       first clear-poison, then write.
>
> Should we worry about the dm targets?

The dm targets after Christoph's conversion should be able to do all
the translation at direct access time and then dax_recovery_X can be
done on the resulting already translated kaddr.

> Both dax_recovery_read/write() are hooked up to dax_iomap_iter().

Yes.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

