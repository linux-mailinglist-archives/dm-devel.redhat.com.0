Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 84FC61757B0
	for <lists+dm-devel@lfdr.de>; Mon,  2 Mar 2020 10:53:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583142800;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BMdBW3BgSsoXgGVuW/eCNCRseiaZFTee6XgdNiLNrgE=;
	b=Nsed6/orio8oAV39ic1HQXK4BGhJTne+4Mf8hMrSWKYsogpizwALKy3/SF8DRsu3N4u4+F
	1jXIVELOUOXSOxZK2+27JaK75Z5zzmXlzpLv6ySr3wuMyxjjnZhxnUi117IbJWSx74hXi1
	aDgem8nr0PIzLmlY516drblb+aKz9ZU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-fthFQU4zOtSX88LOEruIiQ-1; Mon, 02 Mar 2020 04:53:17 -0500
X-MC-Unique: fthFQU4zOtSX88LOEruIiQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6BFEA800D6C;
	Mon,  2 Mar 2020 09:53:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B772992D00;
	Mon,  2 Mar 2020 09:53:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7464218089C8;
	Mon,  2 Mar 2020 09:53:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01T9HCIs024991 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 29 Feb 2020 04:17:12 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id AB38B120EA7; Sat, 29 Feb 2020 09:17:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A6209121154
	for <dm-devel@redhat.com>; Sat, 29 Feb 2020 09:17:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F9CB8007AC
	for <dm-devel@redhat.com>; Sat, 29 Feb 2020 09:17:10 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-182-uIfFLNpnOP-LfxkpDQFL8A-1; Sat, 29 Feb 2020 04:17:06 -0500
X-MC-Unique: uIfFLNpnOP-LfxkpDQFL8A-1
Received: by mail-wm1-f66.google.com with SMTP id f15so5969213wml.3;
	Sat, 29 Feb 2020 01:17:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=84l+/iPVMM8/hLUieRf6a7Y3yljDnv4PnRrTq7Jpkjg=;
	b=eoQvKDM3It7UQeKo7qJi2xOpOWXSK3QZmaQ4Doe1Gf2rCMiQAFUYhzc2DmObXojUHi
	Qxt7/frvxDcLkE0RZp0U62kRvRhow1fbkQyOAISJa9f2EFTVr67JSa696rcCLL85VW3+
	KYmdNuKjdpaulYi1QJW2mXFpUpvCeMyFqwghEqTEChQ+7JCZ9QzeVUnmc3RLM/NYzCJ8
	BYeWNmUr72Rbp2EpX2wBi0l9NhIHSqvr1/1AmTE+7Ol0eRch0aDjDpF584blkJifRVXM
	s2wY819ozsjD6suVLg/s5I9g1Zd+0r5bugOyM7PIXNTxk8NTExUPkPpPENJ2sSekm0Yd
	cV1g==
X-Gm-Message-State: APjAAAW5+7ZaNvRxNLZZNb+czKjP3Ed+LyGbeCLlncp7EDLfZeOTwFTE
	g5o7AQxbLAej/ZskbjdqZeXxhofFFKD8WN0iLF2b/JXqV7I=
X-Google-Smtp-Source: APXvYqxfLRiVrnYhDu4x+AqoqT6WXSX/Yp2zDg70IB8IAjbVVRQuJ0ZHm+nq/8o1RcPnF9HGEur2CkpJXILJQTL0jqQ=
X-Received: by 2002:a1c:a789:: with SMTP id q131mr9556538wme.127.1582967824944;
	Sat, 29 Feb 2020 01:17:04 -0800 (PST)
MIME-Version: 1.0
References: <20200228163456.1587-1-vgoyal@redhat.com>
In-Reply-To: <20200228163456.1587-1-vgoyal@redhat.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Sat, 29 Feb 2020 10:16:53 +0100
Message-ID: <CAM9Jb+j46n3Ykca3_F0zb-7U1M5C8KmmH+3uzB1z7MqH60mQBA@mail.gmail.com>
To: Vivek Goyal <vgoyal@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01T9HCIs024991
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 02 Mar 2020 04:53:00 -0500
Cc: linux-nvdimm@lists.01.org, david@fromorbit.com, hch@infradead.org,
	dm-devel@redhat.com, linux-fsdevel@vger.kernel.org,
	dan.j.williams@intel.com
Subject: Re: [dm-devel] [PATCH v6 0/6] dax/pmem: Provide a dax operation to
	zero page range
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Vivek,

>
> Hi,
>
> This is V6 of patches. These patches are also available at.

Looks like cover letter is missing the motivation for the patchset.
Though I found it in previous posting. Its good to add it in the series
for anyone joining the discussion at later stages.

Thanks,
Pankaj

>
> Changes since V5:
>
> - Dan Williams preferred ->zero_page_range() to only accept PAGE_SIZE
>   aligned request and clear poison only on page size aligned zeroing. So
>   I changed it accordingly.
>
> - Dropped all the modifications which were required to support arbitrary
>   range zeroing with-in a page.
>
> - This patch series also fixes the issue where "truncate -s 512 foo.txt"
>   will fail if first sector of file is poisoned. Currently it succeeds
>   and filesystem expectes whole of the filesystem block to be free of
>   poison at the end of the operation.
>
> Christoph, I have dropped your Reviewed-by tag on 1-2 patches because
> these patches changed substantially. Especially signature of of
> dax zero_page_range() helper.
>
> Thanks
> Vivek
>
> Vivek Goyal (6):
>   pmem: Add functions for reading/writing page to/from pmem
>   dax, pmem: Add a dax operation zero_page_range
>   s390,dcssblk,dax: Add dax zero_page_range operation to dcssblk driver
>   dm,dax: Add dax zero_page_range operation
>   dax: Use new dax zero page method for zeroing a page
>   dax,iomap: Add helper dax_iomap_zero() to zero a range
>
>  drivers/dax/super.c           | 20 ++++++++
>  drivers/md/dm-linear.c        | 18 +++++++
>  drivers/md/dm-log-writes.c    | 17 ++++++
>  drivers/md/dm-stripe.c        | 23 +++++++++
>  drivers/md/dm.c               | 30 +++++++++++
>  drivers/nvdimm/pmem.c         | 97 ++++++++++++++++++++++-------------
>  drivers/s390/block/dcssblk.c  | 15 ++++++
>  fs/dax.c                      | 59 ++++++++++-----------
>  fs/iomap/buffered-io.c        |  9 +---
>  include/linux/dax.h           | 21 +++-----
>  include/linux/device-mapper.h |  3 ++
>  11 files changed, 221 insertions(+), 91 deletions(-)
>
> --
> 2.20.1
> _______________________________________________
> Linux-nvdimm mailing list -- linux-nvdimm@lists.01.org
> To unsubscribe send an email to linux-nvdimm-leave@lists.01.org


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

